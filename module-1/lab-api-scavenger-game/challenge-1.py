# enter your code below
from dotenv import load_dotenv
load_dotenv()
import requests
import os



if not "miToken" in os.environ:
    raise ValueError("You should pass a GITHUB TOKEN, see: https://github.com/settings/tokens")

GITHUB_TOKEN = os.environ["miToken"]
BASE_URL = "https://api.github.com/repos/"

repo="ironhack-datalabs/madrid-oct-2018"
tot=BASE_URL+repo

#headers = {
 #   "Authorization": "token {}".format(GITHUB_TOKEN)
#}

res=requests.get("{}/forks".format(tot),auth=("deliaclar",GITHUB_TOKEN))
a=res.json()
print(len(a))

lst=[]
for e in a:
  lst.append(e.get("language"))  
print(lst)

