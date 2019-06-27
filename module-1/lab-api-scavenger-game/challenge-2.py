from dotenv import load_dotenv
load_dotenv()
import requests
import os

key=os.environ["mitoken"]
repo="ironhack-datalabs/madrid-oct-2018"
url="https://api.github.com/repos/"
get_forks=url+repo+"/commits"
res=requests.get(get_forks, auth=("lgarciaco1",key))
results=res.json()


date=[]
for e in results:
    if int(e.get("commit").get("author").get("date")[8:10])>20 & int(e.get("commit").get("author").get("date")[5:7])==6:
        date.append(e.get("commit").get("author").get("date"))

print(date)
print(len(date))