function [X,W] = dtft(x,n)

    x = x(:);
    n = n(:);
    N = length(x);
    M = 1024;
    W = linspace(-pi,pi,M)';
    X = zeros(size(W));

    if ~exist('n','var')
        n = (0:N-1)';
    
    for a = 1:M
        for b = 1:N
            X(a) = X(a) + x(b)*exp(-1j*W(a)*n(b));
        end
    end

    figure;
    subplot(2,2,1),plot(W,real(X)),title('Parte Real da Transformada'),xlabel('Frequência'),ylabel('Parte Real'),grid on;
    subplot(2,2,2),plot(W,imag(X)),title('Parte Imaginária da Transformada'),xlabel('Frequência'),ylabel('Parte Imaginária'),grid on;
    subplot(2,2,3),plot(W,abs(X)),title('Magnitude da Transformada'),xlabel('Frequência'),ylabel('Magnitude'),grid on;
    subplot(2,2,4),plot(W,angle(X)),title('Fase da Transformada'),xlabel('Frequência'),ylabel('Fase'),grid on;

return