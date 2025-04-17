%Laboratório 10
clc;
clear all;
close all;

M = 30;
n = 0:M;
hd1 = sin(0.3*pi*(n-M/2+eps))./(pi*(n-M/2+eps))-sin(0.7*pi*(n-M/2+eps))./(pi*(n-M/2+eps));

w1 = hann(M+1);

h1 = hd1'.*w1;
[H1,W1] = freqz(h1);
plot(W1, abs(H1),'k');
hold on;

A = 40;
M = 24;
n = 0:M;
beta = .58452*(A-21)^.4+0.07886*(A-21);
hd2 = sin(0.3*pi*(n-M/2+eps))./(pi*(n-M/2+eps))-sin(0.7*pi*(n-M/2+eps))./(pi*(n-M/2+eps));
w2 = kaiser(M+1,beta);
h2 = hd2'.*w2;
[H2,W2] = freqz(h2);
plot(W2, abs(H2), 'r');
grid on;
legend('H1','H2');

figure;
ns = 0:100;
x = cos(pi*ns/10)+cos(4*pi*ns/5)+cos(pi*ns/2);
stem(ns,x);
title('Sinal original');

figure;
[X,Wx] = freqz(x);
plot(Wx/pi, abs(X));
title('Resposta em frequência - sinal original');

figure;
xf = filter(hd1,1,x);
stem(ns,xf);
title('Sinal Filtrado - Janela Hann');

figure;
[Xf,Wf] = freqz(xf);
plot(Wf/pi, abs(Xf));
title('Resposta em frequência - Janela Hann');

figure;
xf2 = filter(hd2,1,x);
stem(ns,xf2);
title('Sinal Filtrado - Janela Kaiser');

figure;
[Xf2,Wf2] = freqz(xf2);
plot(Wf2/pi, abs(Xf2));
title('Resposta em frequência - Janela Kaiser');