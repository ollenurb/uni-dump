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
vminexa = V(:,5)/norm(V(:,5));
lminexa=2;
toll=1e-6;

[lambdamax,vmax] = potenze(A, 5);
[lambdamin,vmin] = potenze_inverse(A, toll, 5);

% calcolo angolo tra vettori
% https://www.chimica-online.it/test-fisica/svolgimento/esercizio-sui-vettori-4.htm
angle = acos((vmax'*vmaxexa)/(norm(vmax)*norm(vmaxexa))); 
angle = rad2deg(angle);

%Errore sull'autovalore massimo
fprintf('Errore su lambdamax=%5.3e (toll=%5.3e) \n',lambdamax-lmaxexa,toll);
%Errore sull'autovettore massimo
vmax=vmax*(vmaxexa(1)/vmax(1));
fprintf('Errore autovettore in norma-2: %5.3e \n',norm(vmax-vmaxexa)/norm(vmaxexa));

%errore sull'autovalore minimo (potenze inverse)
fprintf('Errore su lambdamin=%5.3e (toll=%5.3e) \n',lambdamin-lminexa,toll);
%errore sull'autovettore minimo (potenze inverse)
vmin=vmin*(vminexa(1)/vmin(1));
fprintf('Errore autovettore minimo in norma-2: %5.3e \n',norm(vmin-vminexa)/norm(vminexa));
