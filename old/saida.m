%Determinar a saída y[n] para x[n] = u[n] e h[n] = (1/2)*u[n]:
clear all;
close all;
clc;
n = 0:50;
x = degrau(n);
h = ((1/2).^n).*x;
y1 = filter(h,1,x);
y2 = filter(1,[1 -1/2],x);
stem(n,y1);