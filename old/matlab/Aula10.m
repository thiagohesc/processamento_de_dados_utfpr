%Aula 10

clc;
clear all;
close all;

% M=66;
% n=0:M;
% hd=sin(.3*pi*(n-M/2+eps))./(pi*(n-M/2+eps));
% w=hamming(M+1);
% 
% h=hd'.*hamming(M+1);
% [H,W]=freqz(h);
% plot(W, abs(H));
% hold on;
% 
% M=80;
% n=0:M;
% hd=sin(.3*pi*(n-M/2+eps))./(pi*(n-M/2+eps));
% w=hamming(M+1);
% 
% h=hd'.*hamming(M+1);
% [H,W]=freqz(h);
% plot(W, abs(H),'r');
% 
% hold on;
% 
% M=150000;
% n=0:M;
% hd=sin(.3*pi*(n-M/2+eps))./(pi*(n-M/2+eps));
% w=hamming(M+1);
% 
% h=hd'.*hamming(M+1);
% [H,W]=freqz(h);
% plot(W, abs(H),'k');

%Janela ajustavel -> Kaiser:

w = 0.1*pi;
A = 50;
beta = .58452*(A-21)^.4+0.07886*(A-21)
M = (A-8)/(2.285*w);

M = 60;
n = (0:M)';
hd= sin(.3*pi*(n-M/2+eps))./(.3*pi*(n-M/2+eps));
h =hd'*kaiser(M+1,beta);
[H,W] = freqz(h);
plot(W,H);