N=1e3;
A=matrice(N)+0.2*speye(N); %matrice a stretta dominanza diagonale
Xexa=ones(N,1);
b=A*Xexa;

TOLL = logspace(0,-12,15); %tolleranze da 1 a 10^-15
ERR=zeros(size(TOLL));
IT=zeros(size(TOLL));
for k=1:length(TOLL)
    [x,IT(k)] = jacobi(A,b,TOLL(k),N);
    ERR(k) = norm(x-Xexa) / norm(Xexa);
    RES(k) = norm(b-A*x) / norm(b); %residuo relativo
end

figure(1); clf
loglog(RES, ERR , 'b-' , RES, RES ,'k--')
xlabel 'residuo'
ylabel 'errore'

figure(2); clf
loglog(TOLL, ERR, 'b-', TOLL, TOLL, 'k--')
xlabel 'tolleranza'
ylabel 'errore'

figure(3); clf
semilogx(TOLL, IT)
xlabel 'tolleranza'
ylabel 'iterazioni'

figure(4); clf
loglog(4*N*IT, ERR, 'b-')
xlabel 'costo computazionale'
ylabel 'errore'

