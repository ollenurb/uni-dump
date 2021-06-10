function [I] = quad1 (f,a,b,qRule)
% Input:
%  f: function handle per l'integranda
%  a,b: estremi di integrazione
%  qRule: struct con la regola di quadratura
%        (usiamo i campi xNodes, qWeights)
% Output:
%  I integrale approssimato con la 
%    quadratura semplice di tipo qRule

% Dal momento che xNodes si riferisce all'intervallo 0;1, bisogna mappare i
% nodi nell'intervallo di integrazione a,b
x = a + (b-a) * qRule.xNodes;
% integrale approssimato
I = (b-a) * sum(qRule.qWeights .* f(x));
