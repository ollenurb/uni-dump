close all, clear global;
X = [0, 1, 2, 4];
Y = [1, -1, 3, 5];

% valuto il polinomio in 100 punti tra 0 e 4
xx = linspace(0, 4, 100);
DD = diffDiv(X, Y);
yy1=neville(DD, xx);
plot(xx, yy1, 'b'); % disegno il primo polinomio con le differenze divise

hold on

% considero solo i primi 3 dati, aggiungo l'ultimo con divffDivAggNodo
DD = diffDiv(X(1:3), Y(1:3));
DD = diffDivAggNodo(DD, 4, 5);
yy2=neville(DD, xx);
plot(xx, yy2, 'r');

% considero solo gli ultimi 3 dati, aggiungo il primo con divffDivAggNodo
DD = diffDiv(X(end-2:end), Y(end-2:end));
DD = diffDivAggNodo(DD, 0, 1);
DD.xn
yy3=neville(DD, xx);
plot(xx, yy3);