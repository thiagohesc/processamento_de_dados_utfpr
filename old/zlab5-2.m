%laboratório 5
close all;
clear all;
clc;
% t = 2;
% T = (1/Fs)*t;
% n = 0:T:2;
% x_n = cos(2*pi*F1.*n);

Fs = 8192;
F1 = 440;%frequência do sinal
F2 = 1000;%frequência do ruído
b0 = 1;
r = 0.9;
T = 2;
N = T*Fs;
n = 0:N-1;
w1 = 2*pi*F1/Fs;
w2 = 2*pi*F2/Fs;

a = [1 -2*r*cos(w2) r^2];
b = [1 -2*cos(w2) 1];

x1 = cos(w1*n);
sound(x1,Fs);
pause(2);

noise = cos(w2*n);
sound(noise,Fs);
pause(2);

sujo = x1+noise;
sound(sujo,Fs);
pause(2);

limpo = filter(b,a,sujo);
sound(limpo, Fs);
pause(2);

erro = x1 - limpo;
sound(erro,Fs);
pause(2);