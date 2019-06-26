import os
import base64
import re
import requests
from dotenv import load_dotenv
import natsort
load_dotenv()

if not "TOKEN_GITHUB" in os.environ:
    raise ValueError("You should pass a GITHUB TOKEN, see: https://github.com/settings/tokens")

TOKEN_GITHUB = os.environ["TOKEN_GITHUB"]

headers = {
  "Authorization": "token {}".format(TOKEN_GITHUB)
}

BASE_URL = "https://api.github.com"

owner = "ironhack-datalabs"
repo = "scavenger"

res = requests.get("{}/repos/{}/{}/contents/".format(BASE_URL,owner, repo), headers=headers)
df =res.json()


x= [f["path"] for f in df if f["name"]!= ".gitignore"]
lst=[]
for e in x:
  ress = requests.get("{}/repos/{}/{}/contents/{}".format(BASE_URL,owner, repo,e), headers=headers)
  fichero= ress.json()
  for l in fichero: 
    if "scavengerhunt" in l["path"]:
        lst.append(l["path"])

#print(lst)
las = sorted(lst, key=lambda x: x[7:11])
#print(las)
palabras=[]
for dd in las:
  resto = requests.get("{}/repos/{}/{}/contents/{}".format(BASE_URL,owner, repo,dd), headers=headers)
  aver= resto.json()
  palabras.append(aver["content"])
#print(palabras)
#palas= palabras.decode('base64')
palas = list(map(base64.b64decode, palabras))
#print(type(palas[1]))

str1 = ' '.join(str(e) for e in palas)
sas= str1.replace("b'","")
sas1= sas.replace("\\n'","")
print(sas1)
#hecho