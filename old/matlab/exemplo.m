close all;
clc;
clear all;
N = 1000;
n = 0:N-1;

x = cos(n*pi/5)+sin(n*4.05*pi/10);
[Xdtft, wdtft] = dtft(N,x/N);
% Xdft = fft(x/N);
% wdft = linspace(0,2*pi-2*pi/N, N);

%ZERO-PADDING
%  x = cos(n*7*pi/35) + 3*cos(n*25*pi/35);
%  x = cos(n*7*2*pi/70) + 3*cos(n*30*2*pi/70);

M = 2000;
K = M - N;
x_zp = [x, zeros(1,K)];
X_zp = fft(x_zp/M);
w_zp = linspace(0,(2*pi-2*pi/M),M);
figure;
plot(w_zp,abs(X_zp));
title('ZERO-PADDING');

% Mais amostras
N = M;
n = 0:N-1;
x = cos(n*pi/5)+sin(n*4.05*pi/10);
[Xdtft,wdtft] = dtft(N,x/N);
Xdft = fft(x/N);
wdft = linspace(0,2*pi-2*pi/N,N);
figure;
%plot(wdtft,abs(Xdtft));
%hold on;
stem(wdft,abs(Xdft));
