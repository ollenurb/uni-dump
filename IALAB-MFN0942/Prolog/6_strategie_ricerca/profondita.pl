% Definiamo la strategia di ricerca nello spazio degli stati.
% A partire da uno stato S si effettua una ricerca nello spazio degli stati per
% trovare la soluzione. La ricerca consiste essenzialmente nell'eseguire
% l'azione possibile ad ogni stato, facendo eventualmente backtracking in caso
% lo stato non sia finale.
risolvi(S, []) :- finale(S), !.
% Se ci troviamo in uno stato non finale, cerca un'azione applicabile ed
% eseguila
risolvi(S, [AzioneApplicabile | Azioni]) :-
    % Trova l'azione applicabile nello stato S
    applicabile(AzioneApplicabile, S),
    % Applica l'azione applicabile
    trasforma(AzioneApplicabile, S, NuovoStato),
    % Riprova a cercare nel nuovo stato del mondo
    risolvi(NuovoStato, Azioni).

% Sfortunatamente, questa versione finisce in un loop, cioe' non si ricorda
% cio' che ha gia' visitato finendo nel valutare costantemente sempre lo stesso
% cammino.
% Una versione che eviti i loop prevede una lista di stati visitati, in modo da
% evitare di ri-visitarli e quindi di finire in un loop
risolvi_noloop(S, _, []) :- finale(S), !.
risolvi_noloop(S, Visitati, [AzioneApplicabile | Azioni]) :-
    applicabile(AzioneApplicabile, S),
    trasforma(AzioneApplicabile, S, NuovoStato),
    \+member(NuovoStato, Visitati),
    risolvi_noloop(NuovoStato, [S | Visitati],Azioni).
