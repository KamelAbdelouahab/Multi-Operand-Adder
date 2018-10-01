# -*- coding: UTF-8 -*-
import sys
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import rcParams
params = {
    'grid.color': 'k',
    'grid.linestyle': 'dashdot',
    'grid.linewidth': 0.6,
    'font.family': 'Linux Biolinum O',
    'axes.labelsize' : 15,
    'font.size'      : 15,
    'legend.fontsize': 15,
    'xtick.labelsize': 15,
    'ytick.labelsize': 15,
    'axes.facecolor': 'white'
}
rcParams.update(params)


df  = pd.read_csv('Pipeline-MOA.csv')
print(df.transpose())

D = np.loadtxt('Pipeline-MOA.csv', delimiter=',',usecols=(1,2,3,4,5,6,7))
D = D.T
pip = D[:,0]
alm = D[:,1]
reg = D[:,2]
frq = D[:,4]

plt.figure(figsize=(5, 3))
plt.grid()
plt.plot(pip, alm, 'b^-')
plt.ylabel('ALMs')
plt.savefig("ALM-Pipeline.pdf", bbox_inches='tight')

plt.figure(figsize=(5, 3))
plt.plot(pip, reg, 'b^-')
plt.grid()
plt.ylabel('REGs')
plt.savefig("REG-Pipeline.pdf", bbox_inches='tight')

plt.figure(figsize=(5, 3))
plt.plot(pip, frq, 'b^-')
plt.grid()
plt.ylabel('Fmax')
plt.savefig("FRQ-Pipeline.pdf", bbox_inches='tight')

plt.figure(figsize=(5, 3))
plt.plot(alm, frq, 'b^-')
plt.grid()
plt.xlabel('ALMs')
plt.ylabel('Fmax')
plt.savefig("FRQ-ALM.pdf", bbox_inches='tight')

#plt.show()
