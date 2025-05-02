import numpy as np
import matplotlib.pyplot as plt

w = np.linspace(-3 * np.pi, 3 * np.pi, 1024)
L = 5

X = np.exp(-1j * w * (L - 1) / 2) * (np.sin(w * L / 2) / np.sin(w / 2))

fig, ax1 = plt.subplots()
ax2 = ax1.twinx()

ax1.plot(w, np.abs(X))
ax2.plot(w, np.angle(X))
plt.show()

A = np.sin(w * L / 2) / np.sin(w / 2)
Psi = -w * (L - 1) / 2

fig, ax1 = plt.subplots()
ax2 = ax1.twinx()

ax1.plot(w, A)
ax2.plot(w, Psi)
plt.show()
