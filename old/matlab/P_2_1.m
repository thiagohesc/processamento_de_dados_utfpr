%P.2.1: Gere e plot os sinais abaixo:

clear all;
close all;
clc;
n = -20:40;

%a)impulso unitário:
figure;
stem(n,(n==0));
title('Impulso Unitario');
xlabel('Amostra');
ylabel('Amplitude');
%b)degrau unitário:
figure;
stem(n,(n>=0));
title('Degrau Unitario');
xlabel('Amostra');
ylabel('Amplitude');
%c)sinal exponencial real: x[n] = (0.80)^n
x1 = (0.8).^n;
figure;
stem(n,x1);
title('Exponencial Real');
xlabel('Amostra');
ylabel('Amplitude');
%d)sinal exponencial complexo: x[n] = (0.9*e^(j*pi/10))^n
x2 = (0.9*exp(i*pi/10)).^n;
figure;
stem(n,real(x2));
hold on;
stem(n,imag(x2),'filled');
title('Exponencial Complexa');
xlabel('Amostra');
ylabel('Amplitude');
legend('Parte Real','Parte Imaginaria');
%e)sinal senoidal: x[n] = 2*cos[2*pi*0.3*n+(pi/3)]
x3 = 2.*cos((2.*pi.*0.3.*n)+(pi/3));
figure;
stem(n,x3);
title('Senoide');
xlabel('Amostra');
ylabel('Amplitude');