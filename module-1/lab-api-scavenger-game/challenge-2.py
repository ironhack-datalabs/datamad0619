import json
import requests
import pandas as pd


with open ("./module-1/lab-api-scavenger-game/token.txt", "r") as archivo:
    access = archivo.readlines()

user = "Alfonso-AML"
key = access[-1].strip()


repo = 'ironhack-datalabs/madrid-oct-2018'
url = "https://api.github.com/repos/"+ repo + "/commits"

res_commits = requests.get(url, auth=(user, key))
results_commits = res_commits.json()

commits = len(results_commits)

print(commits)
