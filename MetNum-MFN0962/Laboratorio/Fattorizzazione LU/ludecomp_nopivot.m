function A=ludecomp_nopivot(A)
% Input: matrice A da decomporre
% Output: decomposizione A=LU in forma compatta
%  la U è salvata nella parte triangolare superiore della A
%  mentre tril(A) contiene le informazioni per ricostruire la L
%  ovvero L=eye(N)+tril(A,-1)
%
% Prima versione, con cicli for, senza pivoting

n=max(size(A)); % assumiamo che A sia quadrata...

% k = numero del passo
for k=1:(n-1)
    for i=... %ciclo sulle righe
        % calcoliamo il moltiplicatore k-esimo
        A(i,k)= ...
        % trasformiamo la riga k-esima
        for j=... %ciclo sulle colonne
            A(i,j) = ...
        end
    end
end
