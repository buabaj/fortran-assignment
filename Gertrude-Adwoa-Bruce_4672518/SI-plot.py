
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

data = pd.read_csv('all_seasonality.csv')
df = pd.DataFrame(data)
ax = plt.gca()
df.plot(kind='line',x='year',y='N',ax=ax)
df.plot(kind='line',x='year',y='F', color='red', ax=ax)
df.plot(kind='line',x='year',y='T', color='green', ax=ax)
plt.savefig('seasonality.jpg')