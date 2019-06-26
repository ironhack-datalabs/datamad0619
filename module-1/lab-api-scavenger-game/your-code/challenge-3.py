import requests
import os
import base64
import re
from dotenv import load_dotenv
load_dotenv()

if not "GITHUB_TOKEN" in os.environ:
    raise ValueError("You should pass a GITHUB TOKEN, see: https://github.com/settings/tokens")

GITHUB_TOKEN = os.environ["GITHUB_TOKEN"]
BASE_URL = "https://api.github.com"
headers = {
  "Authorization": "token {}".format(GITHUB_TOKEN)
}
owner = "ironhack-datalabs"
repo = "scavenger"

respath = requests.get("{}/repos/{}/{}/contents".format(BASE_URL,owner, repo), headers=headers)
jsonpath = respath.json()
paths=[jsonpath[i]['path'] for i in range(len(jsonpath))]
#print(paths)
paths = paths[1:]
lst=[]
for i in paths:
    respathpath = requests.get("{}/repos/{}/{}/contents/{}".format(BASE_URL,owner, repo,i), headers=headers)
    jsonpathpath = respathpath.json()
    pathspaths=[jsonpathpath[j]['path'] for j in range(len(jsonpathpath)) if 'scavengerhunt' in jsonpathpath[j]['path']]
    if len(pathspaths)>0:
        for x in range(len(pathspaths)):
            lst.append(pathspaths[x])
lst.sort(key = lambda x: x.split('/.')[1])
#print(lst)
sentence=[]
for i in lst:
    url = requests.get("{}/repos/{}/{}/contents/{}".format(BASE_URL,owner, repo,i), headers=headers)
    req2=url.json()
    content = base64.b64decode(req2['content'])
    sentence.append(str(content))

#print(sentence)
final=[]
for i in sentence:
    b = i.replace("b'",'')
    c = b.replace("\\n'",'')
    final.append(c)
#print(final)
final_sentence= ' '.join(final)
print(final_sentence)
