function [l,v,it,L]=potenze(A, maxiter, v)
% Applica il metodo delle potenze per approssimare
% l'autovalore di modulo massimo di A
% Input: matrice A, max iterazioni
% Output: 
%    l  : autovalore dominante 
%    v  : autovettore corrispondente normalizzato in norma 2
%    it : numero di iterazioni, 
%    L  : successione approssimante per l

% Per il debug:
% data una matrice A, 
% l deve approssimare max(abs(eig(A))
% e v deve approssimare l'autovettore corrispondente
% [V,D]=eig(A);
% [lexa,k]=max(abs(diag(D));
% vexa=V(:,k)

assert(size(A,1)==size(A,2));
n=length(A);
if (nargin < 3)
    v=rand(n,1);
end
it=0; %contatore di iterazioni

while (it<maxiter)
    x= v/norm(v); % t_{k-1}
    v= A*x; % u_k = A*t_{k-1}
    l = x' * v; % prodotto scalare (ci si arriva tramite quoziente di Rayleigh)
    if nargout>3
        L(it+1)=l;
    end
    it=it+1;
end
if (it>=maxiter)
    warning('Massimo numero di iterazioni raggiunto');
end
v=v/norm(v); %normalizza v
