function [I] = quadN (f,a,b,N,qRule)
%function [I] = quadN (f,a,b,N,qRule)
% Input:
%  f  : function handle per l'integranda
%  a,b: estremi di integrazione
%  N  : numero di intervalli
%  qRule: struct con la regola di quadratura
%        (usiamo i campi xNodes, qWeights)
% Output:
%  I integrale approssimato con la
%    quadratura composita di tipo qRule

% lunghezza sottointervalli
h = (b-a)/N;
% estremi sottointervalli
X = linspace(a,b,h);
% calcolo dell'integrale approssimato
nq = lenght(qRule.xNodes);
I = 0;
for i=1:nq
    xn = X(1:N) + h*qRule.xNodes(i);
    I = I + h * qRule.qWeights(k) * sum(f(xn));
end
