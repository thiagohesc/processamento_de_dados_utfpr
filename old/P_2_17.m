%P.2.17: Sistema em tempo discreto descrito por:
%y[n] = 1.15*y[n-1]-1.5*y[n-2]+0.7*y[n-3]-0.25*y[n-4]+0.18*x[n]+0.1*x[n-1]+0.3*x[n-2]+0.1*x[n-3]+0.18x[n-4]
%OBS.:
%b_k = s�o os coeficientes de feedfoward, aqueles que acompanham x[n-k]
%a_k = s�o os coeficientes de feedback, aqueles que acompanham y[n-k]
%condi��es iniciais nulas.
%Comparar e explicar os resultados obtidos.

clear all;
close all;
clc;
n = 0:100;
a = [1 -1.15 1.5 -0.7 0.25];
b = [0.18 0.1 0.3 0.1 0.18];
x = ones(1,101);

%a)Determinar e plotar a resposta ao impulso unit�rio h[n], atrav�s da fun��o h = impz(b,a,N)
% na fun��o impz, temos:
% b = vetor dos coeficientes de feedfoward;
% a = vetor dos coeficientes de feedback;
%na fun��o impz devemos considerar os termos com y do lado direito no lado
%esquerdo, ou seja, os coeficientes a colocados no vetor s�o os opostos
%daqueles descritos na equa��o a diferen�as
% N  = vetor com o numero de amostras e quais posi��es devem ser amostradas;
h = impz(b,a,101);
figure;
stem(n,h);
title('Resposta ao Impulso');
xlabel('Amostras');
ylabel('Amplitude');
%b)Determinar e plotar y[n] se x[n] = u[n], com a fun��o y = filter(b,a,x)
y1 = filter(b,a,x);
figure;
stem(n,y1);
title('Sa�da por filter(b,a,x)');
xlabel('Amostras');
ylabel('Amplitude');
%c)Determinar e plotar y[n] se x[n] = u[n], com a fun��o y = conv(h,x)
y2 = conv(x,h);
figure;
stem(y2);
title('Sa�da por conv(h,x)');
xlabel('Amostras');
ylabel('Amplitude');
%d)Determinar e plotar y[n] se x[n] = u[n], com a fun��o y = filter(h,1,x)
y3 = filter(h,1,x);
figure;
stem(n,y3);
title('Sa�da por filter(h,1,x)');
xlabel('Amostras');
ylabel('Amplitude');