# Challenge 1: Fork Languages
# 1. Obtain the full list of forks created from the main lab repo via Github API.
import requests
import os
from dotenv import load_dotenv
load_dotenv()

if not "GITHUB_TOKEN" in os.environ:
    raise ValueError("You should pass a GITHUB TOKEN, see: https://github.com/settings/tokens")

GITHUB_TOKEN = os.environ["GITHUB_TOKEN"]

headers = {
  "Authorization": "token {}".format(GITHUB_TOKEN)
}

owner = "ironhack-datalabs"
repo = "datamad0619"
BASE_URL = "https://api.github.com"

res = requests.get("{}/repos/{}/{}/forks".format(BASE_URL, owner, repo))

data = res.json()

# 2. Loop the JSON response to find out the language attribute of each fork. Use an array to store the language attributes of each fork.
languages = list(set([e["language"] for e in data]))

# 3. Print the language array
print(languages)

# Lo he hecho sobre el de datamad, por lo que solo me da el Jupyter