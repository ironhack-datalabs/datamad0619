# enter your code below
from dotenv import load_dotenv
load_dotenv()
import requests
import os

key=os.environ["mitoken"]
repo="ironhack-datalabs/madrid-oct-2018"
url="https://api.github.com/repos/"
get_forks=url+repo+"/forks"
res=requests.get(get_forks, auth=("lgarciaco1",key))
results=res.json()
lang=set()
for e in results:
    lang.add(e["language"])

print(lang)