# Extraer los datos
from pymongo import MongoClient
import pandas as pd
import requests
import os

client = MongoClient('mongodb://localhost:27017/')
db = client.companies

def connect(): 
    print("Conectando a MongoDB...")
    try:
        companies = db.companies_cleaned.find()
        df = pd.DataFrame(companies)
        df = df[["name", "number_of_employees", "founded_year", "total_money_raised", "oficina", "deadpooled_year", "lat", "lng"]].copy()
    except:
        raise ValueError("Error al conectarse a MongoDB")
        
    df["latlng"] = df.apply(lambda x: f"{x.lat},{x.lng}", axis = 1)
    df.set_index("latlng", inplace=True)
    df.dropna(inplace=True)

    return df

def find_companies(geopoint, query, radio_max_meters=1000):

    if query == "companies_near":
        return (db.companies_cleaned.find({
            "$and": [{"oficina": 
                {"$near": {
                    "$geometry": geopoint,
                    "$maxDistance": radio_max_meters
                    }
                }},
                {"category_code":"games_video"}
            ]
        }).count())
    elif query == "employees":
        return (db.companies_cleaned.find({
            "$and": [{"oficina": 
                {"$near": {
                    "$geometry": geopoint,
                    "$maxDistance": radio_max_meters
                    }
                }},
                {"number_of_employees":{"$gte":87}}
            ]
        }).count())
    elif query == "year":
        return (db.companies_cleaned.find({
            "$and": [{"oficina": 
                {"$near": {
                    "$geometry": geopoint,
                    "$maxDistance": radio_max_meters
                    }
                }},
                {"founded_year":{"$gt":2009}}
            ]
        }).count())
    elif query == "money":
        return (db.companies_cleaned.find({
            "$and": [{"oficina": 
                {"$near": {
                    "$geometry": geopoint,
                    "$maxDistance": radio_max_meters
                    }
                }},
                {"total_money_raised":{"$gte":1000000}}
            ]
        }).count())
    elif query == "deadpool":
        return (db.companies_cleaned.find({
            "$and": [{"oficina": 
                {"$near": {
                    "$geometry": geopoint,
                    "$maxDistance": radio_max_meters
                    }
                }},
                {"deadpooled_year": {"$ne": None}}
            ]
        }).count())
    else:
        raise ValueError("No ha sido posible ejecutar la geoquery en MongoDB")
