import matplotlib.pyplot as plt
import pandas as np
file = pd.read_csv('total.csv')
data = pd.DataFrame(file)
data['month'] = pd.to_datetime(data['month'])
columns = [ 'North', 'Forest','Trans']
axis = data[columns].plot(subplots=True,color="green")
for i in axis:
    label.set_ylabel('average')
    label.set_xlabel("Month")
plt.savefig('time_graph.jpg')