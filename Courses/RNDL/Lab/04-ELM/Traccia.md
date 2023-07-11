# Traccia Laboratorio - ELM

## Domande

1. Il programma può eseguire un task di regressione o classificazione:
   attraverso quale variabile? Quale parte del programma gestisce operazioni
   effettuate esclusivamente per il task di classificazione? Con quale scopo?
2. In quale funzione viene gestita la normalizzazione dei dati? Provate a
   cambiarla per vedere l’effetto sulla risoluzione del task
3. In quale modo vengono inizializzati i pesi del modello? E il n. di neuroni
   hidden? E il n. di iterazioni? Provate a cambiare questi ultimi due parametri
4. Quale istruzione calcola i pesi di secondo livello? Provate a cambiarla
   utilizzando una delle altre implementate
5. Quale parametro viene usato per valutare la performance rispettivamente per
   problemi di regressione e classificazione?
6. Quali statistiche vengono prodotte in uscita per valutare i risultati
   ottenuti?

## Soluzioni

1. Tramite la variabile `Elm_Type`. La parte e' da LOC numero 39 fino alla 70.
   Serve a generare un numero di neuroni output pari al numero di valori univoci
   presenti nella colonna dedicata al valore target, siccome ognuno rappresenta
   una ben specifica classe.
2. Nella funzione `build_dataset` vengono normalizzati i dati al momento del
   caricamento
3. I pesi dei neuroni hiddden vengono inizializzati randomicamente (con
   distribuzione uniforme) nel file `elm_unif`. 
   I neuroni hidden vengono fatti variare da 5 a 70, mentre il numero di
   iterazioni e' controllato dalla variabile `NCycles`. 
   Per ogni valore di neuroni hidden il modello viene addestrato `NCycles`
   volte.
4. L'istruzione per il calcolo dei pesi per pseudoinversa viene fatta a riga
   151 (ce ne sono delle varianti: linea 153 e' quella regolarizzate, mentre
   linea 154 e' quella "classica" che non impiega funzioni di Matlab).
5. Nel caso della regressione viene utilizzata come metrica di training accuracy
   la *Root Mean Square Error* (errore quadratico medio), mentre per la
   classificazione l'*accuracy* (percentuale di esempi correttamente
   classificati)
6. Le statistiche sono:
     * Media
     * Deviazione standard
     * Minimo
   Calcolate rispetto alla metrica che del task scelto. Ogni valore viene
   salvato con il numero di neuroni hidden corrispondente al risultato ottenuto.
