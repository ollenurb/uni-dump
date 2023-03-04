% Le liste sono definite in modo ricorsivo come in Haskell.
% Spesso le operazioni su di esse vengono fatte in maniera ricorsiva [Head |
% Tail].
% Procedura per la somma di elementi di una lista
somma([], 0).
somma([Head | Tail], R) :- somma(Tail, N), R is Head + N.
% Usiamo l'assegnazione (is) perche' se no ce lo considererebbe come Pattern
% Matching
% ----------------------------------------------------------------------------------
% Esercizi: (Estratti da "P-99: Ninety-Nine Prolog Problems)
% ----------------------------------------------------------------------------------
% 1. Trova l'ultimo elemento di una lista
last_element([Last], Last). % Current = Last!
last_element([_ | Tail], Current) :- last_element(Tail, Current).
% ----------------------------------------------------------------------------------
% 2. Trova il penultimo elemento di una lista (Last But One)
lbo_element([LBO, _], LBO).
lbo_element([_ | Tail], Current) :- lbo_element(Tail, Current).
% ----------------------------------------------------------------------------------
% 3. Trova il k-esimo elemento di una lista
% find_kth([Element | _], 0, Element).
% find_kth([_ | Tail], Index, Current) :- find_kth(Tail, Index-1, Current).


