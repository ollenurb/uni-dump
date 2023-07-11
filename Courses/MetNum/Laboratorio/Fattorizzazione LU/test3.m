NN = 2:10:100;
ERR_nopivot=zeros(size(NN));
ERR_pivot=zeros(size(NN));
for k=1:length(NN)
    N=NN(k);
    A=rand(N);
    exa=rand(N,1);
    b=A*exa;

    LU = ludecomp_nopivot(A);
    U=triu(LU);
    L=tril(LU,-1) + eye(size(LU));
    ERR_nopivot(k) = norm(A-L*U,inf);
    x=lusolve_nopivot(A,b);
    ERRSIST_nopivot(k) = norm(x-exa,inf);

    LU = ludecomp_pivot(A);
    U=triu(LU.B(LU.P,:));
    L=tril(LU.B(LU.P,:),-1) + eye(size(LU.B));
    ERR_pivot(k) = norm(A(LU.P,:)-L*U,inf);
    x=lusolve_pivot(A,b);
    ERRSIST_pivot(k) = norm(x-exa,inf);
end
subplot(2,1,1);
semilogy(NN,ERR_nopivot,'.-',NN,ERR_pivot,'.-');
legend('no pivot','pivot'); ylabel('errori decomposizione')
subplot(2,1,2);
semilogy(NN,ERRSIST_nopivot,'.-',NN,ERRSIST_pivot,'.-');
legend('no pivot','pivot'); ylabel('errori soluzione')