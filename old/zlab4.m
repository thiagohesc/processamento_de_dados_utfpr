close all;
clear all;
clc;

w = linspace(-3*pi, 3*pi, 1024);
L = 5;
X = exp(-1j*w*(L-1)/2).*(sin(w*L/2)./sin(w/2));
plotyy(w,abs(X),w,angle(X));

A = sin(w*L/2)./sin(w/2);
Psi = -w*(L-1)/2;
figure;
plotyy(w,A,w,Psi);