% Definiamo in questo file l'insieme di azioni che possiamo effettuare nel
% dominio. In altri termini, vogliamo formalizzare mediante regole del prolog
% cosa e' possibile effettuare in una determinata situazione (stato del mondo)
%
% Partiamo dal predicato per determinare se l'azione 'su' e' applicabile nella
% posizione Riga, Colonna.
applicabile(su, pos(Riga, Colonna)) :-
    % Controlliamo che la riga in cui vogliamo spostarci non sia < 1
    Riga > 1,  
    % Nuova cella dove ci si troverebbe dopo l'esecuzione dell'azione
    RigaSopra is Riga - 1,
    % Controlliamo inoltre che la nuova cella dove vogliamo spostarci non sia
    % occupata
    \+ occupata(pos(RigaSopra, Colonna)).

applicabile(giu, pos(Riga, Colonna)) :-
    % Controlliamo che la riga non vada oltre al numero massimo di righe
    num_righe(NumRighe), Riga < NumRighe,
    % Il resto e' uguale a prima..
    RigaSotto is Riga + 1,
    \+ occupata(pos(RigaSotto, Colonna)).

% Analogamente, ripetiamo i ragionamenti per gli analoghi destra, sinistra:
applicabile(destra, pos(Riga, Colonna)) :-
    num_colonne(NumColonne), Colonna < NumColonne,
    ColonnaDestra is Colonna + 1,
    \+ occupata(pos(Riga, ColonnaDestra)).

applicabile(sinistra, pos(Riga, Colonna)) :-
    Colonna > 1,
    ColonnaSinistra is Colonna - 1,
    \+ occupata(pos(Riga, ColonnaSinistra)).

% ----------------------------------------------------------------------------------
% Ora che abbiamo definito l'insieme di precondizioni per l'esecuzione
% dell'azione, diamo la definizione per gli effetti dall'esecuzione delle
% stesse.
trasforma(giu, pos(Riga, Colonna), pos(NuovaRiga, Colonna)) :- NuovaRiga is Riga+1.
trasforma(su, pos(Riga, Colonna), pos(NuovaRiga, Colonna)) :- NuovaRiga is Riga-1.
trasforma(destra, pos(Riga, Colonna), pos(Riga, NuovaColonna)) :- NuovaColonna is Colonna+1.
trasforma(sinistra, pos(Riga, Colonna), pos(Riga, NuovaColonna)) :- NuovaColonna is Colonna-1.
