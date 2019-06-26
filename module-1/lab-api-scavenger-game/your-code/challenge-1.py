import requests
import os
from dotenv import load_dotenv
load_dotenv()

if not "GITHUB_TOKEN" in os.environ:
    raise ValueError("You should pass a GITHUB TOKEN, see: https://github.com/settings/tokens")

GITHUB_TOKEN = os.environ["GITHUB_TOKEN"]

BASE_URL = "https://api.github.com"

owner = "jmolins89"
repo = "datamad0619"


headers = {
  "Authorization": "token {}".format(GITHUB_TOKEN)
}

#res = requests.get("{}/user".format(BASE_URL), headers=headers)
#print(res.json()) 

forkowner = "ironhack-datalabs"
repo = "datamad0619"

resforks = requests.get("{}/repos/{}/{}/forks".format(BASE_URL,forkowner, repo), headers=headers)
jsonfork = resforks.json()
languages = list(set([jsonfork[i]['language'] for i in range(len(jsonfork))]))
print('Languages: ',languages)



