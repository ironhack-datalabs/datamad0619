from sentiment import get_sentiment
from pprint import pprint
from select_review import Reviews_manager
import argparse

parser = argparse.ArgumentParser(description='Process user input reviews or user reviews stored on file.')
parser.add_argument("-u","--userinput", help="analize review typed by user", action="store_true")
parser.add_argument("-f","--file", help="file with reviews", default="amazon_reviews.txt")

args = parser.parse_args()

user_input = args.userinput
fileName = args.file
reviews = []
r = Reviews_manager(fileName)

if user_input == True:
    user_review = input('Write your reviews or let me select some for you: ')
    reviews.append(user_review)
else:
    reviews = r.get_reviews()

scoring = get_sentiment(reviews)

if user_input == True:
    print('Your score is {} Do you agree with that?'.format(scoring[0]['score']))
else:
    compare = r.compare_reviews(scoring)
    for e in compare:
        print('{} \nThe score for this review is {}, the user {} with that\n'.format(e['review'], e['score'], e['compare']))

