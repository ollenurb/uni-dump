% Voglio assegnare ad ogni lettera un numero tale per cui:
% send + more = money

% Le cifre vanno da 0 a 9
cifra(0..9).
% Lettere possibili (solo quelle che compaiono nel problema ovviamente)
lettera(s;e;n;d;m;o;r;y).

% Ad ogni lettera deve essere associata una sola cifra
1 { assegna(L, C):cifra(C) } 1 :- lettera(L).
% A due lettere diverse devono corrispondere due cifre diverse
{ assegna(L, C):lettera(L) } 1 :- cifra(C).

% Mettiamo i vincoli che corrispondono alla somma
% Utilizziamo le lettere come variabili per "unificare" con le cifre effettive
% che sono state assegnate ad esse
sommaok :- cifra(S;E;N;D;M;O;R;Y),
assegna(s, S), assegna(e, E), assegna(n, N), assegna(d, D),
assegna(m, M), assegna(o, O), assegna(r, R), assegna(y, Y),
          (S*1000 + E*100 + N*10 + D) + 
          (M*1000 + O*100 + R*10 + E) =
(M*10000 + O*1000 + N*100 + E*10 + Y),
S > 0, M > 0.

% Escludi quelli in cui non c'e' 'sommaok' vera
:- not sommaok.

#show assegna/2.




