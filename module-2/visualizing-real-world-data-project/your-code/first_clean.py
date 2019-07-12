from pymongo import MongoClient
import pandas as pd
import requests
import os

# Hacemos la conexión a MongoDB
client = MongoClient('mongodb://localhost:27017/')
db = client.companies

# Cargamos todo el documento y pasamos a df
companies = db.companies.find()
df = pd.DataFrame(companies)
df = df[['name', 'number_of_employees', 'offices','funding_rounds', 'founded_year', 'deadpooled_year', 'total_money_raised', 'category_code',"tag_list"]]

# LIMPIEZA DE LA COLUMNA 'total_money_raised'

# Llamamos a una API para obtener el cambio de divisa
currencies = requests.get("https://api.exchangeratesapi.io/latest?base=USD").json()

# Limpiamos la columna

def cleanToFloat(s):
    if "M" in s:
        s=s.replace("M","")
        return float(s)*1000000
    elif "B" in s:
        s=s.replace("B","")
        return float(s)*1000000000
    elif "k" in s:
        s=s.replace("k","")
        return float(s)*1000
    else: return float(s)
    
def cleanMoney(s):
    if not s == None:
        if s.startswith("$"):
            return int(cleanToFloat(s.replace("$","")))
        elif s.startswith("€"):
            return int(cleanToFloat(s.replace("€",""))/currencies["rates"]["EUR"])
        elif s.startswith("C$"):
            return int(cleanToFloat(s.replace("C$",""))/currencies["rates"]["CAD"])
        elif s.startswith("£"):
            return int(cleanToFloat(s.replace("£",""))/currencies["rates"]["GBP"])
        elif s.startswith("¥"):
            return int(cleanToFloat(s.replace("¥",""))/currencies["rates"]["JPY"])
        elif s.startswith("kr"):
            return int(cleanToFloat(s.replace("kr",""))/currencies["rates"]["SEK"])
        else:
            return int(s)
    return int(s)

df = df.copy()
df["total_money_raised"] = df["total_money_raised"].apply(cleanMoney)

# LIMPIEZA COLUMNA offices

# Creamos una fila por cada oficina en un dataset nuevo
df2 = pd.DataFrame(df.offices.tolist()).stack().reset_index(level=1, drop=True).rename('office')

# Mergeamos con el anterior
ndf = df.merge(df2, left_index=True, right_index=True)

ndf = ndf [["name", "number_of_employees", "office", "funding_rounds", "founded_year", "deadpooled_year"\
           ,"total_money_raised", "category_code", "tag_list"]]

ndf.reset_index(inplace=True)

# Creamos tres nuevas columnas: lat, long y oficina. Esta última con la información del geopoint

def getCoords(data):
    data = data['office']
    
    principal = None
    if data['latitude'] and data['longitude']:
        principal = {
            "type":"Point",
            "coordinates":[data['longitude'], data['latitude']]
        }

    return {
        "lat": data['latitude'],
        "lng": data['longitude'],
        "oficina": principal
    }

coordinates = ndf[["office"]].apply(getCoords, result_type="expand", axis=1)

# Concatenamos con las nuevas columnas a nuestro dataframe
df_clean = pd.concat([ndf,coordinates], axis=1)[["name", "number_of_employees", "founded_year", "deadpooled_year"\
           ,"total_money_raised", "category_code", "tag_list","lat","lng","oficina"]]

# Eliminamos empresas sin coordenadas
df_clean.dropna(subset=['lat', 'lng'], inplace=True)

# Exportamos a json
df_clean.to_json(os.path.dirname(os.path.realpath(__file__))+'/dataset/companies_cleaned.json', orient="records")