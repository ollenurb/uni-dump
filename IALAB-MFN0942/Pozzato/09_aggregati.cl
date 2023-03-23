tipo(integer).
tipo(float).
tipo(char).
variabile(a).
variabile(b).

% Per ogni variabile, assegna esattamente 1 tipo ad essa
1 {assegna(X, T):tipo(T)} 1:- variabile(X).

% Mostra solamente il predicato 'assegna/2' quando fai output del modello
#show assegna/2.
