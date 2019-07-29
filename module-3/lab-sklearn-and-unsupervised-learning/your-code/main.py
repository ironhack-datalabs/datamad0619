#!/usr/bin/env python
# coding: utf-8

# # Before your start:
# - Read the README.md file
# - Comment as much as you can and use the resources in the README.md file
# - Happy learning!
# 

# In[42]:


#Import your libraries
import pandas as pd
import numpy as np


# # Challenge 1 -  Explore the Internal Dataset
# 
# In this lab, we will start off by working with the wine dataset in scikit-learn. We will select the wine dataset and use a clustering algorithm to learn more about the functionalities of this library. 
# 
# We start off by loading the dataset using the `load_wine` function ([documentation](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.load_wine.html)). In the cell below, we will import the function from scikit-learn.

# In[43]:


from sklearn.datasets import load_wine


# In the cell below, use the `load_wine` function and assign the wine dataset to a variable called `wine`.

# In[44]:


# Your code here:
wine = load_wine()


# In the next step, list the keys of the variable `wine` to examine its contents. Note that the `load_wine` function does not return dataframes. It returns you a Python dictionary.

# In[45]:


# Your code here:
wine.keys()


# Next, list the feature names. These are the different characteristics of the wine. 

# In[46]:


# Your code here:
list(wine.target_names)


# Print the description of the dataset in the cell below using the `DESCR` attribute of the `wine` variable.
# 
# *Hint: If your output is ill-formatted by displaying linebreaks as `\n`, it means you are not using the print function.*

# In[47]:


# Your code here:
print(wine.DESCR)


# #### From the description, we see that all columns are numeric. We also know that there is no missing data 
# 
# Let's plot the alcohol content histogram. Recall that we are working with a numpy array and will need to use a matplotlib function to produce a histogram. 

# In[48]:


# imports
import numpy as np
import matplotlib.pyplot as plt


# In[49]:


wine


# In[85]:


plt.hist(wine.feature_names)


# In[84]:


#wine.feature_names.value_counts()
plt.hist(wine.feature_names, bins=1)


# In[83]:


#plt.hist(wine.feature_names if ["alcohol"])
#alcohol = df[0]


# In[ ]:


google_agg = review_missing_removed.groupby('App')["Sentiment"]


# In[72]:


list(df.value_counts())


# In[67]:


wine_ag = df.groupby('feature_names')["alcohol"]


# In[64]:





# In[51]:


data['title'].value_counts()[:20].plot(kind='barh')


# In[ ]:


df.hist(column='session_duration_seconds')


# In[21]:


fig, (ax1, ax2) = plt.subplots(ncols="Alcohol")


# In[19]:


# Your code here:
wine.hist('Alcohol')


# # Challenge 2 - Clustering the Internal Dataset
# 
# In this portion of the lab, we will cluster the data to find common traits between the different wines. We will use the k-means clustering algorithm to achieve this goal.
# 
# #### We start by importing k-means from scikit-learn and then proceed to create 4 clusters.

# In[ ]:


# imports


# In[ ]:


# Your code here:


# #### Print the cluster labels.

# In[ ]:


# Your code here:


# #### Compute the size of each cluster. This can be done by counting the number of occurrences of each unique label in the list above.
# 
# Which is the largest cluster of the 4?

# In[ ]:


# Your code here:


# In[ ]:


# Your answer here:


# #### Inspect the shape of `wine['data']`

# In[ ]:


# Your code here:


# #### Inspect the first 5 records in `wine['data']`

# In[ ]:


# Your code here:


# You now know the data object is a 2-dimensional array in which there are 178 rows and 13 columns. Each row is a data record and each column is a feature.
# 
# #### What is the average ash content for each cluster? 
# 
# *Hints:* 
# 
# * *Ash* is the 3rd column.
# 
# * The data object is not a Pandas dataframe so you can't apply `pandas.DataFrame.groupby`. Instead, you can use `np.average`.

# In[ ]:


# Your code here:


# # Challenge 3 - Load and Explore an External Dataset
# 
# We will now load an external dataset using Pandas and use scikit learn to explore the data. In this portion of the lab, we will use a [patient dataset from Kaggle](https://www.kaggle.com/miles99/patient-admission-dataset-for-learning-data-mining). 

# In[ ]:


patients = pd.read_csv('../patient-admission-dataset-for-learning-data-mining.csv')


# In the next cell, print the first five rows of the data using the `head()` function.

# In[ ]:


# Your code here:


# Next, print the column types and check which columns have been misclassified by pandas.

# In[ ]:


# Your code here:


# #### We can see that none of the date columns have been correctly classified. Also, some columns contain qualitative data that can be dropped.
# 
# First, transform the `patient_dob` and `appointment_date` columns to datetime using the `pd.to_datetime` function.

# In[ ]:


# Your code here:


# Next, drop the `id`, `patient_name`, `patient_email`, `patient_nhs_number`, and `doctor_phone` columns. These are not quantitative columns and will not contribute to our analysis.

# In[ ]:


# Your code here:


# Now we work on the missing data. Most ML algorithms will not perform as intended if there are missing data.
# 
# In the cell below, count how many rows contain missing data in each column. You should see three columns contain missing data:
# 
# * `doctor_name`: 58 missing data
# * `prescribed_medicines`: 488 missing data
# * `diagnosis`: 488 missing data

# In[ ]:


