import requests
import os
from dotenv import load_dotenv
import re
import base64
load_dotenv()

BASE_URL = "https://api.github.com"

if not "GITHUB_TOKEN" in os.environ:
    raise ValueError("You should pass a GITHUB TOKEN, see: https://github.com/settings/tokens")

GITHUB_TOKEN = os.environ["GITHUB_TOKEN"]

headers = {
  "Authorization": "token {}".format(GITHUB_TOKEN)
}

owner = "ironhack-datalabs"
repo="scavenger"

query_params={}

res3 = requests.get("{}/repos/{}/{}/contents/".format(BASE_URL,owner,repo),headers=headers)
content0=res3.json()

path0=[c0["path"] for c0 in content0 if c0["name"]!=".gitignore"]

path1=[]

for path in path0:
    res4 = requests.get("{}/repos/{}/{}/contents/{}".format(BASE_URL,owner,repo,path),headers=headers)
    content1=res4.json()
    for c1 in content1:
        if "scavengerhunt" in c1["name"]: path1.append(c1["path"])
    
def sort_paths(path):
    return int(path.split(".")[1])

path1 = sorted(path1,key=sort_paths)

encoded_words=[]

for path in path1:
    res5 = requests.get("{}/repos/{}/{}/contents/{}".format(BASE_URL,owner,repo,path),headers=headers)
    content2=res5.json()
    encoded_words.append(content2["content"])

decoded_words=[str(base64.b64decode(enc)) for enc in encoded_words]

def clean_dwords(dec):
    c1=dec.replace("b'","")
    c2=c1.replace("\\n'","")
    return c2

cd_words=list(map(clean_dwords,decoded_words))

message=" ".join(cd_words)
print(message)







