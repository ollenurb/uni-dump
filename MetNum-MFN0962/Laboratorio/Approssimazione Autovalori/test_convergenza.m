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

% Secondo la teoria, sappiamo che il metodo applicato alla matrice B
% risultera' piu' veloce in quanto la convergenza dipende dal rapporto
% (lambda_2 / lambda_1)^k
% Siccome 6 < 7, nella matrice B sara' piu' veloce.

clf

toll=1e-6;
[lambdamax,vmax,it,L] = potenze_toll(A,toll,1000);
semilogy(abs(L-lmaxexa),'b')

[lambdamax,vmax,it,L] = potenze_toll(B,toll,1000);
hold on
semilogy(abs(L-lmaxexa),'r')

C=V*diag([-3     3     7    -8     2])*inv(V);
[lambdamax,vmax,it,L] = potenze_toll(C,toll,1000);
semilogy(abs(L-lmaxexa),'c')

legend('Convergenza A', 'Convergenza B', 'Convergenza C');