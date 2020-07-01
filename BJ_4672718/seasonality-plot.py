import matplotlib.pyplot as plt
import pandas as pd

data=pd.read_csv("total_seasonability.csv")

data['year'] = pd.to_datetime(data['year'])


columns = [ 'N', 'T','F']
axes = graph[columns].plot(subplots=True, title='Annual Seasonability plot')
for label in axes:
    label.set_ylabel('S.I')
    label.set_xlabel("year")
plt.savefig('seasonabilityPlot.jpg')

