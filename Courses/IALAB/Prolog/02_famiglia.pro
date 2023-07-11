% Un programma in prolog non e' nient'altro che un insieme di CLAUSOLE
% ----------------------------------------------------------------------------------
genitore(anna, mario).
genitore(paolo, mario).
genitore(paolo, luisa).
genitore(anna, luisa).

genitore(cristina, matteo).
genitore(cristina, luca).
genitore(maurizio, luca).
genitore(andrea, matteo).

genitore(mario, chiara).
genitore(antonella, chiara).
genitore(chiara, lia).
% ----------------------------------------------------------------------------------
% Un nonno X e' genitore del genitore di Y:
nonno(X, Y) :- genitore(X, Z), genitore(Z, Y).
% ----------------------------------------------------------------------------------
% Il concetto di "antenato" e' definito ricorsivamente:
% Dobbiamo "risalire" le relazioni di "genitore" fino ad arrivare alla prima
% (cioe' il primo genitore)
% NB. Bisogna fare attenzione a mettere prima i casi base e poi i casi
% ricorsivi, poiche' potrebbe fare stack overflow senza mai terminare la
% ricorsione dal momento che le clausole sono considerate per ordine di arrivo
antenato(X, Y) :- genitore(X, Y).
antenato(X, Y) :- genitore(Z, Y), antenato(X, Z).
% ----------------------------------------------------------------------------------
% A questo punto possiamo fare delle query sulla base di conoscenza:
% ?- antenato(anna, lia).
% true.
% Il programma va a vedere le regole che possono essere applicate (tale per cui
% la testa fa pattern matching con il goal - o query). In questo caso % dei
% sotto-goal che portano avanti la ricorsione. (per maggiori info fare `trace`)
% ----------------------------------------------------------------------------------
% Due persone sono fratelli germani se condividono entrambi i genitori
fratelloGermano(X, Y) :-
    genitore(PrimoGenitore, X),
    genitore(PrimoGenitore, Y),
    % Dobbiamo includere il fatto che X e Y siano diversi perche' potrebbe
    % istanziare X e Y come uguali
    X \== Y,
    genitore(SecondoGenitore, X),
    % La stessa cosa vale per SecondoGenitore e PrimoGenitore, perche' come
    % detto il prolog potrebbe instanziarli con lo stesso termine
    SecondoGenitore \== PrimoGenitore,
    genitore(SecondoGenitore, Y).
% ----------------------------------------------------------------------------------
% Due persone sono fratelli unilaterali se hanno un solo genitore in comune
fratelloUnilaterale(X, Y) :-
    genitore(GenitoreComune, X),
    genitore(GenitoreComune, Y),
    genitore(GenitoreX, X),
    genitore(GenitoreY, Y),
    GenitoreX \== GenitoreY,
    GenitoreComune \== GenitoreY,
    GenitoreComune \== GenitoreX,
    X \== Y.
