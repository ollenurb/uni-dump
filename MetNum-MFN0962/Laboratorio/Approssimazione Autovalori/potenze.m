function [l,v,it,L]=potenze(A,maxiter)
% Applica il metodo delle potenze per approssimare
% l'autovalore di modulo massimo di A
% Input: matrice A, tolleranza toll, max iterazioni
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
v=rand(n,1);
it=0; %contatore di iterazioni

while (it<maxiter)
    x=... ; %normalizza v
    v=...; %
    l = x' * v; %prodotto scalare
    if nargout>3
        L(it+1)=l;
    end
    it=it+1;
end
if (it>=maxiter)
    warning('Massimo numero di iterazioni raggiunto');
end
v=v/norm(v);%normalizza v
