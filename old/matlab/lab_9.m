%Aula 9
clear all;
clc;
close all;

M = 20;
nf = 0:M;
ns = 0:100;
w1 = 3*pi/20;
w2 = 7*pi/20;
x = cos(pi*ns/10)+cos(pi*ns/5)+cos(pi*ns/2);
hd1 = sinc2((nf-M/2),w1);
hd2 = sinc2((nf-M/2),w2);
hd = hd2 - hd1;
figure;
[H,w] = freqz(hd);
plot(w/pi,abs(H));
xf = filter(hd,1,x);
figure;
stem(ns,x);
figure;
stem(ns,xf);
x1 = cos(pi*ns/5);
figure;
stem(x1);