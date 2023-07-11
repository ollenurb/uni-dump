function [l,v,it,L]=potenze_toll(A,toll,maxiter)
% Applica il metodo delle potenze per approssimare
% l'autovalore di modulo massimo di A
% Input: matrice A, tolleranza toll, max iterazioni
% Output: 
%    l  : autovalore dominante 
%    v  : autovettore corrispondente normalizzato in norma 2
%    it : numero di iterazioni, 
%    L  : successione approssimante per l

assert(size(A,1)==size(A,2));
n=length(A);
v=rand(n,1);
it=0; %contatore di iterazioni
diffL = toll+1; %valore iniziale cosi' entra nel ciclo

while (it<maxiter && diffL > toll)
    x= v/norm(v); % t_{k-1}
    v= A*x; % u_k = A*t_{k-1}
    l = x' * v; % prodotto scalare (ci si arriva tramite quoziente di Rayleigh)
    if it>1     % calcolo la differenza solo se ho almeno fatto un'iterazione
        diffL = abs(lp - l); % sul libro: l - lp < lp*toll 
    end
    if nargout>3
        L(it+1)=l;
    end
    
    lp = l;
    it=it+1;
end
if (it>=maxiter)
    warning('Massimo numero di iterazioni raggiunto');
end
v=v/norm(v);
