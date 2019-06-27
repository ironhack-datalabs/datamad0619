import requests
import os
import json
from dotenv import load_dotenv
load_dotenv()


BASE_URL = "https://api.github.com"
owner = 'ironhack-datalabs'
repo = 'scavenger'

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

data_3 = requests.get("https://api.github.com/repos/{}/{}/contents/".format(owner, repo), headers=headers )
data_3 = data_3.json()
#print(data_3)

with open('data_3.json', 'w') as outfile:
    json.dump(data_3, outfile)

path = []
for i in range(len(data_3)):
    path.append(data_3[i]['path'])
print (list(path))

path.remove('.gitignore')
print (list(path))

#request de cada carpeta


#almacenará las respuestas:
responses = list() 
# path es la lista de carpetas

for p in path:
    res = requests.get('https://api.github.com/repos/{}/{}/contents/{}'.format(owner, repo, p), headers=headers)
    res_data= res.json() # lista de diccionarios
    # tengo responses, de estas, elijo aquellas cuyos paths terminen en .scavengerhunt
    for archivo in res_data:
        if 'scavengerhunt' in archivo['name']:
            responses.append(archivo['path'])
#json.loads(rr.text)
print(responses)

with open('res_data.json', 'w') as outfile:
    json.dump(res_data, outfile)

# hay que entrar en cada scavengerhunt
# y parsear lo que haya dentro
# pero antes, hay que ordenarlas. Veamos,
    #  pero claro, hay que ordenar por los segundos números de la ruta. OMG !! ! ! 

# No sé como lo terminaría de esta manera, ver luego:
#def OrdenarPaths(paths):
#  return paths[7:11]
# sorted = responses.sort()
print(sorted)

# A ver, por qué necesito esta key?
# https://www.programiz.com/python-programming/methods/list/sort
responses = sorted(responses, key = lambda x: x.split('.')[1])
print(responses)
