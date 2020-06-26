##importing the necessary libraries 
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

## preprocessing the output datasets to get a total output


##setting total data index to year
#df = pd.concat([Nzone,Fzone,Tzone], axis=1).set_index('year')

##saving output dataframe to csv
#df.to_csv('total_seasonality.csv') this command saves the file output to csv

##reading total data for plotting 
data = pd.read_csv('total_seasonality.csv')
df = pd.DataFrame(data)
ax = plt.gca()
df.plot(kind='line',x='year',y='N',ax=ax)
df.plot(kind='line',x='year',y='F', color='red', ax=ax)
df.plot(kind='line',x='year',y='T', color='green', ax=ax)
plt.savefig('seasonality.jpg')