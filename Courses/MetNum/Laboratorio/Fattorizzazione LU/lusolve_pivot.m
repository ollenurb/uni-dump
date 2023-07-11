function x=lusolve_pivot(A,b)
% Risolve il sistema lineare con termine noto b
% LU è l'output di ludecomp_pivot
% ovvero 
% U =triu( LU.B(LU.P,:) )
% L=eye(N)+tril(LU.B(LU.P,:),-1)
%
% Per risolvere A*x=b, risolviamo L*U*x=b
% risolvendo prima il sistema tr. infer. L*y=b
% col metodo di sostituzione in avanti e poi quello 
% tr. sup. U*x=y col metodo di sostituzione all'indietro
% NOTA: non occorre formare esplicitamente le matici L,U

% Per il debug:
% i comandi LU=ludecomp_pivot(A);x=lusolve_pivot(b,LU)
% dovrebbero fornire lo stesso risultato di x=A\b

n=length(b);

LU = ludecomp_pivot(A);

% Risolviamo il sistema triangolare inferiore L*y=P*b
y=b(LU.P); % senza pivoting era: y=b;

for i=2:n
    J = 1:i-1;
    y(i) = b(LU.P(i)) - LU.B(LU.P(i), J) * y(J);
end

% Risolviamo il sistema triangolare superiore U*x=y
x=y; % Serve solo a dimensionare la variabile x
     % Questa volta U(i,i) non è 1...
for i=n:-1:1
    J = i+1:n;
    x(i) = (y(i) - LU.B(LU.P(i), J) * x(J)) / LU.B(LU.P(i),i); % solo la riga e' permutata...
end
