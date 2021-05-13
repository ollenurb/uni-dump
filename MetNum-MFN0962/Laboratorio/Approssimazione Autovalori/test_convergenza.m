V =[ 3    -2    -1    -2     2;
     4    -1     4     0    -2;
    -2     1     4     4     3;
     4     4     1     3     4;
     2     4     3     4     2 ];
A=V*diag([-3     4     7    -8     2])*inv(V);
%La matrice A ha autovalori -3,4,7,-8,2
%Autovalore/autovettore dominante: -8 e V(:,4)
lmaxexa=-8;

B=V*diag([-3     4     6    -8     2])*inv(V);
%La matrice A ha autovalori -3,4,6,-8,2
%Autovalore/autovettore dominanti: -8 e V(:,4)

clf

toll=1e-6;
[lambdamax,vmax,it,L] = potenze(A,toll,1000);
semilogy(abs(L-lmaxexa),'b')

[lambdamax,vmax,it,L] = potenze(B,toll,1000);
hold on
semilogy(abs(L-lmaxexa),'r')

C=V*diag([-3     3     7    -8     2])*inv(V);
[lambdamax,vmax,it,L] = potenze(C,toll,1000);
semilogy(abs(L-lmaxexa),'c')

