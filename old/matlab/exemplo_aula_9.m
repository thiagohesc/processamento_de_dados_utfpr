%Aula 9
clear all;
clc;
close all;
M = 38;
n = 0:M;
wc = pi/2;
h = sinc2((n-M/2),wc);
stem(n,h);
figure;
[H,w] = freqz(h);
plot(w/pi,abs(H));