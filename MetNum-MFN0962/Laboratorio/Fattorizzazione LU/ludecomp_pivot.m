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

end

LU.B=A;
LU.P=PERM;
