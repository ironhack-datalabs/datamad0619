import webbrowser
import pandas as pd
import requests
import os

from dotenv import load_dotenv
load_dotenv()

if not "GOOGLE_KEY" in os.environ:
    raise ValueError("Necesitas una API key de Google")

gkey = os.environ["GOOGLE_KEY"]
'''def show(df):
    webbrowser.open("https://www.google.com/maps/search/?api=1&query="+df.index[0])'''

def draw_html(df_score, df_top5, df_norm_bis, dir_path):
    print("Ya casi esta...")
    places = [requests.get(f"https://maps.googleapis.com/maps/api/geocode/json?latlng={e}&key={gkey}").json()["results"][0] for e in df_norm_bis.index]
    
    html = """
    <html>
    <head>
        <style>
        

        body {
            margin: 0;
            padding: 0;
            font-family: "sans-serif";
        }

        header, footer{
            background-color: #474747;
            padding: 15px 5%;
            color: #fff;
            display: inline-flex;
            width: 90%;
        }
        
        header img, header p{
            display: inline-block;
        }
        header p {
            margin: auto 30px;
            font-size: 25px;
            font-weight: 600;
        }

        #content{
            padding: 30px 60px;
        }

        li {
            margin-top: 5px
        }
        
        h1{
            text-align: center;
        }
        [id^=map]{
            width: 80%;
            height: auto;
            margin: auto 20px
        }
        table{
            margin-bottom: 30px;
        }

	    table td{
            border: 1px solid #000;
        }
   
        .tablecontent{
            display: inline;
        }
        </style>
        <script src="https://maps.googleapis.com/maps/api/js?key="""+gkey+""""">
        </script>
    </head>
    <body>
    <header>
    <img src=\""""+dir_path+"""/html/images/logo.png" alt="Logo ironhack" width="80" height="80"/>
    <p><em>Visualizing real-world data project</em> - Alfonso Román - Ironhack</p>
    </header>
    <div id="content">
    <h1>Ubicación para una nueva empresa</h1>
    <h2>Características de la empresa</h2>
    <ul>
        <li>Empresa de videojuegos</li>
        <li>Tener en un radio de 2000 m:
            <ul>
                <li>Otras empresas de videojuegos</li>
                <li>Empresas tecnológicas que hayan captado más de $1M</li>
                <li>Empresas fundadas hace menos de 10 años</li>
                <li>Empresas con más de 87 empleados</li>
                <li>No tener cerca empresas que hayan cerrado</li>
            </ul>
        </li>
    </ul>
    <p>Entre las 5 ubicaciones que más cumplan estos requisitos, se selecciona la que tenga más de los siguientes solicitudes de los empleados a menos de 500 m:</p>
    <ul>
        <li>Aeropuertos</li>
        <li>Starbucks</li>
        <li>Restaurantes veganos</li>
        <li>Guarderías</li>
        <li>Galerías de arte</li>
        <li>Discotecas</li>
        <li>Canchas de baloncesto</li>
    </ul>
    <h2>Resultados</h2>
    """

    for e in range(len(places)):
        html += """
        <h2>Resultado """+str(e+1)+": "+places[e]["formatted_address"]+"""</h2>
        <ul>
            <li>País: """+places[e]["address_components"][6]["long_name"]+"""</li>
            <li>Ciudad:  """+places[e]["address_components"][3]["long_name"]+"""</li>
            <li>Barrio:  """+places[e]["address_components"][2]["long_name"]+"""</li>
            <li>Calle:  """+places[e]["address_components"][1]["long_name"]+"""</li>
            <li>Cerca del nº  """+places[e]["address_components"][0]["long_name"]+"""</li>
        </ul>

        <div class="tablecontent">""" + pd.concat([df_score.drop_duplicates().loc[df_norm_bis.index[e],:].to_frame(),df_top5.loc[df_norm_bis.index[e],:].to_frame()]).to_html(header=False, justify="center")+"""</div>
 
        <div id="map"""+str(e)+"""" style="width: 1000px; height: 600px"></div> 
        <script type="text/javascript">
            var myLatLng = new google.maps.LatLng("""+df_norm_bis.index[e]+""");
            var myOptions = {
                zoom: 12,
                center: myLatLng
            };

            var map"""+str(e)+""" = new google.maps.Map(document.getElementById("map"""+str(e)+""""), myOptions);

            var marker = new google.maps.Marker({
                position: myLatLng,
                map: map"""+str(e)+"""
            });
        </script>
        
    """ 
    
    html += """
    </div>
    <footer>
        <p>Alfonso Román Bonachera</p>
    </footer>
    </body>
    </html>
    """

    with open(dir_path+"/html/companies.html", "w") as file:
        file.write(html)

    webbrowser.open(dir_path+"/html/companies.html")