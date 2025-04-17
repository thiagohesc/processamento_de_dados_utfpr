% Aula 8 - FFT;
function X = myfft(x)
    x = x(:);
    N = length(x);
    M = log2(N);
    if M - round(M)
        error('Not 2^p');%avisa o erro e interrompe totalmente a execução
    end
    if N > 1                      %divide o vetor de sinal x em componentes de coeficiente par e coeficiente impar
        Xe = myfft(x(1:2:end)); %apesar do inicio ser em 1, temos que o primeiro valor do vetor é dado por n = 0 e
        Xo = myfft(x(2:2:end)); %mesma coisa que a linha anterior
        k = 0:((N/2)-1);
        W = exp(-1j.*k*pi*2/N);
        X1 = zeros(N/2);
        X2 = X1;
        for i = 1:(N/2-1)
            X1(i) = Xe(i)+W(i)*Xo(i);   %X[i]
            X2(i) = Xe(i)-W(i)*Xo(i);   %X[i+N/2]
        end
        X = [X1 X2];
    else
        X = x;
    end
return;
        