##importing the necessary libraries 
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

## preprocessing the output datasets to get a total output
month = [1,2,3,4,5,6,7,8,9,10,11,12]
N = pd.read_csv('Nzone_data.csv', names='N', header=None)
Nzone = pd.DataFrame(N)
Nzone['month'] = month
F = pd.read_csv('Fzone_data.csv', names='F', header=None)
Fzone = pd.DataFrame(F)
Fzone['month'] = month
T = pd.read_csv('Tzone_data.csv', names='T', header=None)
Tzone = pd.DataFrame(T)
Tzone['month'] = month

##setting total data index to month
#df = pd.concat([Nzone,Fzone,Tzone], axis=1).set_index('month')

##saving output dataframe to csv
#df.to_csv('total_data.csv') this command saves the file output to csv

##reading total data for plotting timeseries
data = pd.read_csv('total_data.csv')

##plotting timeseries on single plot
data['month'] = pd.to_datetime(data['month'])
columns = [ 'N', 'F','T']
axes = data[columns].plot(title='Time series plot of seasonal climatology',subplots=True)
for label in axes:
    label.set_ylabel('Average')
    label.set_xlabel("Month")
plt.savefig('timeSeriesPlot.png')
