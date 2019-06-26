# enter your code below

import requests
import os 
from dotenv import load_dotenv

load_dotenv()

GITHUB_TOKEN = os.environ["GITHUB_TOKEN"]

if not "GITHUB_TOKEN" in os.environ:
    raise ValueError("You should pass a GITHUB TOKEN, see: https://github.com/settings/tokens")

BASE_URL = "https://api.github.com"

owner = "ironhack-datalabs"
repo = "mad-oct-2018"

res = requests.get("{}/repos/{}/{}/languages".format(BASE_URL,owner, repo))
res = res.json()





