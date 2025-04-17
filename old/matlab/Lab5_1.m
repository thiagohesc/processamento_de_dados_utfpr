%laboratório 5
close all;
clear all;
clc;

Fs = 8192;
F1 = 440; %frequência do sinal
F2 = 1000; %frequência do ruído
r = 0.95;
T = 2;
N = T*Fs;
n = 0:N-1;

w1 = 2*pi*F1/Fs;
w2 = 2*pi*F2/Fs;

a = [1 -2*r*cos(w2) r^2];
b = [1 -2*cos(w2) 1];
b0 = 1;

x1 = cos(w1*n);
x2 = cos(w2*n);

sound(x1,Fs);
pause;

x = x1+x2;

sound(x,Fs);
pause;

freqz(b,a);

y = filter(b,a,x);
sound(y, Fs);
pause(2);
