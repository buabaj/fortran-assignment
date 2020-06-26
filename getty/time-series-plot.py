import matplotlib.pyplot as plt
import pandas as np

#####I joined the data outputs to get the file all_data.csv
file = pd.read_csv('all_data.csv')
data = pd.DataFrame(file)
data['month'] = pd.to_datetime(data['month'])
y = [ 'Norther_zone', 'Forest_zone','Transition_zone']
j = data[y].plot(marker='o', linestyle='-', subplots=True,color="black")
for i in j:
    label.set_ylabel('Rain')
    label.set_xlabel("Month")
plt.savefig('Time-Plot.jpg')