import pandas as pd
import matplotlib.pyplot as plt

North_data = pd.read_csv('North.csv')
North = pd.dataFrame(North_data)
Forest_data = pd.read_csv('Forest.csv')
Forest = pd.DataFrame(Forest_data)
Trans_data = pd.read_csv('Trans.csv')
Trans = pd.DataFrame(Trans_data)

#df = pd.concat(['North', 'Forest', 'Trans'], axis=1).to_csv('climatology.csv')
climatology = pd.read_csv('climatology.csv')
climatology['month'] = pd.to_datetime(climatology['month'])
columns = [ 'North', 'Forest','Trans']
axes = climatology[columns].plot(marker='o', linestyle='-', figsize=(14, 8), subplots=True,color="green")
for label in axes:
    label.set_ylabel('rainfall')
    label.set_xlabel("Month")
plt.savefig('Plot-a.png')
