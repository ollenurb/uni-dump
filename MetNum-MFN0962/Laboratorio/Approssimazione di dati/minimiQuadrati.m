clear all
x = [6.5, 7.0, 8.0, 8.5, 9.0, 9.1];
y = [17.769, 24.001, 25.961, 34.336, 29.036, 33.417];

xx = linspace(min(x), max(x));

% calcolo i polinomi con metodo dei minimi quadrati
subplot(3, 1, 1);
for i=1:4
    p = polyfit(x, y, i);
    yy = polyval(p, xx);
    plot(xx, yy);
    hold on;
end
plot(x, y, 'o');
legend('n=1','n=2','n=3','n=4','dati');
title('Approssimanti MQ con polyfit');

% calcolo i polinomi con metodo di vandermonde
subplot(3, 1, 2);
A = fliplr(vander(x));
for i = 1:4
    V = A(:,1:i+1);
    b = (V')*y';
    coeffs = (V'*V)\b;
    yy = polyval(flipud(coeffs), xx);
    plot(xx, yy);
    hold on;
end
plot(x, y, 'o');
legend('n=1','n=2','n=3','n=4','dati');
title('Approssimanti MQ con Vandermonde');

% calcolo del polinomio interpolante sui punti
subplot(3, 1, 3);
p = polyfit(x, y, length(x)-1);
yy = polyval(p, xx);
plot(xx, yy);
hold on;
plot(x, y, 'o');
legend('p. int', 'dati');
title('Polinomio interpolante di grado n');



