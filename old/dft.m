%Aula 6 - DFT:
function [X,w] = dft(x)
x = x(:);% força o vetor a se tornar um vetor coluna
N = length(x);
W = ones(N,N);
k = 0:N-1;
n = 0:N-1;
for a = 1:N
    for b = 1:N
        W(a,b) = W(a,b)*exp(-1j*2*pi*n(b)*k(a)/N);
    end
end
X = W*x;
w = 2*pi.*k/N;
return