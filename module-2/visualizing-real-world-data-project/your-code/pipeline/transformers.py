import pandas as pd
from sklearn import preprocessing
from pipeline.extractors import find_companies
import requests
import os

from dotenv import load_dotenv
load_dotenv()

if not "GOOGLE_KEY" in os.environ:
    raise ValueError("Necesitas una API key de Google")

gkey = os.environ["GOOGLE_KEY"]
def create_df_score(df, argparse):
    print("Calculando puntuaciones...")
    df_score = pd.DataFrame()
    df_score["companies_near"]=df["oficina"].apply(lambda x: int(find_companies(x, str('companies_near'), argparse)))
    df_score["number_of_employees"]=df["oficina"].apply(lambda x: int(find_companies(x, 'employees', argparse)))
    df_score["founded_year"]=df["oficina"].apply(lambda x: int(find_companies(x, 'year', argparse)))
    df_score["total_money_raised"]=df["oficina"].apply(lambda x: int(find_companies(x, 'money', argparse)))
    df_score["deadpooled_year"]=df["oficina"].apply(lambda x: int(find_companies(x, 'deadpool', argparse)))
    return df_score[["number_of_employees", "founded_year", "total_money_raised", "companies_near", "deadpooled_year"]].copy()

def normalize(df):
    print("Normalizando resultados...")
    x = df.values #returns a numpy array
    min_max_scaler = preprocessing.MinMaxScaler()
    x_scaled = min_max_scaler.fit_transform(x)
    df2 = pd.DataFrame(x_scaled)
    df2.rename(columns= {0: "employees",1: "year",2: "money",3: "companies",4: "deadpool"}, inplace=True)

    df2.set_index(df.index, inplace=True)
    df2["total"] = df2.apply(lambda x: x.employees+x.year+x.money+x.companies-x.deadpool, axis=1)
    df2.sort_values("total", ascending=False, inplace=True)
    df2.drop_duplicates(inplace=True)
    return df2

def call_places(top_five):
    print("Volviendo a calcular con los 5 mejores...")
    dic = {
        "starbucks" : ("cafe", "starbucks"),
        "vegan_restos" : ("restaurant", "vegan"),
        "night_clubs" : ("night_club", ""),
        "airport" : ("airport", "international_airport"),
        "basketball" : ("basketball_court", "basketball"),
        "schools" : ("school", "kindergarten"),
        "galleries": ("art_gallery", "art_gallery")
    }
    for k, v in dic.items():
        top_five[k] = [len(requests.get(f"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location={e}&radius=500&type={v[0]}&keyword={v[1]}&key={gkey}").json()) for e in top_five.index]
    return top_five[dic.keys()]

def normalize_bis(df):
    print("Normalizando el nuevo resultado...")
    x = df.values #returns a numpy array
    min_max_scaler = preprocessing.MinMaxScaler()
    x_scaled = min_max_scaler.fit_transform(x)
    df2 = pd.DataFrame(x_scaled)
    df2.rename(columns= {0: "starbucks",1: "vegan",2: "clubs",3: "airport",4: "basketball",5: "kindergarten",6: "galleries"}, inplace=True)

    df2.set_index(df.index, inplace=True)
    df2["total"] = df2.apply(lambda x: x.starbucks+x.vegan+x.clubs+x.airport-x.basketball+x.kindergarten+x.galleries, axis=1)
    df2.sort_values("total", ascending=False, inplace=True)
    return df2