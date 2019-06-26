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
repo = "datamad0619"

headers = {
  "Authorization": "token {}".format(GITHUB_TOKEN)
}

#res = requests.get("{}/user".format(BASE_URL), headers=headers)
#res.json()

res_forks = requests.get("{}/repos/{}/{}/forks".format(BASE_URL,owner,repo),headers=headers)
forksjson = res_forks.json()
#print(forksjson)


lstlang = []
for i in range(len(forksjson)):
  lstlang.append(forksjson[i]['language'])

result=list(set(lstlang))
print(result)





