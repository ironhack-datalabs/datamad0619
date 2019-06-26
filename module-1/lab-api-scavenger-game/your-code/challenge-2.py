# Challenge 2: Count Commits
# 1. Obtain all the commits made in the past week via API, which is a JSON array that contains multiple commit objects.
import requests
import os
from dotenv import load_dotenv
load_dotenv()

if not "GITHUB_TOKEN" in os.environ:
    raise ValueError("You should pass a GITHUB TOKEN, see: https://github.com/settings/tokens")

GITHUB_TOKEN = os.environ["GITHUB_TOKEN"]

headers = {
  "Authorization": "token {}".format(GITHUB_TOKEN)
}

owner = "ironhack-labs"
repo = "datamad0619"
BASE_URL = "https://api.github.com"

query_params = {
    "since": "2019-06-19T00:00:00"
}

res = requests.get("{}/repos/{}/{}/commits".format(BASE_URL, owner, repo), params=query_params, headers = headers)

data = res.json()

# 2. Count how many commit objects are contained in the array.
print(len(data))





