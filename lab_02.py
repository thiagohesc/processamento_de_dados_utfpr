import numpy as np
import sounddevice as sd
import scipy.signal as ss
import time

# Frequência de amostragem do sinal (Hz)
Fs = 8192  # 8192 amostras por segundo

# Carrega sinal salvo em arquivo .npy
x = np.load("123test.npy")

# Fator de realimentação (feedback)
alpha = 0.7  # Valor entre 0 e 1; quanto maior, mais "eco"

# Tempos de atraso desejados (em segundos)
tau1 = 50e-3  # 50 ms → 20 Hz
tau2 = 100e-3  # 100 ms → 10 Hz
tau3 = 500e-3  # 500 ms → 2 Hz

# Conversão dos tempos para número de amostras
D1 = round(Fs * tau1)
D2 = round(Fs * tau2)
D3 = round(Fs * tau3)

# Coeficientes do numerador (sem convolução direta)
b = np.array([1])


# Função para gerar os coeficientes A com atraso D e ganho alpha
def gerar_A(D, alpha):
    """
    Gera vetor de coeficientes A para filtro com realimentação atrasada.
    A estrutura gerada é: [1, 0, ..., 0, alpha], com alpha na posição D.
    """
    if D < 1:
        raise ValueError("D deve ser pelo menos 1")
    elif D == 1:
        return np.array([1, alpha])
    else:
        return np.concatenate(([1], np.zeros(D - 2), [alpha]))


# Geração dos coeficientes de cada filtro
A1 = gerar_A(D1, alpha)
A2 = gerar_A(D2, alpha)
A3 = gerar_A(D3, alpha)

# Aplicação dos filtros
y1 = ss.lfilter(b, A1, x)
y2 = ss.lfilter(b, A2, x)
y3 = ss.lfilter(b, A3, x)

# Reprodução do sinal filtrado com pausas entre eles
print("Reproduzindo sinal com atraso t1 (50 ms)...")
sd.play(y1, Fs, blocking=True)
time.sleep(2)

print("Reproduzindo sinal com atraso t2 (100 ms)...")
sd.play(y2, Fs, blocking=True)
time.sleep(2)

print("Reproduzindo sinal com atraso t3 (500 ms)...")
sd.play(y3, Fs, blocking=True)
time.sleep(2)

# Impressão dos coeficientes para inspeção
print("\nCoeficientes dos filtros:")
print(f"A1 (t1 = {tau1*1000:.0f} ms): {A1}")
print(f"A2 (t2 = {tau2*1000:.0f} ms): {A2}")
print(f"A3 (t3 = {tau3*1000:.0f} ms): {A3}")
