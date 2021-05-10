function x=lusolve_nopivot(A,b)
% Risolve il sistema lineare A*x=b 
% richiamando ludecomp_nopivot
% Tale sistema è equivalente a L*U*x=b
% dove U=triu(LU) e 
% L=eye(n)+tril(LU,-1)

% Risolviamo prima il sistema triang. inf. L*y=b
% col metodo di sostituzione in avanti e poi quello 
% triang. sup. U*x=y col metodo di sostituzione all'indietro
% NOTA: non occorre formare esplicitamente le matrici L e U

n=max(size(A));  %assumo che A sia quadrata!
A = ludecomp_nopivot(A);

% Risolviamo il sistema L*y=b
y=b; % y(1) è già corretto: y(1)=b(1)/L(1,1)=b(1)
for i=2:n
    y(i) = b(i) - A(i, 1:i-1) * y(1:i-1);
end

% Risolviamo il sistema U*x=y
x=y; % Serve solo a dimensionare la variabile x
     % Questa volta U(i,i) non è 1...
% in questo caso, b = y. Bisogna tener conto degli A(i,i) dal momento che non
% sono piu' uguali a 1.
for i=n:-1:1 % ciclo all'indietro
    x(i) = (y(i) - A(i, i+1:n) * x(i+1:n)) / A(i,i);
end