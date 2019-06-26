from dotenv import load_dotenv
load_dotenv()
import requests
import os



if not "miToken" in os.environ:
    raise ValueError("You should pass a GITHUB TOKEN, see: https://github.com/settings/tokens")

GITHUB_TOKEN = os.environ["miToken"]
BASE_URL = "https://api.github.com"

repo="ironhack-datalabs/madrid-oct-2018"
res=requests.get("{}/repos/{}/commits".format(BASE_URL,repo),auth=("deliaclar",GITHUB_TOKEN))
a=res.json()

print(len(a))