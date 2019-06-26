
import requests
import json

with open('/Users/emachado/datamad0619/module-1/lab-api-scavenger-game/token.txt', 'r') as file:
    token = file.read()

headers = {
  "Authorization": "token {}".format(token)
}

BASE_URL = "https://api.github.com"

owner = "ironhack-datalabs"
repo = "madrid-oct-2018"

url = "{}/repos/{}/{}/forks".format(BASE_URL, owner, repo)
res = requests.get(url, headers=headers)
data = res.json()

def languages(fork):
    fork_language = []
    for e in data:
        if e["language"] not in fork_language:
            fork_language.append(e["language"])
    return fork_language

print(languages(data))
