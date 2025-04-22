close all;
clear all;
clc;
%LAB 6:

x1 = [0 1 2 3];
[X,w] = dft(x1)

n2 = 0:7;
x2 = 5+2*cos(pi.*n2/2);
[X,w] = dft(x2)

n3 = 0:11;
x3 = 1+3*cos(pi.*n3/3)+sin(5*pi.*n3/6);
[X,w] = dft(x3)