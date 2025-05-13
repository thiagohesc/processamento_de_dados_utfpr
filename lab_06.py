"""
Lab: 6 - Implementação e teste da DTFT
Testar nos sinais: retângulo, senoide e exponencial real
"""

import numpy as np
import matplotlib.pyplot as plt
from pds import PDS

n = np.arange(-150, 151)

# Retângulo
L = 11
x1 = PDS.u(n) - PDS.u(n - L)
w, X1 = PDS.dtft(n, x1)

plt.figure(1)
plt.plot(w / np.pi, np.abs(X1))
plt.show()
plt.figure(2)
plt.plot(w / np.pi, np.angle(X1))
plt.show()

# Senoide real
w0 = np.pi / 4
x2 = np.cos(w0 * n)
w, X2 = PDS.dtft(n, x2)

plt.figure(3)
plt.plot(w / np.pi, np.abs(X2))
plt.show()
plt.figure(4)
plt.plot(w / np.pi, np.angle(X2))
plt.show()

# Senoide complexa
x3 = np.exp(1j * w0 * n)
w, X3 = PDS.dtft(n, x3)

plt.figure(5)
plt.plot(w / np.pi, np.abs(X3))
plt.show()
plt.figure(6)
plt.plot(w / np.pi, np.angle(X3))
plt.show()

# Senoide complexa negativa
x3 = np.exp(1j * -w0 * n)
w, X3 = PDS.dtft(n, x3)

plt.figure(7)
plt.plot(w / np.pi, np.abs(X3))
plt.show()
plt.figure(8)
plt.plot(w / np.pi, np.angle(X3))
plt.show()
