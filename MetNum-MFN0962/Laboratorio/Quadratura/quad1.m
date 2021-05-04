function [I] = quad1 (f,a,b,qRule)
%function [I] = quad1 (f,a,b,qRule)
% Input:
%  f: function handle per l'integranda
%  a,b: estremi di integrazione
%  qRule: struct con la regola di quadratura
%        (usiamo i campi xNodes, qWeights)
% Output:
%  I integrale approssimato con la 
%    quadratura semplice di tipo qRule

%nodi mappati in [a,b]
%perche' xNodes si riferisce all'intervallo 0;1
x = a + (b-a) * qRule.xNodes;
%integrale approssimato
I = (b-a) * sum(qRule.qWeights .* f(x));
