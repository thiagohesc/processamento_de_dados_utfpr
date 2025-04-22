import numpy as np
import matplotlib.pyplot as plt

# Tamanho do sinal
N = 256
n = np.arange(N)

# Frequência
w0 = np.pi / 50

# Sinal original
x_clean = np.cos(w0 * n)

# Sinal com ruído
x = x_clean + np.random.randn(N)

# filtro M
M = 30
y = np.zeros_like(x)

for i in range(len(x)):
    soma = 0
    contador = 0
    for k in range(M + 1):
        m = i - k
        if m >= 0:
            soma += x[m]
            contador += 1
    y[i] = soma / contador

plt.plot(n, x, label="Sinal ruidoso")
plt.plot(n, y, label="Sinal filtrado")
plt.plot(n, x_clean, label="Sinal original")
plt.legend()
plt.show()
