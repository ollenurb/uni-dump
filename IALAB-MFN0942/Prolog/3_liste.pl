% Le liste sono definite in modo ricorsivo come in Haskell.
% Spesso le operazioni su di esse vengono fatte in maniera ricorsiva [Head |
% Tail].
% Procedura per la somma di elementi di una lista
sum([], 0).
sum([Head | Tail], R) :-
    sum(Tail, N),
    R is Head + N.
% Usiamo l'assegnazione (is) perche' se no ce lo considererebbe come Pattern
% Matching
% ----------------------------------------------------------------------------------
prod([], 0).  % Prodotto di lista vuota e' 0
prod([X], X). % Prodotto di singoletto e' singoletto stesso
prod([Head | Tail], R) :-
    prod(Tail, N),
    R is Head * N.

% Custom `member` implementation
% appartiene = (equiv) member
my_member(X, [X | _]).
my_member(X, [_ | Tail]) :- my_member(X, Tail).

% ==================================================================================
%                                 Esercizi
%                (Estratti da "P-99: Ninety-Nine Prolog Problems)
% ==================================================================================
% 1. Trova l'ultimo elemento di una lista
last_element([Last], Last). % Current = Last!
last_element([_ | Tail], Current) :- last_element(Tail, Current).
% ----------------------------------------------------------------------------------
% 2. Trova il penultimo elemento di una lista (Last But One)
lbo_element([LBO, _], LBO).
lbo_element([_ | Tail], Current) :- lbo_element(Tail, Current).
% ----------------------------------------------------------------------------------
% 3. Trova il k-esimo elemento di una lista
find_kth([Head | _], 0, Head).
find_kth([_ | Tail], I, Current) :- find_kth(Tail, Index, Current), I is Index-1.
