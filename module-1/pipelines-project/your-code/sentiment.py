# Sentiment function makes a call to Text Analysis API, which needs a subscription key, and
# returns a dictionary with two key/values: the id of the review and its score, being negative
# score from 0.0 to 0.3, neutral score from 0.3 to 0.7 and positive score from 0.7 to 1.0.
# Negative scores should be assigned to reviews from list [reviews1], while positive scores
# should be assigned to reviews from list [reviews2], to check if the API is working properly.

import requests
from pprint import pprint
import random

subscription_key = "6b54e4de8f394a07a8f2b71daf945b2e"
text_analytics_base_url = "https://westeurope.api.cognitive.microsoft.com/text/analytics/v2.0/sentiment"


def get_review(id, rp):
    for dict in rp:
        if id == dict['id']:
            return dict['text']


def get_score(id, rp):
    for dict in rp:
        if id == dict['id']:
            return dict['score']
 


def get_sentiment(input_reviews):
    request_payload = []
    id = 1
    for i in input_reviews:
        dict = {
            "language": "en",
            "id": str(id),
            "text": i
        }
        request_payload.append(dict)
        id += 1

    documents = {'documents': request_payload}
    headers   = {"Ocp-Apim-Subscription-Key": subscription_key}
    response  = requests.post(text_analytics_base_url, headers=headers, json=documents)
    analysis = response.json()

    result = []
    for document in request_payload:
        review_text = get_review(document['id'], request_payload)
        review_score = get_score(document['id'], analysis['documents'])
        result.append({
            'review': review_text,
            'score': float(round(review_score, 2))
        })
    return result