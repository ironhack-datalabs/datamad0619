import requests
import os
import json
from dotenv import load_dotenv
load_dotenv()


BASE_URL = "https://api.github.com"
owner = 'LeticiaIG'
repo = 'madrid-oct-2018'

res = requests.get("{}/repos/{}/{}/stargazers".format(BASE_URL,owner,repo))
res.json()

# Github API Authentication: https://developer.github.com/v3/auth/
if not "GITHUB_TOKEN" in os.environ:
    raise ValueError("You should pass a GITHUB TOKEN, see: https://github.com/settings/tokens")

GITHUB_TOKEN = os.environ["GITHUB_TOKEN"]
print(GITHUB_TOKEN)

headers = {
  "Authorization": "token {}".format(GITHUB_TOKEN)
}
res = requests.get("{}/user".format(BASE_URL), headers=headers)
res.json()

# Count how many commits were made in the past week.
# 1. Obtain all the commits made in the past week via API, which is a JSON array that contains multiple commit objects.

# GET /repos/:owner/:repo/git/commits/:commit_sha
commits = requests.get("https://api.github.com/repos/{}/{}/git/commits".format(owner, repo), headers=headers )
data = commits.json()

# 1. Count how many commit objects are contained in the array.
print(len(data))
# me sale 2










