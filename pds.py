import numpy as np


class PDS:
    """
    Classe PDS - Biblioteca auxiliar para os laboratórios da disciplina de Processamento de Dados.
    Esta classe reúne um conjunto de funções reutilizáveis desenvolvidas para apoiar atividades práticas.
    """

    @staticmethod
    def delta(n: int) -> float:
        """Retorna 1.0 se n for igual a 0, caso contrário retorna 0.0.

        Args:
            n (int): Valor a ser testado A função verifica se n é igual a zero.

        Returns:
            float: Retorna 1.0 se n for igual a 0, senão retorna 0.0.
        """
        return float(1 * (n == 0))

    @staticmethod
    def u(n: int) -> float:
        """
        Retorna 1.0 se n for maior ou igual a 0, caso contrário retorna 0.0.
        Implementa a função degrau unitário discreta.

        Args:
            n (int): Valor de entrada a ser avaliado.

        Returns:
            float: 1.0 se n >= 0, senão 0.0.
        """
        return float(n >= 0)

    @staticmethod
    def eqdif(b: list, a: list, x: list | np.ndarray) -> np.ndarray:
        """
        Simula a saída de um sistema LTI (Linear e Invariante no Tempo) descrito por uma equação de diferenças.

        Essa função implementa:
            y[n] = sum(b[k] * x[n-k]) - sum(a[k] * y[n-k]), com a[0] = 1

        Args:
            b (list): Coeficientes do termo direto (entrada).
            a (list): Coeficientes do termo recursivo (realimentação). a[0] deve ser 1.
            x (list or np.ndarray): Sinal de entrada.

        Returns:
            np.ndarray: Sinal de saída y[n] resultante da equação de diferenças.
        """
        b = np.asarray(b)
        a = np.asarray(a)
        x = np.asarray(x)
        N = len(x)
        y = np.zeros(N)

        for n in range(N):
            for k in range(min(n + 1, len(b))):
                y[n] += b[k] * x[n - k]
            for k in range(1, min(n + 1, len(a))):
                y[n] -= a[k] * y[n - k]
        return y

    @staticmethod
    def mse(x: float, y: float) -> float:
        """
        Calcula o Erro Quadrático Médio (MSE) entre dois valores.

        Args:
            x (float): valor de referência.
            y (float): valor comparado.

        Returns:
            float: Valor do erro quadrático médio entre x e y.
        """
        return np.mean((x - y) ** 2)
