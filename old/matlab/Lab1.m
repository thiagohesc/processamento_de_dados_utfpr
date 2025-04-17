b = 1;
a = [1 .5];
impz(b,a);

n = 0:12;
x = [1,zeros(1,12)];
y=filter(b,a,x);
figure;
stem(n,y);
