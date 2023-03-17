% I quaccheri sono pacifisti (a meno di eccezioni)
pacifist(X) :- quacker(X), not -pacifist(X).
% I repubblicani, a meno di eccezioni non sono pacifisti
-pacifist(X) :- repubblican(X), not pacifist(X).

repubblican(nixon).
quacker(nixon).

% E' Nixon a questo punto un quacchero o un pacifista?
% CLINGO ci ritorna tutti i modelli possibili, quindi in questo caso ritorna:
%   - Nixon e' repubblicano, quacchero e pacifista
%   - Nixon e' repubblicano, quacchero e NON e' pacifista
