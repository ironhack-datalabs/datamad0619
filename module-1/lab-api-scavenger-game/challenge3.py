from dotenv import load_dotenv
load_dotenv()
import requests
import os
import urllib.request as p
import ssl


if not "miToken" in os.environ:
    raise ValueError("You should pass a GITHUB TOKEN, see: https://github.com/settings/tokens")

GITHUB_TOKEN = os.environ["miToken"]
BASE_URL = "https://api.github.com"

repo="ironhack-datalabs/scavenger"
res=requests.get("{}/repos/{}/contents".format(BASE_URL,repo),auth=("deliaclar",GITHUB_TOKEN))
a=res.json()

dir=[e.get("path") for e in a if e.get("type")=="dir"]

path2=[]
letras=[]
orden=[]
for e in dir:
    res2=requests.get("{}/repos/{}/contents/{}".format(BASE_URL,repo,e),auth=("deliaclar",GITHUB_TOKEN))
    res2=res2.json()
    for e3 in res2:
        if e3.get("type")=="file":
            if "scavengerhunt" in e3.get("name"):
                orden.append(int(e3.get("name")[1:5]))
                path2.append(e3.get("download_url"))
d=dict()
gcontext = ssl.SSLContext()
i=0
for e5 in path2:
    leer=p.urlopen(e5,context=gcontext)
    d[str(orden[i])]=str(leer.read(),"utf-8")
    i+=1


letrasOrdenadas=[d[str(i+1)] for i in range(len(orden))]
print(" ".join(letrasOrdenadas).replace("\n"," "))





       