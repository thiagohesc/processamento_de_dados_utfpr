# -*- coding: utf-8 -*-
"""
Created on Fri Mar 13 16:34:31 2020

@author: Angels
"""

import numpy as np
import matplotlib.pyplot as plt
import pds

n = np.arange(-3,7)
x = pds.impulso(n)

M = 3
y = pds.filtro_media_movel(M,x)
h = pds.h_media_movel(M)

plt.figure(1)
plt.stem(n, x)
plt.xticks(n)

plt.figure(2)
plt.stem(n, x)
plt.xticks(n)

