# Software Architecture Overview
* Evoluzione delle soluzioni client/server (da piu' centralizzata a
  decentralizzata)
    * Timesharing: Basata su terminali senza capacita' computazionali e veniva
      fatto TUTTO (dati, logica, presentazione) dal mainframe (server)
    * Client Presentation: Aveva qualche capacita' computazionale giusto per
      poter eseguire della logica di presentazione
    * Applicazione Distribuita: Le prime applicazioni avevano la logica di
      business distribuita tra client e server. Il server conteneva i dati e una
      parte della logica, mentre il client aveva anch'esso una parte della
      logica e la parte di presentazione
    * Database Centrale: Il server contiene solo i dati. La logica e la
      presentazione sono eseguiti dal client che ha capacita' computazionali e
      risorse sufficienti a farlo
    * Databse Distribuiti: I dati sono distribuiti anche sui clients
* Central Database (Fat Client)
    * Client composto da: Applicazione $\rightarrow$ Driver ODBC $\rightarrow$
      Driver DB $\rightarrow$ Protocollo di rete
    * Problemi:
        * Forte sollecitazione della rete
        * Necessita' di avere client con sufficienti risorse computazionali
        * Difficile scalabilita' data da bottleneck nella rete o nei drivers del
          DB
        * La manutenzione e' costosa, poiche' se cambia qualcosa nel programma
          deve essere cambiata su tutti i singoli clients
        * L'accesso ai dati e' poco protetto da errori di programmazione. I dati
          erano acceduti senza nessun problema dalla business logic senza nessun
          tipo di check
* RDBMS: Stored procedures 
    * Anziche' aprire una connessione e mandare la richiesta per ogni istruzione
      CRUD da eseguire sul DBMS, la stored procedure raggruppa piu' istruzioni
      insieme, garantendo anche la consistenza ACID. 
    * Con le stored procedures, l'interazione client/server e' ridotta e piu'
      efficiente, delegando gran parte del processing al DBMS sul server e
      evitando cosi' di saturare la rete con troppe richieste
* Replicazioni Asincrone: prima ancora dell'avvento di internet, le grosse
  aziende avevano la necessita' di sincronizzare dati locali all'interno di un
  database centrale

## Middleware
* Il middleware fornisce servizi alle applicazioni software installate sul
  sistema operativo. Sono molto simili alle *chiamate di sistema*
* Rende piu' facile agli sviluppatori software l'implementazione di applicazioni
  che usano input/output, comunicazione tra sistemi etc..
* Ha guadagnato popolarita' negli anni '80 come soluzione al problema di linkare
  nuove applicazioni con vecchi sistemi legacy
* Le tipologie di middleware sono:
    * TP Monitor (OLTP)
    * Message Oriented (MOM)
    * Publish/Subscribe
    * Object Request Broker (ORB)
    * Object Transaction Monitor (OTM)

### TP Monitors
* OLTP: On Line Transaction Processing
* Principali caratteristiche:
    * Garantiscono le proprieta' ACID: 
        * Atomicity
        * Consistency
        * Isolation
        * Durability
    * Sincronizzazione di Two Phase Commit: il protocollo 2PC consente la
      gestione di transazioni in ambiente distribuito. Il commit dei dati
      avviente indue passi:
        * **Prepare Phase**: il coordinatore mada un messaggio di `PREPARE TO
          COMMIT` a tutte le basi di dati o agenti interessati alla transazione.
        * **Voting Phase**: Tutti i servizi rispondono con un messaggio `YES` o
          `NO`, oppure non rispondono
        * **Commit Phase**: se il coordinatore riceve una risposta positiva da
          tutti i servizi interessati, allora manda un messaggio di `COMMIT`
        * **Rollback Phase**: se il coordinatore non riceve risposta o riceve
          `NO`, allora manda un messaggio di `ROLLBACK` 
    * Bilanciamento del carico dei server, che permette di ribilanciare le
      richieste dividendole e smistandole a piu' servers
    * Gestione pool di risorse. Ad esempio detiene piu' connessioni ai DB, ma
      bilancia tali connessioni in modo da non sovraccaricare il singolo server
      (*funneling*)
* Vantaggi:
    * Scalabilita' e tuning per grandi sistemi
    * Adatti ad applicazioni *mission critical* (es. banca che deve garantire la
      sicurezza e consistenza delle sue transazioni)
* Limiti:
    * Minore produttivita'
    * Uso limitato di linguaggi 4GL, si usano linguaggi proprietari
* TP Monitors in commercio:
    * CICS
    * IMS
    * Tuxedo
    * Encina/TxSeries
    * MS Transaction Server

### Object Request Brokers
* Permette al server di esporre oggetti, permettendo la comunicazione tra
  sfotware scritto in diversi linguaggi ed eseguito su diverse macchine/sistemi
  operativi
* CORBA utilizza un linguaggio intermedio (*Interface Definition Language*) per
  specificare le interfacce che gli oggetti espongono al mondo esterno
* Tale linguaggio ha poi diversi compilatori per diversi linguaggi, in modo da
  garantire l'interoperabilita'
