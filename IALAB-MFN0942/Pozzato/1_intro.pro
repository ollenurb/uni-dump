% Fatti (predicati del prim' ordine): ex. rappresento che stella e fred sono
% dei gatti. Si noti che 'stella' e 'gatto' sono costanti
gatto(stella).
vivo(stella).
gatto(fred).
tigre(mike).
% ----------------------------------------------------------------------------------
% Rappresentiamo ora una regola di inferenza (clausole): voglio rappresentare
% che i gatti sono felini.
% Si noti che diversamente dal caso precedente, le variabili 'X' non sono
% costanti, per cui Prolog puo' fare pattern matching con opportune costanti.
felino(X) :- gatto(X).
felino(X) :- tigre(X).
% ----------------------------------------------------------------------------------
% E' possibile inferire piu' fatti a destra della regola, per cui vengono
% messi in "and" e sono separati da virgole
miagola(X) :- gatto(X), vivo(X).
% ----------------------------------------------------------------------------------
% Una volta creata la KB, possiamo caricarla (dall'interprete) con:
% ['1_intro.pl']. 
% Per interrogare la KB la sintassi e' uguale alla asserzione di fatti.
% es.
% ?- gatto(stella).
% true.
% ?- gatto(gattino).
% false.
% ----------------------------------------------------------------------------------
% Il comando `trace.` permette di fare "backtracking" per vedere le inferenze
% che ha fatto prolog per dedurre un certo fatto.
% es. 
% ?- trace.
% [trace] ?- felino(stella).
%   Call: (10) felino(stella) ? creep
%   Call: (11) gatto(stella) ? creep
%   Call: (11) gatto(stella) ? creep
%   Call: (10) felino(stella) ? creep
% true .
%
% Infine, Con il comando `nodebug.` possiamo uscire dall'environment di tracing
% ----------------------------------------------------------------------------------
% Un'altro modo di interrogare prolog e' chiedendo quali valori possibili
% possono rendere vero un certo fatto. 
% Questo tipo di interrogazione si fa come un'iterrogazione normale ma come
% argomento al posto di una costante si inserisce una variabile che prolog
% sostituira con il primo valore che rende vero il fatto. Con `;` si "avanza"
% chiedendo il prossimo valore possibile.
% es.
% ?- felino(Chi).
% Chi = stella ;    (avanziamo con ';')
% Chi = fred.
% true.
% ----------------------------------------------------------------------------------
% In Prolog non esiste la una negazione classica, poiche' corrisponde ad un
% sottoinsieme della logica classica (composto da clausole di Horn)
% ----------------------------------------------------------------------------------
