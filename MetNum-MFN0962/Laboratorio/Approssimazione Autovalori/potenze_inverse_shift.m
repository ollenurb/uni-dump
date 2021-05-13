function [l,v,it,Ls]=potenze_inverse_shift(A,mu,toll,maxiter)
% Applica il metodo delle potenze per approssimare
% l'autovalore di modulo massimo di A
% Input: matrice A, mu: approssimazione iniziale, tolleranza toll, max iterazioni
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

% Calcoliamo questa volta la soluzione del sistema (A-muI)
[L, U, P] = lu(A - mu * eye(n));

while (it<maxiter && diffL > toll)
    x= v / norm(v); % t_{k-1}
    % Ricordati che per risolvere un sistema lineare con la fatt LU
    % sono necessari 2 passaggi:
    %   1) Ly = b
    %   2) Ux = y
    y = L \ (P*x); % usiamo la matrice P degli scambi per tenere conto del pivoting
    v = U \ y;
    % Questa volta considero l'inverso, siccome l'autovalore 
    % e' quello massimo di A^-1
    l = 1 / (x' * v);
    if it>1     % calcolo la differenza solo se ho almeno fatto un'iterazione
        diffL = abs(lp - l)/ abs(lp); 
    end
    if nargout>3
        Ls(it+1)=l;
    end
    
    lp = l;
    it=it+1;
end
if (it>=maxiter)
    warning('Massimo numero di iterazioni raggiunto');
end
v=v/norm(v);%normalizza v
