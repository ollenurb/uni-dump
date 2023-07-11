load cancer1

% si suppone caricata cancer1; in memoria cancer1 699X11

% apprendimento 8 neuroni nascosti maxerr .037 
[A,B,R,err,c]=retropro(cancer1(1:350,1:9),cancer1(1:350,10:11),8,1,.037,200,1992);

%errore nell'apprendimento
[d,p]=comparer(round(R),cancer1(1:350,10:11))

%test
R1=f(B*f(A*cancer1(351:699,1:9)'));
[d,p]=comparer(round(R1'),cancer1(351:699,10:11))
