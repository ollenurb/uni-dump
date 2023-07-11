clear all, close all;
f = @(x) exp(x);
F = @(x) exp(x); % la primitiva e' nota, cosi' calcolo l'integrale esatto

% creo un vettore di possibili H
HH = logspace(0,-6,10);

% inizializzo la dimensione almeno non fanno resize ad ogni iterazione del
% ciclo
TRerrs = zeros(length(HH));
PMerrs = TRerrs;
CSerrs = PMerrs;
EXvals = CSerrs;

PM = getQRule('PM');
CS = getQRule('CS');
TR = getQRule('TR');

for i=1:length(HH)
    H = HH(i);                                          % prendi il valore di H attuale
    EXvals(i) = F(H) - F(0);                            % calcola l'integrale esatto
    PMerrs(i) = abs(EXvals(i) - quad1(f, 0, H, PM));    % calcola l'errore rispetto a Punto Medio ecc..
    CSerrs(i) = abs(EXvals(i) - quad1(f, 0, H, CS));
    TRerrs(i) = abs(EXvals(i) - quad1(f, 0, H, TR));
end

loglog(HH, PMerrs);
hold on;
loglog(HH, CSerrs);
loglog(HH, TRerrs);
legend('E. Punto medio', 'E. Simpson', 'E.Trapezi');
title('Errore di integrazione al crescere intervallo della funzione e^x');