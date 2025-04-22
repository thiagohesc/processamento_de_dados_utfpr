function x = sinc2(n,wc)
x = sin(wc*(n+eps))./(pi*(n+eps));
return