import json
import os
import requests as r
from dotenv import load_dotenv

if not "GITHUB_TOKEN" in os.environ:
    raise ValueError("You should pass a GITHUB TOKEN, see: https://github.com/settings/tokens")

GITHUB_TOKEN = os.environ["GITHUB_TOKEN"]

with open ("token.txt", "r") as file1:
    tok = file1.readlines()
key = tok[0][:-2] #Need to put 0 so it takes from the begining of the key
user = "fserrey"

repo = "ironhack-datalabs/datamad0619"
forks = "http://api.github.com/repos/" + repo + "/forks"

headers = {
    "Authorization": "token {}".format(GITHUB_TOKEN)
    
}
request = r.get(forks, headers=headers)
print(request)

