import json
import requests
import pandas as pd


with open ("./module-1/lab-api-scavenger-game/token.txt", "r") as archivo:
    access = archivo.readlines()

user = "Alfonso-AML"
key = access[-1].strip()


repo = 'ironhack-datalabs/madrid-oct-2018'
url = "https://api.github.com/repos/"+ repo + "/forks"

res_fork = requests.get(url, auth=(user, key))
results_fork = res_fork.json()

languages = set()
for i in range(len(results_fork)):
    languages.add(results_fork[i]['language'])

print(languages)


