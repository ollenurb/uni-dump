function [x,it,R]=jacobi(A,b,toll,nmax)
% Calcola la soluzione di A*x=b col metodo di Jacobi
% Input:
% A,b: matrice e termine noto
% toll: tolleranza
% nmax: numero massimo di iterazioni
% Output:
% x: soluzione approssimata
% it: numero di iterazioni
% R: elenco di tutti i residui
%
% criterio d'arresto: |r|/|b| < toll

assert(size(A,1)==size(A,2))
N=length(b); %A deve essere NxN
x=zeros(N,1);%oppure rand(N,1)
d=diag(A); %vettore colonna con gli elementi diagonali di A
it = 0;
nb = norm(b);
nr = 2*nb*toll;

R=[];

% Criterio d’arresto: |r|/|b| < toll -> |r| < |b| toll
while (it<nmax) && (nr>nb*toll)
    r = b-A*x;
    z = r./d;  %soluzione di D*z = r
    x = x + z;
    nr = norm(r);
    it = it+1;
    if nargout>2
        R(it)=nr;
    end
end

if it>=nmax
    warning('Numero massimo di iterazioni raggiunto!');
end