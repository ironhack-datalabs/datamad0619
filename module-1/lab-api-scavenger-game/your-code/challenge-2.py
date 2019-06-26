import requests
import os
from dotenv import load_dotenv
load_dotenv()

BASE_URL = "https://api.github.com"

if not "GITHUB_TOKEN" in os.environ:
    raise ValueError("You should pass a GITHUB TOKEN, see: https://github.com/settings/tokens")

GITHUB_TOKEN = os.environ["GITHUB_TOKEN"]

headers = {
  "Authorization": "token {}".format(GITHUB_TOKEN)
}

owner = "ironhack-datalabs"
repo="datamad0619"

res2 = requests.get("{}/repos/{}/{}/commits".format(BASE_URL,owner,repo),headers=headers, since="")