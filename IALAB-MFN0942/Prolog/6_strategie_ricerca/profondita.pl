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
    risolvi_noloop(NuovoStato, [S | Visitati], Azioni).

% Una variante di questa strategia e' quella per la ricerca in profondita'
% limitata. In questo modo, si evitano di esplorare i rami oltre una certa
% profondita'.
% Il problema di questo tipo di approccio e' che se non abbiamo messo un numero
% sufficientemente grande di prodondita', potrebbe terminare la ricerca
% prematuramente fallendo, anche se di fatto esiste una soluzione a profondita'
% piu' grande.
prof_limitata(S, _, _, []) :- finale(S), !.
prof_limitata(S, Visitati, Soglia, [AzioneApplicabile | Azioni]) :-
    applicabile(AzioneApplicabile, S),
    trasforma(AzioneApplicabile, S, NuovoStato),
    \+member(NuovoStato, Visitati),
    Soglia > 0,
    NuovaSoglia is Soglia - 1,
    prof_limitata(NuovoStato, [S | Visitati], NuovaSoglia, Azioni).

% Soluzione: Iterative Deepening (aumentiamo man mano la soglia ogni volta che
% fallisce).
% Inizializziamo per prima cosa la profondita' iniziale.
inizializza :-
    % Pulisci dalla KB tutti i predicati riguardanti la profondita' attuale
    retractall(current_depth(_)), 
    % Imposta la profondita' iniziale
    assert(current_depth(1)).

iterative_deepening(Cammino) :- 
    iniziale(S0),
    current_depth(D),
    prof_limitata(S0, [], D, Cammino).
% Se arriva qua significa che ha fallito, quindi aumentiamo la profondita'
iterative_deepening(Cammino) :-
    current_depth(D),
    NuovaDepth is D + 1,
    retractall(current_depth(_)),
    assert(current_depth(NuovaDepth)),
    iterative_deepening(Cammino).

% IL drawback principale di Iterative Deepening nella versione attuale e' che
% non termina se non c'e' la soluzione. Un modo furbo per risolvere e'
% impostare un upper bound sulla lunghezza del cammino massima. Nel nostro
% caso, e' insensato andare oltre una profondita' di NxM (la grandezza della
% nostra griglia).


% Fino ad ora abbiamo considerato solo ricerche in profondita', ma avremmo
% potutto anche visitare in ampiezza. In questo modo, avremmo un tradeoff tra
% spazio e ottimalita', sicocme sicuramente questo tipo di visita ritornerebbe
% l'ottimo della soluzione.

% ============ Helpers per chiamare le varianti delle ricerche ============
cerca_soluzione :-
    iniziale(S0),
    risolvi_noloop(S0, [], ListaAzioni),
    write(ListaAzioni).

cerca_soluzione_soglia(Soglia) :-
    iniziale(S0),
    prof_limitata(S0, [], Soglia, ListaAzioni),
    write(ListaAzioni).


