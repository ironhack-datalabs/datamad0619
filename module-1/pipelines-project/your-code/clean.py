# Clean function receives a .txt file, filters positive from negative reviews,
# removes line break symbols and returns a list [rev] of lists with negative reviews
# in list [reviews1] and positive reviews in list [reviews2]

def clean(file_name):
    reviews1 = []
    reviews2 = []
    with open(file_name, encoding='utf8') as reviews:
        rev = reviews.readlines()
        for review in rev:
            if review.startswith('__label__1'):
                reviews1.append(review)
            else:
                reviews2.append(review)
    reviews_1 = [x.replace('__label__1 ', '').replace('\n', '') for x in reviews1]
    reviews_2 = [x.replace('__label__2 ', '').replace('\n', '') for x in reviews2]
    revs = [reviews_1, reviews_2]
    return revs