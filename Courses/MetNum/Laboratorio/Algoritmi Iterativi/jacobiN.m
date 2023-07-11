function [x]=jacobiN(A,b,nmax)
% Calcola la soluzione di A*x=b col metodo di Jacobi
% Restituisce:
% x= soluzione approssimata dopo nmax iterazioni

N=length(b); %A deve essere NxN
x0=zeros(N,1);%oppure rand(N,1)
d=diag(A); %vettore colonna con gli elementi diagonali di A
for k=1:nmax
    r = b-A*x0;
    z = r./d; %soluzione di D*z = r
    x = x0 + z;
    x0 = x;
end