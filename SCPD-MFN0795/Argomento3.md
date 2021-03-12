# Programmazione Message-Passing 
Come detto in precedenza, per programmare sistemi di calcolo paralleli (e quindi anche un
multicomputer basato sullo scambio di messaggi) e' possibile utilizzare principalmente:

1. Un linguaggio di programmazione appositamente creato per la programmazione parallela
2. Un linguaggio di programmazione sequenziale la cui sintassi e' estesa da istruzioni specifiche per
   la programmazione parallela
3. linguaggio di programmazione sequenziale e una libreria apposita per accedere alle
   funzionalita' di procedure e primitive utili alla programmazione parallela 

Oltre a queste modalita', potrebbe essere possibile anche utilizzare compilatori specifici atti a
parallelizzare codice sequenziale. Tale opzione pero' non e' praticabile soprattutto su sistemi a
scambio di messaggi, per il fatto che i linguaggi sequenziali non sono dotati della nozione di
scambio di messaggi. 
Noi ci concentreremo principalmente sulla terza opzione, utilizzando come linguaggio di
programmazione `C` e la libreria `Open MPI` (*Open Message Passing Interface*).
Per programmare secondo il paradigma message passing principalmente sono coinvolti due meccanismi
principali:

1. Un metodo per la creazione di processi separati per l'esecuzione su computer differenti
2. Un metodo per mandare e ricevere messaggi tra processi

## Creazione di processi
Si divide essenzialmente in creazione dinamica e statica. Nella creazione statica, il numero di
processi viene definito prima dell'esecuzione e il sistema eseguira' tale numero fissato di
processi. Nella creazione dinamica un numero arbitrario di processi puo' essere eseguito. I processi
possono essere creati anche durante l'esecuzione di altri processi. E' piu' flessibile ma introduce
*overhead*. 
Un'altra distinzione viene fatta se i processi sono creati a partire dallo stesso codice o a partire
da codici diversi. Nel primo caso si parla di SPMD, mentre nel secondo di MPMD.
`MPI` segue il modello di programmazione SPMD, in cui lo stesso programma viene eseguito su piu'
processori, operando su dati diversi. La diversificazione e' ottenuta attraverso diversi statement
di controllo di flusso all'interno del programma. In questo modello la creazione dei processi e'
statica. 

## Metodi per lo scambio di messaggi
Lo scambio di messaggi nella programmazione basata sul message-passing utilizza principalmente due
istruzioni principali per lo scambio di messaggi: `send` e `receive`.
La tipologia di queste istruzioni puo' a sua volta essere organizzata in modo tassonomico. Si parla
quindi di `send/receive` *sincrona/asincrona*, *simmetrica/asimmetrica*:
Per sincrono si indica un'operazione in cui si *attende* che venga conclusa, mentre con simmetrica
si indica uno scambio di messaggi mediato tra soli due processi.   
Una send sincrona attende fino a quando il messaggio puo' essere accettato dal processo destinazione
prima di spedire il messaggio. D'altra parte, una receive sincrona attende finche' il messaggio che
ci si aspetta arrivi. Intrinsecamente queste primitive oltre che a *trasferire dati* servono anche
a *sincronizzare processi*.
Implementazioni sincrone di queste primitive possono essere implementate utilizzando il *3-way
handshake protocol*.

D'altro canto, le send e receive asincrone consistono nel non aspettare che le azioni completino
prima di andare avanti con l'esecuzione. In generale, servono solo a scambiare dati e non hanno
nessuna utilita' in termini di sincronizzazione di processi. In MPI, all'interno di questa tipologia
di primitive asincrone possiamo distinguere altre due caratterizzazioni: 

* Bloccante: la primitiva completa (va alla prossima istruzione) dopo che l'azione locale completa.
  Ad esempio, nel caso di una send asincrona bloccante, questa proprieta' garantisce solamente che
  il messaggio sia stato inviato, ma non che sia stato ricevuto dal destinatario (come se fosse
  sincrona).
* Non Bloccante: la primitiva completa immediatamente. Nell'esempio della send, non da la garanzia
  che il messaggio sia effettivamente stato spedito. 


