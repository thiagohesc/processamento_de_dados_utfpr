%REVERBERAÇÃO(P.2.19):
load handel;%carrega y e Fs
%constantes de tempo:
t1 = 50e-3;
t2 = 100e-3;
t3 = 500e-3;
%atenuação:
a = 0.7;
%numero de elementos do sinal de entrada
b = [1];
%constantes D:
D1 = round(t1*Fs);
D2 = round(t2*Fs);
D3 = round(t3*Fs);
%Vetor A(quantidade de elementos da saída):
A1 = [1 zeros(1,D1-2) a];
A2 = [1 zeros(1,D2-2) a];
A3 = [1 zeros(1,D3-2) a];


%1)
%sound(y,Fs);

%2)

%3)
Z1 = filter(b,A1,y);
% sound(Z1);
Z2 = filter(b,A2,y);
% sound(Z2);
Z3 = filter(b,A3,y);
sound(Z3);
