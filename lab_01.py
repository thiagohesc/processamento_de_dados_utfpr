import numpy as np
import matplotlib.pyplot as plt
from pds import PDS

# Coeficientes do sistema
b = [1]
a = [1, 0.5]

# Sinal de impulso: x = [1, 0, 0, ..., 0]
n = np.arange(13)
x = np.zeros_like(n)
x[0] = 1  # impulso em n = 0

# Aplicar filtro usando sua função eqdif
y = PDS.eqdif(b, a, x)

# Plotar resultado
plt.stem(n, y)
plt.xlabel("n")
plt.ylabel("y[n]")
plt.title("Resposta ao Impulso do Sistema")
plt.grid(True)
plt.show()
