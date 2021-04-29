clear all, close all

f = @(x) sign(x);
X1 = linspace(-5, 5, 4);
X2 = linspace(-5, 5, 6);
X3 = linspace(-5, 5, 8);
X4 = linspace(-5, 5, 12);

Y1 = f(X1);
Y2 = f(X2);
Y3 = f(X3);
Y4 = f(X4);

DD1 = diffDiv(X1, Y1);
DD2 = diffDiv(X2, Y2);
DD3 = diffDiv(X3, Y3);
DD4 = diffDiv(X4, Y4);

xx = linspace(-5, 5, 1000);

yy1 = neville(DD1, xx);
yy2 = neville(DD2, xx);
yy3 = neville(DD2, xx);
yy4 = neville(DD4, xx);


plot(xx, yy1);
hold on;
plot(xx, yy2);
plot(xx, yy3);
plot(xx, yy4);
plot(xx, f(xx));
legend('p4','p6','p8','p12', 'sign');
