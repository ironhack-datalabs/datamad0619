import requests
import os
import json
from dotenv import load_dotenv
load_dotenv()


BASE_URL = "https://api.github.com"
owner = 'LeticiaIG'
repo = 'datamad0619'

res = requests.get("{}/repos/{}/{}/stargazers".format(BASE_URL,owner,repo))
res.json()

# Github API Authentication: https://developer.github.com/v3/auth/
if not "GITHUB_TOKEN" in os.environ:
    raise ValueError("You should pass a GITHUB TOKEN, see: https://github.com/settings/tokens")

GITHUB_TOKEN = os.environ["GITHUB_TOKEN"]
print(GITHUB_TOKEN)

headers = {
  "Authorization": "token {}".format(GITHUB_TOKEN)
}
res = requests.get("{}/user".format(BASE_URL), headers=headers)
res.json()

# 1. Obtain the full list of forks created from the main lab repo via Github API.
    # /repos/:owner/:repo/forks ironhack-datalabs / datamad0619
# 1. Print the language array. It should be something like:

owner = 'ironhack-datalabs'
repo = 'madrid-oct-2018'

# Loop the JSON response to find out the `language` attribute of each fork. Use an array to store the `language` attributes of each fork.
    #* *Hint: Each language should appear only once in your array.*

repos = requests.get("https://api.github.com/repos/{}/{}/forks".format(owner, repo), headers=headers )
data = repos.json()

language = []
for i in range(len(data)):
    language.append(data[i]['language'])
print (list(set(language)))


