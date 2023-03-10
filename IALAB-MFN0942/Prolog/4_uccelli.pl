% Fino ad ora abbiamo visto esempi in Prolog per rappresentare conoscenza di
% senso comune. La conoscenza del mondo reale, pero', non e' sempre sifatta.
% Consideriamo ad esempio il caso dei pinguino e degli uccelli. Sappiamo
% innanzitutto che un pinguino e' un tipo di uccello
uccello(X) :- pinguino(X).
% Ragionevolmente, possiamo dire anche che gli uccelli volano
vola_v1(X) :- uccello(X).
% Ma questo implica che possiamo derivare che i pinguini volano, che e'
% chiaramente non vero.
% Vorremmo dire in realta' che un uccello vola se e' un uccello e se NON e' un
% Pinguino. Il problema e' che non abbiamo la negazione classica. In Prolog si
% utilizza un operatore apposito (\+) che "ribalta" il risultato della risoluzione.
vola_v2(X) :- uccello(X), \+pinguino(X).
% in questo caso prova ad eseguire il goal pinguino(X) e poi lo "ribalta"
pinguino(tweety).
% > Si noti che questa non e' una negazione vera e propria nel senso stretto
% del termine, siccome e' solo "operativa", cioe' viene negata dal risolutore
% di Prolog una volta che ha finito. Se avessimo una vera e propria negazione
% renderebbe inconsistente l'implementazione.
% Questa tipologia di negazione e' detta 'Negazione per fallimento' proprio per
% il suo modo di funzionamento. Il Prolog insieme alla negazione del fallimento
% permette di fare ragionamento non-monotono.
% Proprieta' di Monotonicita': Se KB |= F, allora anche KB U { C } |= F
