%teste -- DFT vs FFT:
p = 1:10;
N = 2.^p;
for i=1:length(N)
x = rand(N(i),1);
tic;
X = dft(x);
t_dft(i) = toc;
if mse(X-dft(x)) > 10^-9
error('DFT implementation contains errors');
end
tic;
X = myfft(x);
t_fft(i) = toc;
if mse(X-myfft(x)) > 10^-9
error('MyFFT implementation contains errors');
end
end
plot(N,t_dft,N,t_fft);