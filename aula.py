import numpy as np
import matplotlib.pyplot as plt
from pds import PDS

# dtft analitica

L = 11

w = np.linspace(-2 * np.pi, 2 * np.pi, 1024)
A = np.sin(w * L / 2) / np.sin(w / 2)
psi = -w * (L - 1) / 2

plt.figure(1)
plt.plot(w, A)
plt.show()

plt.figure(2)
plt.plot(w, psi)
plt.show()

X = A * np.exp(1j * psi)
plt.figure(3)
plt.plot(w, np.abs(X))
plt.show()

plt.figure(4)
plt.plot(w, np.unwrap(np.angle(X)))
plt.show()

# dtft inversa analitica
n = np.arange(-20, 21)
wc = np.pi / 4
x = PDS.sinc2(n, wc)
plt.figure(5)
plt.stem(n, x)
plt.show()
