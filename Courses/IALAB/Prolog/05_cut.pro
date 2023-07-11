% Cut: Il cut e' un predicato che e' sempre vero che serve a modificare
% l'esecuzione dell'intereprete Prolog.
contaPositivi([], 0).
contaPositivi([Head | Tail], Totale) :-
    Head > 0,
    contaPositivi(Tail, OutputTail),
    Totale is 1 + OutputTail.
% Questa funzione ritorna `false` perche' non abbiamo specificato come deve
% trattare il caso in cui il numero sia effettivamente negativo
contaPositivi([Head | Tail], Totale) :-
    contaPositivi(Tail, Totale).
% in questo caso, sappiamo che una volta che ha raggiunto questa clausola
% (siccome vengono considerate per ordine, sicuramente l'elemento e' <=0
% ----------------------------------------------------------------------------------
% Il cut ci fa perdere il determinismo del programma perche' "taglia" dei rami
% (nell'albero SLD) in cui potrebbe fare backtracking. 
% Se noi abbiamo una regola del tipo q :- p_1, ..., p_i-1, !, p_i+1, ..., p_n,
% il cut (!) blocca il backtracking per P_i+1, ..., p_n in caso p_1, ..., p_i-1
% siano tutte false. Essenzialmente, prova fino a p_i-1, in caso siano ogni
% volta false (se stiamo provando a fare backtracking lo sono per forza),
% allora non continua e ritorna false.
% > Si noti che ovviamente in questo modo rendiamo la procedura incompleta,
% cioe' potrebbe essere vera esplorando le prossime alternative ma non vengono
% valutate e vengono considerate false automaticamente.
