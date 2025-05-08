import numpy as np
import sounddevice as sd
import matplotlib.pyplot as plt
from scipy.signal import freqz, lfilter

# Frequência de amostragem do sinal (Hz)
Fs = 8192   # 8192 amostras por segundo
F1 = 440    # Frequência do sinal
F2 = 1000   # Frequência do ruído
r = 0.95
T = 2
N = int(T * Fs)
n = np.arange(N)

# Cálculo das frequências normalizadas
w1 = 2 * np.pi * F1 / Fs
w2 = 2 * np.pi * F2 / Fs

# Coeficientes dos filtros
a = [1, -2 * r * np.cos(w2), r**2]
b = [1, -2 * np.cos(w2), 1]

# Sinais
x1 = np.cos(w1 * n)

#x1 = np.load("123test.npy")  # mesmo áudio do Lab 2
#N = len(x1)
#n = np.arange(N)

x2 = np.cos(w2 * n)

# Toca o sinal puro
sd.play(x1, Fs)
sd.wait()

# Soma do sinal com ruído
x = x1 + x2

# Toca o sinal com ruído
sd.play(x, Fs)
sd.wait()

# Visualização da resposta em frequência
w, h = freqz(b, a)
plt.figure()
plt.title("Resposta em Frequência do Filtro")
plt.plot(w * Fs / (2 * np.pi), 20 * np.log10(abs(h)))
plt.xlabel('Frequência (Hz)')
plt.ylabel('Magnitude (dB)')
plt.grid()
plt.show()

# Filtragem
y = lfilter(b, a, x)

# Toca o sinal filtrado
sd.play(y, Fs)
sd.wait()
