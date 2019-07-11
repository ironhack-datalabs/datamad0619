Visualazing real world data:

Overview:
With a first data set, I have created several documents to find the best spot for a new company's office's location. 

Deliverables:

visualazing-real-world-data.ipynb
This Jupyter Notebook contains the data set with a first pymongo query that filters companies that have one unique address for their offices. 
After that first filter, latitude and longitude are transformed into geo points. 
Atfer that first query, some data cleaning is done in order to get only valid records:
- keep only the columns that are important for the analysis
- no nulls in "founded_year" column
- only nulls in "deadpooled_year" as we want companies that are still active
- called and API to convert currencies different to dollars into the dollar amount
- converted float years into integers
- erased all records with a null in the latitude and longitude column 

This first file is exported and saved into a json then opened in Compass in order to create a geo index for the file. 

pymongo.ipynb
This new jupyter notebook uploads the json file and creates a query with most of the requirements described in the lab readme.md:
- "founded_year" greater than 2005. 
- over 50 employees
- over 1M of "total_money_raised"
- that have a catergory code: "web", "social", "games_videos", "mobile", "news", "network_hosting", "ecommerce" or "advertising"

With the exact columns I want to draw in my Tableau sheet, I export that last data frame into a json file and import it to Tableau to get my first map with the 61 companies that match all criteria defined in the query. 

Google Places API: 

- Search1: shows Starbucks in a 2km radius
- Search2: shows vegan restaurants in a 2km radius
- Search3: shows nurseries in a 2km radius
- Search4: shows the bars in a 2km radius
- Search5: shows night clubs in a 2km radius
- Search6: shows basketball stadiums in a 5km radius
- Search7: shows the closest airports in a 20km radius

https://public.tableau.com/profile/alejandra.aranzadi#!/vizhome/CompaniesCrunchbase/Selection?publish=yes
Finally, the location of the office of our company VIDEOGAMUS is: the San Francisco Area

