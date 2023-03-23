impiegato(anna;gino;mario;cristina).
incarico(apertura;chiusura;pulizia).

% Ogni impiegato puo' essere responsabile da un minimo di 0 fino ad un massimo
% di 2 incarichi
% NOTA: Il predicato dopo i : e' quello che voglio "restringere" su cui appunto
% applicare il bounding
0 { responsabile(X, I) : incarico(I) } 2 :- impiegato(X).
% Per ogni incarico voglio esattamente un responsabile
1 { responsabile(X, I) : impiegato(X) }  1 :- incarico(I).

#show responsabile/2.
