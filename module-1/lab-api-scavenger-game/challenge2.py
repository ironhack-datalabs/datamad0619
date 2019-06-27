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

date=[]
print(len(a))
for e in a:
    if int(e.get("commit").get("author").get("date")[8:10])> 20  & int(e.get("commit").get("author").get("date")[5:7])==6: 
        date.append(e.get("commit").get("author").get("date"))
print(date)
print(len(date))
