import matplotlib.pyplot as plt
import pandas as np

a = pd.read_csv('every_zone.csv')
b = pd.DataFrame(a)
b['month'] = pd.to_datetime(b['month'])
col = [ 'North_zone', 'Forest_zone','Trans_zone']
j = b[col].plot(subplots=True)
for x in y:
    label.set_ylabel('Rainfall')
    label.set_xlabel("Month")
plt.savefig('question1a.jpg')