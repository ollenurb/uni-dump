% Le liste sono definite in modo ricorsivo come in Haskell.
% Spesso le operazioni su di esse vengono fatte in maniera ricorsiva [Head |
% Tail].
% Procedura per la somma di elementi di una lista
somma([], 0).
somma([Head | Tail], R) :- somma(Tail, N), R is Head + N.
% Usiamo l'assegnazione (is) perche' se no ce lo considererebbe come Pattern
% Matching