# Your code here:


# The main issues are found in the `prescribed_medicines` and `diagnosis` columns. Can we simply drop these rows?
# 
# The answer is not yet. Because when there are missing data in these columns, it doesn't mean the data records are broken. Instead, it means no medication was prescribed and no diagnosis was recorded. Therefore, once we fill in the missing data these columns will be fine. But we'll revisit these columns and decide whether we will eventually drop them when we look at how many unique values are there in these categorical columns.  
# 
# For the `prescribed_medicines` column, fill the missing values with the value `no prescription`. For the `diagnosis` column, fill the missing values with `no diagnosis`.
# 
# *Hint: Use [`pandas.DataFrame.fillna`](https://pandas.pydata.org/pandas-docs/stable/generated/pandas.DataFrame.fillna.html).*

# In[ ]:


# Your code here:


# How about `doctor_name`? Since a doctor visit without a doctor name might not be meaningful, we will drop these rows.

# In[ ]:


# Your code here:


# #### Another step in preprocessing that can be performed by scikit-learn is label encoding. 
# 
# We have 4 columns that are of `bool` type. We would like to convert them to an integer column containing either zero or one. We can do this using [scikit-learn's label encoder](https://scikit-learn.org/stable/modules/generated/sklearn.preprocessing.LabelEncoder.html).
# 
# In the cell below, import the label encoder and encode the 4 boolean columns (*patient_diabetic*, *patient_allergic*, *patient_show*, *is_regular_visit*) with `0` and `1`. 

# In[ ]:


# Your code here:


# Print the data dtypes to confirm those four `bool` columns are converted to `int64`.

# In[ ]:


# Your code here:


# #### The last step is to handle the `object` data.
# 
# There are 4 `object` columns now: `patient_gender`, `doctor_name`, `prescribed_medicines`, and `diagnosis`. The gender columns
# 
# In the next cell, check the unique values of each of the `object` columns using `value_counts()`.

# In[ ]:


# Your code here:


# #### The number of unique values is large for all three columns except `patient_gender`. We will handle these columns differently.
# 
# For `diagnosis`, there are too many unique values which will make ML difficult. However, we can re-encode the values to either with or without diagnosis. Remember at an earlier step we filled in the missing values of this column with *no diagnosis*? We can re-encode *no diagnosis* to `0` and all other values to `1`. In this way we can tremendously simply this column.
# 
# For `prescribed_medicines`, we can drop this column because it is perfectly correlated with `diagnosis`. Whenever there is no diagnosis, there is no prescribed medicine. So we don't need to keep this duplicated data.
# 
# How about `doctor_name`? There are not excessive unique values but still quite many (19). We may either drop or keep it but keeping it will make the analysis more complicated. So due to the length of this lab let's drop it.
# 
# How about `gender`? This one is easy. Just like re-encoding the boolean values, we can re-encode gender to `0` and `1` because there are only 2 unique values.
# 
# In the next cells, do the following:
# 
# 1. Create a new column called `diagnosis_int` that has `0` and `1` based on the values in `diagnosis`.
# 
# 1. Create a new column called `patient_gender_int` that has `0` and `1` based on the values in `patient_gender`.
# 
# 1. Drop the following columns: `doctor_name`, `diagnosis`, `prescribed_medicines`, and `patient_gender`.

# In[ ]:


# Your code here:


# Let's look at the head again to ensure the re-encoding and dropping are successful:

# In[ ]:


# Your code here:


# An interesting observation is that all patients are no older than 2 years. However, their weights and heights indicate that they are adults. This cannot be true. Therefore, we can either trust the weight and height columns or the DOB column. Since there are other columns that indicate that these are adults (they have emails, some have diabetes) we will drop the `patient_dob` column. We will also drop the `appointment_date` column since it has too many unique values to transform to a dummy variable. Drop the two columns in the cell below.

# In[ ]:


# Your code here:


# #### Our data is now ready for clustering. Let's use k-means again.
# 
# We start by initializing and fitting a model in the cell below. Call this model patients_cluster.

# In[ ]:


# Your code here:


# Attach the labels to the dataframe. Do this by accessing the `labels_` in the `patients_cluster` model and assign them to a new column in `patients` that you will call `labels`.

# In[ ]:


# Your code here:


# Now using a `groupby`, find the mean of every variable in `patients` and group by the `labels` column. This summary will allow us to see how the patients differ between the clusters. Your output should look similar to the image below.
# 
# ![groupby mean](../groupby-mean.png)
# 
# Additionally, add a comment to describe which columns have the largest difference between clusters.

# In[ ]:


# Your code here:


# In[ ]:


# Your comment here:


# # Bonus Challenge: Visualize K-Means Clusters
# 
# How did k-means cluster the data? You can obtain an intuitive view with a scatter plot. Generate a 2-d cluster plot below using `matplotlib`. You need to choose 2 of the features from your cleaned and transformed dataset, and use color to represent the cluster label generated from k-means.
# 
# If the scatter plot does not make any sense to you, it means the features you chose to visualize are not the right ones. You should be able to see 4 clear clusters with different colors in your visualization that suggests how k-means had clustered your data.
# 
# ![Cluster Visualization](../clusters.png)

# In[ ]:


# Your code here:


# Additionally, you can visualize the clusters in 3-D scatter plot. Give it a try below.

# In[ ]:


# Your code here:

