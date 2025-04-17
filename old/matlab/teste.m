t = -10:0.01:10;
x1 = exp(t);
x2 = exp(-t);
x3 = exp(-10*t);
x4 = exp(10*t);
subplot(2,2,1), plot(t,x1);
subplot(2,2,2), plot(t,x2);
subplot(2,2,3), plot(t,x3);
subplot(2,2,4), plot(t,x4);