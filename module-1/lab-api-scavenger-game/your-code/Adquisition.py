import pandas as pd
import matplotlib.pyplot as plt



def read(DataFrame):
       crash = pd.read_csv(DataFrame)
       return crash

def set_up(crash):
       colnames = ['location','operator']
       crash = pd.DataFrame(crash, columns=colnames)
       return crash

def data_cleaning(crash):
       crash = crash.sort_values(by='operator', ascending=False)
       crash = crash.drop_duplicates(subset=['operator', 'location']).dropna()
       return crash

def data_embellish(crash):
       crash.rename(columns={'operator':'Operator'}, inplace=True)
       crash.rename(columns={'location':'Location'}, inplace=True)
       return crash

def plot_operator(crash):
    category_data= crash.Operator.str.split('|', expand=True).stack().value_counts(0)/len(crash)*100
    category_data = category_data.round(1)
    category_data.head(5).plot('bar') 
    plt.title("Total crashes by operator")
    plt.savefig('Plot by operator')

plt.show()

def plot_location(crash):
    category_data= crash.Location.str.split('|', expand=True).stack().value_counts(0)/len(crash)*100
    category_data = category_data.round(1)
    category_data.head(5).plot('bar') 
    plt.title("Total crashes by location")
    plt.savefig('Plot by location')

plt.show()