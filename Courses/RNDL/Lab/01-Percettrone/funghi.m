load fung
%
%presuppone che fung sia stato caricato e che ci sia in memoria la matrice fun 8124x127
%

% coppie di apprendimento
fun1i=fun(1:4062,1:125);
fun1t=2*fun(1:4062,126)-1;

% visualizza le prime 5 colonne delle prime 10 righe di fun1i
fun1i(1:10, 1:5)


%
% coppie per il test
fun2i=fun(4063:8124,1:125);
fun2t=2*fun(4063:8124,126)-1;
%
rand('state',1992)
%
%apprendimento
[u,v]=percett(fun1i,fun1t,50);
%
%v(length(v))
figure(1)
plot(v)
fprintf('percentuale appresa correttamente: %f per cento \n',(max(v)/4062)*100)
pause

[hh,h]=max(v); %indice del primo massimo

W=u(:,h)'; %riga dei pesi ottimale

%
%test

ris=usaperc(W,fun2i);
z=sum(ris==fun2t)
fprintf('risultati corretti su funghi mai visti : %f per cento \n',(z/4062)*100)







