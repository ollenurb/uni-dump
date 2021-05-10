function x=lusolve_pivot(LU,b)
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

N=length(b);

% Risolviamo il sistema triangolare inferiore L*y=P*b
y=b(LU.P); %senza pivoting era: y=b;
for i=2:n
    y(i) = ... 
    % dovremmo dividere per L(i,i) che però è 1
end

% Risolviamo il sistema triangolare superiore U*x=y
x=y; % Serve solo a dimensionare la variabile x
     % Questa volta U(i,i) non è 1...
for i=n:-1:1
    x(i) = ...
end
%NB Non e` necessario definire x e y; potrei operare direttamente su b...
