clear all;
close all;
clc;

%Especificação do filtro:
dp = 0.05;
ds = 0.05;

wp = 0.4*pi;
ws = 0.6*pi;

%Projeto:
wc = (wp+ws)/2;
N = ((-20*log10(sqrt(dp*ds)))-13)/((14.6*(ws-wp))/(pi));
N = ceil(N);
M = 2*N;
L = M + 1;

n = -N:N;
h = sinc2(n,wc);%resposta ao impulso inicial do filtro FIR

K = 15*N; %tamanho da FFT

IT = 30; %número de iterações
it = 0;

w = (2*pi*(0:K-1)/K);
Hid = zeros(1,K)+1*((w<wp) | (w> (2*pi-wp)));
E = (dp*Hid) + (~Hid)*ds;

while it<IT
    H = fft(h,K);
    G = abs(H).*((abs(H)<(Hid+E) | abs(H)>(Hid-E))|(abs(H)>(Hid+E) | abs(H)<(Hid-E)))+(Hid+E).*(abs(H)>(Hid+E))+(Hid-E).*(abs(H)<(Hid-E));
    plot(G);
    g = ifft(G.*phase(H),'symmetric');
    h = g;
    h(L+1:end) = 0; %realiza o zero padding da resposta ao impulso do filtro
    it = it + 1;
    close all;
end

H = fft(h,K);
plot(w/pi,abs(H));