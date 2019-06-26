# Challenge 2: Count Commits
# 1. Obtain all the commits made in the past week via API, which is a JSON array that contains multiple commit objects.
import requests
import os
import base64
import re
from dotenv import load_dotenv
load_dotenv()

if not "GITHUB_TOKEN" in os.environ:
    raise ValueError("You should pass a GITHUB TOKEN, see: https://github.com/settings/tokens")

GITHUB_TOKEN = os.environ["GITHUB_TOKEN"]

headers = {
  "Authorization": "token {}".format(GITHUB_TOKEN)
}

owner = "ironhack-datalabs"
repo = "scavenger"
BASE_URL = "https://api.github.com"


res = requests.get("{}/repos/{}/{}/contents/".format(BASE_URL, owner, repo), headers = headers)

data = res.json()
files = []

# El contado es únicamente para mostrarlo en pantalla
cont = 1

# Primero buscamos las capetas que hay en la base y que son diferentes al gitignore
for e in data:
    if e["path"] != ".gitignore":
        folder=requests.get("{}/repos/{}/{}/contents/{}".format(BASE_URL, owner, repo, e["path"]), headers = headers).json()

        # Dentro de las carpetas localizadas, buscamos los archivos que contengan scavenger en el nombre
        for i in folder:
            if "scavenger" in i["path"]:
                folder2=requests.get("{}/repos/{}/{}/contents/{}".format(BASE_URL, owner, repo, i["path"]), headers = headers).json()

                # Almacenamos en una lista, otra lista donde el primer elemento es la posición, sacada del nombre del archivo
                # y la segunda es la palabra escondida. Se descodifica
                files.append( [int(re.findall("0+(\d+)", folder2["name"])[0]) , str(base64.b64decode(folder2["content"]))[2:-3] ])
                print("Buscando scavengers... {} encontrados".format(cont))
                cont += 1
files.sort()
phrase = [e[1] for e in files]
print("La frase escondida en los scavengers es: \n {}".format(" ".join(phrase)))