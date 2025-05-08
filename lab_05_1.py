import numpy as np
import sounddevice as sd
import time
from scipy.signal import lfilter

Fs = 8192  # Frequência de amostragem
F1 = 440  # Frequência do sinal
F2 = 1000  # Frequência do ruído

b0 = 1
r = 0.9
T = 2  # Duração em segundos
N = int(T * Fs)  # Número total de amostras
n = np.arange(N)

# Frequências normalizadas, em radianos por amostra
w1 = 2 * np.pi * F1 / Fs
w2 = 2 * np.pi * F2 / Fs

# Coeficientes do filtro
a = [1, -2 * r * np.cos(w2), r**2]
b = [1, -2 * np.cos(w2), 1]

# Sinal desejado
x1 = np.cos(w1 * n)
sd.play(x1, Fs)
sd.wait()
time.sleep(2)

# Sinal de ruído
noise = np.cos(w2 * n)
sd.play(noise, Fs)
sd.wait()
time.sleep(2)

# Sinal contaminado
sujo = x1 + noise
sd.play(sujo, Fs)
sd.wait()
time.sleep(2)

# Filtragem do sinal
limpo = lfilter(b, a, sujo)
sd.play(limpo, Fs)
sd.wait()
time.sleep(2)

# Erro diferença entre original e filtrado
erro = x1 - limpo
sd.play(erro, Fs)
sd.wait()
time.sleep(2)
