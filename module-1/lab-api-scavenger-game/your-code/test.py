import os
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

las= sorted(lst, key=lambda x: int(x.rsplit('.0', 1)[-1]))
print(las)