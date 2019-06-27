import json
import requests
import pandas as pd


with open ("./module-1/lab-api-scavenger-game/token.txt", "r") as archivo:
    access = archivo.readlines()

user = "Alfonso-AML"
key = access[-1].strip()


repo = 'ironhack-datalabs/scavenger'
url = "https://api.github.com/repos/"+ repo

res_sca = requests.get(url, auth=(user, key))
results_sca = res_sca.json()
print(list(results_sca.keys()))

