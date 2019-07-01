# Select_review function asks the user for an input or randomly selects some reviews from
# the database.

import random
from clean import clean

class Reviews_manager():
    def __init__(self, file_name):
        self.file = file_name
    
    def get_reviews(self, quantity=3):
        u = clean(self.file)
        self.label1 = u[0]
        self.label2 = u[1]
        reviews1 = random.choices(self.label1, k=quantity)
        reviews2 = random.choices(self.label2, k=quantity)
        reviews = random.choices(reviews1 + reviews2, k=quantity)
        return reviews

    def compare_reviews(self, scoring):
        compare = []
        for dict in scoring:
            if dict['review'] in self.label1 and dict['score'] < 0.50:
                temp_result = 'agrees'
            elif dict['review'] in self.label2 and dict['score'] > 0.50:
                temp_result = 'agrees'
            else:
                temp_result = 'does not agree'
            compare.append({'review': dict['review'], 'score': dict['score'], 'compare': temp_result})
        return compare