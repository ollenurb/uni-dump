clear all
X = linspace(0, 2*pi, 8);
Y = sin(X);

DD = diffDiv(X, Y);
xx = linspace(0, 2*pi, 1000);
yyA = neville(DD, xx);
yyR = sin(xx);

% Valuto la distanza tra sin(x) e il suo polinomio interpolatore
% RImuovere i commenti solo per DEBUG
plot(xx, yyA, 'b');
hold on;
plot(xx, yyR, 'g');


diffs = abs(yyR-yyA);
max(diffs)
%%
% Fenomeno di Runge
f = @(x) 1./(1+25.*x.^2);

xx1 = linspace(-5, 5, 3);
xx2 = linspace(-5, 5, 5);
xx3 = linspace(-5, 5, 7);
xx4 = linspace(-5, 5, 11);

X = linspace(-5, 5);

yy1 = neville(diffDiv(xx1,f(xx1)), X);
yy2 = neville(diffDiv(xx2,f(xx2)), X);
yy3 = neville(diffDiv(xx3,f(xx3)), X);
yy4 = neville(diffDiv(xx4,f(xx4)), X);



fplot(f, [-5, 5]);
hold on;
plot(X, yy1);
plot(X, yy2);
plot(X, yy3);
plot(X, yy4);
