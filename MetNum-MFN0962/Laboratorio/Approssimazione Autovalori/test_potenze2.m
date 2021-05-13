V =[ 3    -2    -1    -2     2;
     4    -1     4     0    -2;
    -2     1     4     4     3;
     4     4     1     3     4;
     2     4     3     4     2 ];
A=V*diag([-3     4     7    -8     2])*inv(V);
%La matrice A ha autovalori -3,4,7,-8,2
%Autovalore/autovettore dominante: -8 e V(:,4)
lmaxexa=-8;
vmaxexa = V(:,4)/norm(V(:,4));
lminexa=2;

toll=1e-6;
[lambdamax,vmax,it,L] = potenze(A,toll,1000);
%Errore sull'autovalore
fprintf('Errore su lambdamax=%5.3e (toll=%5.3e) \n',lambdamax-lmaxexa,toll)
%Test di parallelismo fra vmax e vmaxexa
% ... COMPLETARE ...

%Errore sull'autovettore
vmax=vmax*(vmaxexa(1)/vmax(1));
fprintf('Errore autovettore in norma-2: %5.3e \n',norm(vmax-vmaxexa)/norm(vmaxexa));


