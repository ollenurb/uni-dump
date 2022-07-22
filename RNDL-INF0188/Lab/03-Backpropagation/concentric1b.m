load con1

% Vado a fare il training con un numero di hidden layers pari a 4, eta = 1, emax = .01
[A, B, R, err, c] = retropro(con1(:, 1:2), con1(:, 3), 4, 1, .01, 100, 1992);

[d, p] = comparer(round(R), con1(:, 3));

V = round(R);

figure(1);
hold on
for i=1:2500
    % Se classificato positivo, allora lo printiamo rosso, altrimenti blu
    if V(i) > 0
        plot(con1(i,1), con1(i,2), 'or')
    else
        plot(con1(i,1), con1(i,2), 'ob')
    end
end
hold off

% Aumento il numero di neuroni nascosti a 20, abbasso il threshold dell'errore
% a 0.005, per cui la situazione dovrebbe (teoricamente) migliorare
[A, B, R, err, c] = retropro(con1(:, 1:2), con1(:, 3), 20, 0.4, .005, 100, 1992);

V = round(R);

figure(2);
hold on
for i=1:2500
    if V(i) > 0
        plot(con1(i,1), con1(i,2), 'or')
    else
        plot(con1(i,1), con1(i,2), 'ob')
    end
end
hold off

