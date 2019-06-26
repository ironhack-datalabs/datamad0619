
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
commitowner = "ironhack-datalabs"
repo = "datamad0619"
headers = {
  "Authorization": "token {}".format(GITHUB_TOKEN)
}

since='2019-06-19T00:00:00Z'
until='2019-06-26T18:00:00Z'

rescommit = requests.get("{}/repos/{}/{}/commits?since={}&until={}".format(BASE_URL,commitowner, repo, since,until), headers=headers)
jsoncommit = rescommit.json()
commits_last_week= len(jsoncommit)
print('Number of commits last week: 'commits_last_week)