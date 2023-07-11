function LU=ludecomp_pivot(A)
% Input: matrice A da decomporre
% Output: una struct con 
% LU.B decomposizione A=LU in forma compatta
% LU.P permutazione delle righe
% In particolare 
% U è salvata nella parte triang. sup. della matrice LU.B(P,:) 
% mentre la parte strettamente triangolare inferiore di LU.B(P,:) 
% contiene le informazioni per ricostruire L
% ossia L=eye(n)+tril(LU.B(P,:),-1)

n=length(A); % assume che A sia quadrata...
PERM = 1:n; % La permutazione è inizialmente l'identità

% k = numero del passo
for k=1:(n-1)
    % calcolo il PIVOT, considerando il massimo degli elementi del vettore
    % colonna k-esimo. Per evitare di considerare elementi delle righe gia'
    % considerate, prendiamo solo i PERM(k:n) elementi della colonna.
    [M, i] = max(abs(A(PERM(k:n), k)));
    
    % i è indice in PERM(k:n), quindi l'indice in PERM sara' i+k dal
    % momento che il lower bound e' k.
    i= i+k-1;
    
    % la riga dove si trova il pivot è
    r = PERM(i);
    
    % scambiamo le due posizioni in PERM
    PERM(i)=PERM(k);
    PERM(k)=r;
    
    % passo della decomposizione
    K=(k+1):n;
    
    % calcoliamo i moltiplicatori
    A(PERM(K),k)= A(PERM(K),k) / A(PERM(k),k);
    
    % trasformiamo la sottomatrice quadrata
    A(PERM(K),K) = A(PERM(K),K) - A(PERM(K),k)*A(PERM(k),K);
end

LU.B=A;
LU.P=PERM;
