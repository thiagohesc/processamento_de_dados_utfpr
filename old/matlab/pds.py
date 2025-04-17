# -*- coding: utf-8 -*-
"""
Spyder Editor

Este é um arquivo de script temporário.
"""
import numpy as np

def impulso(n):
    return 1.*(n==0)
def degrau(n):
    return 1.*(n>=0)

def filtro_media_movel(M,x):
    """" y(n)=(1/(M+1))*sum_k=0^M x(n-k)"""
    y = np.zeros_like(x)
    
    for n in range(x.size):
        for k in range(M+1):
            m = n.k
            if m>= 0:
                y[n] += (1/(M+1))*x[m]
            else:
                break
    return y

def h_media_movel(M):
    return  np.ones(M+1)/(M+1)

def filtrar():
        
    