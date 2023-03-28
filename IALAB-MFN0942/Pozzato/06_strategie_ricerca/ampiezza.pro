%  +-------------- Strategie di ricerca in ampiezza --------------+
prova(Cammino) :-
    iniziale(S0),
    risolvi([[S0 , []]], [], CamminoAlContrario),
    inverti(CamminoAlContrario, Cammino).

% risolvi/3.
% - 1. Percorso dallo stato iniziale fino allo stato finale 
% - 2. Stati visitati
% - 3. Cammino 
risolvi([[S, PathToS] | _], _, PathToS) :- finale(S), !.
risolvi([[S, PathToS] | Coda], Visitati, Cammino) :-
    findall(Az, applicabile(Az, S), ListaAzioniApplicabili),
    generaStatiFigli(S, ListaAzioniApplicabili, Visitati, PathToS, ListaNuoviStati),
    append(Coda, ListaNuoviStati, NuovaCoda),
    risolvi(NuovaCoda, [S | Visitati], Cammino).

% generaStatiFigli/5.
% - 1. Stato attuale 
% - 2. Lista di azioni applicabili
% - 3. Lista di stati visitati
% - 4. Percorso dallo stato iniziale fino allo stato S
% - 5. Return della funzione (lista di stati figli)
generaStatiFigli(_, [], _, _, []) :- !.
generaStatiFigli(S, [Az | AltreAzioni], Visitati, PathToS, [[] | ListaStati]) :-
    trasforma(Az, S, StatoNuovo),
    \+member(StatoNuovo, Visitati),
    generaStatiFigli(S, AltreAzioni, Visitati, PathToS, ListaStati).
generaStatiFigli(S, [_ | AltreAzioni], Visitati, PathToS, ListaStati) :-
    generaStatiFigli(S, AltreAzioni, Visitati, PathToS, ListaStati).

% inverti([], []).
% inverti([ H | T], Ris) :- inverti(T, InvT), append(InvT, [H], Ris).

inverti(L, InvL) :- inverti_aux(L, [], InvL).

inverti_aux([], Temp, Temp).
inverti_aux([ H | T], Temp, Ris) :- inverti(T, [H | Temp], Ris).
