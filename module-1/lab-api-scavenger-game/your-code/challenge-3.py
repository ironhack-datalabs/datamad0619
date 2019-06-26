# Your code here

import requests
import os
from dotenv import load_dotenv
load_dotenv()

if not "GITHUB_TOKEN" in os.environ:
    raise ValueError("You should pass a GITHUB TOKEN, see: https://github.com/settings/tokens")

GITHUB_TOKEN = os.environ["GITHUB_TOKEN"]

BASE_URL = "https://api.github.com"

owner = "ironhack-datalabs"
repo = "scavenger"

headers = {
  "Authorization": "token {}".format(GITHUB_TOKEN)
}

res_forks = requests.get("{}/repos/{}/{}/contents/".format(BASE_URL,owner,repo),headers=headers)
folderjson = res_forks.json()
#print(folderjson)

lstfile = []
for i in range(len(folderjson)):
    lstfile.append(folderjson[i]['name'])

#print(lstfile)

lstpath = []
for i in lstfile:
    res_forks = requests.get("{}/repos/{}/{}/contents/{}".format(BASE_URL,owner,repo,i),headers=headers)
    folderjson = res_forks.json()
    lstpath.append(folderjson)

print(lstpath)

