import os
import requests
from dotenv import load_dotenv
load_dotenv()

if not "TOKEN_GITHUB" in os.environ:
    raise ValueError("You should pass a GITHUB TOKEN, see: https://github.com/settings/tokens")

TOKEN_GITHUB = os.environ["TOKEN_GITHUB"]

headers = {
  "Authorization": "token {}".format(TOKEN_GITHUB)
}
"""
BASE_URL = "https://api.github.com"
res = requests.get("{}/user".format(BASE_URL), headers=headers)
res.json()
"""

BASE_URL = "https://api.github.com"

owner = "ironhack-datalabs"
repo = "datamad0619"

res_forks = requests.get("{}/repos/{}/{}/forks".format(BASE_URL,owner, repo), headers=headers)
forks =res_forks.json()
#print(res_forks.json())
#print(forks[0]["language"])

x= list(set([f["language"] for f in forks]))
#print(len(x))
query_params= {
  "since": "2019-06-19T18:00:00Z",
  "until": "2019-06-26T18:00:00Z"
}

res_commits = requests.get("{}/repos/{}/{}/commits".format(BASE_URL,owner, repo), headers=headers, params=query_params)
commit_total =res_commits.json()

print(len(commit_total))