import pandas as pd
import matplotlib.pyplot as plt

##i manually joined the datasets to get total data as climatology.csv
climatology = pd.read_csv('climatology.csv')
climatology['month'] = pd.to_datetime(climatology['month'])
columns = [ 'North', 'Forest','Trans']
axes = climatology[columns].plot(marker='o', linestyle='-', figsize=(14, 8), subplots=True,color="green")
for label in axes:
    label.set_ylabel('rainfall')
    label.set_xlabel("Month")
plt.savefig('Plot-a.png')
