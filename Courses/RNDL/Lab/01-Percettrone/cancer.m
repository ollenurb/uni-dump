load cancer1
% si suppone caricata cancer1; in memoria cancer1 699X11

% coppie di apprendimento
cancer1i=cancer1(1:350,1:9);
cancer1t=2*cancer1(1:350,10)-1;
%
% coppie per il test
cancer2i=cancer1(351:699,1:9);
cancer2t=2*cancer1(351:699,10)-1;
%
rand('state',1992)
%
%apprendimento
[u,v]=percett(cancer1i,cancer1t,50);
%
display('risposte corrette - nella fase di apprendimento - su 350 ')
max(v)
figure(1)
plot(v)
pause

[z,h]=max(v); %indice del primo massimo

W=u(:,h)'; %riga dei pesi ottimale

%
%test

ris=usaperc(W,cancer2i);

display('risposte corrette - nella fase di test - su 349 ')
sum(ris==cancer2t)
