N=1e3;
%Costuisco un problema (A,b) con soluzione nota (Xexa)
A=matrice(N) + speye(N); %matrice a stretta dominanza diagonale
Xexa=ones(N,1);
b=A*Xexa;

Nit = ceil(logspace(0,log10(N),15)); %interi fra 1 e N
ERR=zeros(size(Nit));
for k=1:length(Nit)
    x = jacobiN(A,b,Nit(k));
    ERR(k) = norm(x-Xexa) / norm(Xexa);
end

semilogy(Nit, ERR)