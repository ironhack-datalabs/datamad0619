# enter your code below
###
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

res = requests.get("{}/user".format(BASE_URL), headers=headers)
res.json()

