function A=ludecomp_nopivot_fast(A)
% Input: matrice A da decomporre
% Output: decomposizione A=LU in forma compatta
%  la U è salvata nella parte triangolare superiore della A
%  mentre tril(A) contiene le informazioni per ricostruire la L
%  ovvero L=eye(N)+tril(A,-1)

n = max(size(A));

for k=1:(n-1)
   A(k+1:n,k) = A(k+1:n,k)/A(k,k); % calcoliamo i moltiplicatori
   % trasformiamo le righe
   A(k+1:n,k+1:n)=A(k+1:n,k+1:n) - A(k+1:n,k) * A(k,k+1:n);
end