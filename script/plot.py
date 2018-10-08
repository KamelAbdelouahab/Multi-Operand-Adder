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
    'axes.labelsize' : 18,
    'font.size'      : 18,
    'legend.fontsize': 18,
    'xtick.labelsize': 18,
    'ytick.labelsize': 18,
    'axes.facecolor': 'white'
}
rcParams.update(params)


df  = pd.read_csv('Pipeline-MOA.csv')
print(df.transpose())

D = np.loadtxt('Pipeline-MOA.csv', delimiter=',',usecols=(1,2,3,4,5,6,7))
D = D.T
#pip = D[:,0]
pip = np.array([7, 6, 5, 4, 3, 2, 1])
alm = D[:,1]
reg = D[:,2]
frq = D[:,4]

plt.figure(figsize=(4, 3))
plt.grid()
plt.plot(pip, alm, 'b^-')
plt.ylabel('ALMs')
plt.savefig("/home/kamel/Documents/PhD-Manuscript/Figures/ALM-Pipeline.pdf", bbox_inches='tight')

plt.figure(figsize=(4, 3))
plt.plot(pip, reg, 'b^-')
plt.grid()
plt.ylabel('REGs')
plt.savefig("/home/kamel/Documents/PhD-Manuscript/Figures/REG-Pipeline.pdf", bbox_inches='tight')

plt.figure(figsize=(4, 3))
plt.plot(pip, frq, 'b^-')
plt.grid()
plt.ylabel('Fmax')
plt.savefig("/home/kamel/Documents/PhD-Manuscript/Figures/FRQ-Pipeline.pdf", bbox_inches='tight')

plt.figure(figsize=(6, 3))
plt.plot(alm, frq, 'b^-')
plt.grid()
plt.xlabel('ALMs')
plt.ylabel('Fmax')
plt.savefig("/home/kamel/Documents/PhD-Manuscript/Figures/FRQ-ALM.pdf", bbox_inches='tight')

#plt.show()
