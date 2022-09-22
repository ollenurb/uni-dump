## Java Enterprise (JEE) e le architetture 3-Tier

* E' il precursore di Spring
* Framework per lo sviluppo di applicazioni server-side complesse
* E' concentrato sulla parte di business logic del server (backend)
* JCA serve a interfacciarsi con Software legacy/ERP 
* Gestione dei messaggi asincroni supportata dal framework 
* JEE deve essere utilizzato quando:
    * L'applicazione deve essere scalabile
    * Le transazioni devono assicurare data integrity (anche mediante TP
      monitors)
    * L'applicazione avra' piu' clients frontend
* Adatto allo sviluppo di applicazioni web based a livello di impresa
  (organizzazione di business). Sono software che facilitano la gestione delle
  attivita' dell'impresa.
* Il suo competitor e' .NET di Microsoft
* Le caratteristiche delle applicazioni Enterprise sono:
    * Necessita' informative
    * Complesita' dei processi di business
    * Eterogeneita' delle applicazioni, supportata la costruzione dei web
      service a partire dai componenti
* JEE integra diverse soluzioni per affrontare vari problemi, facilitando lo
  sviluppo del software
* Il modello di programmazione e' con approccio basato su API (un'applicazione
  puo' utilizzare i metodi messi a disposizione da un'interfaccia pubblica di un
  determinato servizio)
* Inoltre fornisce un'infrastruttura che permette di eseguire applicazioni in
  modo efficiente e scalabile
* JEE implementa un'architettura a 3 livelli (in realta' e' piu' genericamente
  considerata a n livelli, siccome possiamo stratificare ulteriormente la logica
  di business):
    * Client Tier: applicazioni client, web browsers, applets, JavaBeans
      components (che usufruiscono dei servizi ovviamente)
    * Web/Business Tier: i servizi che vengon esposti a livello di business
      possono essere usufruiti anche dalle applicazioni logali (servlets che
      stanno al Web-Tier)
    * EIS Tier: Database Systems/Sistemi Legacy
* Come detto, JEE racchiude al proprio interno diverse librerie, per citarne
  alcune:
    * JSON parsing
    * Messaging
    * Connections
    * Concurrency
    * Security
    * Injection
    * DB Access
* JEE mette a disposizione anche altre cose quali:
    * Java Namind and Directory Interface (JNDI), che permette di risolvere
      l'indirizzo di un oggetto remoto del quale si vuole eseguire metodo. La
      risoluzione non e' quindi fatta direttamente dal programmatore ma viene
      fatta dall'applicazion server.
    * RMI che permette di chiamare metodi di un oggetto remoto
    * Le servlets
* Al cuore di JEE ci sono gli EJB (entitty Java Beans), che possono essere di
  diverse tipologie 

## Session Beans
* Servono da intermediario tra client la parte web dell'applicazione, quali
  servlet. Di solito quando si chiama la servlet, essa chiama il sessio bean che
  opera sui dati e ritorna il risultato.
* Le invocazioni dei metodi sono mediate da RMI assorbite dentro i beans, quindi
  sono totalmente trasparenti al programmatore, siccome sono gestite
  dall'application server.
* Possono essere di due tipologie principali:
    * **Stateful**: salvano lo stato di interazione con l'utente, per cui si
      "ricorda" delle interazioni precedenti. Per sua natura un solo cliente
      ha accesso ad un'istanza del Bean
    * **Stateless**: non mantiene lo stato dela conversazione, per cui puo'
      supportare piu' clienti
* I session Beans implementano i servizi web principali dell'applicativo. In
  altri termini avro' tanti quanti beans quante sono le user stories (servizi)
  dell'applicazione.

## Entity Beans
* Rappresentano una singola tabella nel DB
* L'application server si occupa di andare a creare le tabelle per ogni entity
  bean differente, ogni istanza andra' poi a rappresentare una singola riga
  della tabella associata alla propria classe
* Per questo motivo, ogni istanza e' identificata da una singola chiave
  primaria
* Siccome vive come un oggetto Java all'interno dello Heap, per poter rendere
  effettive le modifiche anche al database, deve essere richiamato un metodo
  `persist()`
* Contrassegnate da annotazione `Entity`

> Ogni classe individuata dalle user stories e' una classe candidata a diventare
> un'entity Bean.

## Message Driven Beans
* E' un oggetto che ha un solo metodo chiamato `onMessage()`, che si attiva
  quando viene mandato un messaggio asincrono ad esso
* Specializzato a ricevere messaggi asincroni (JMS che sono messaggi Java).
  hanno vita breve che dura solo l'elaborazione di un messaggio.
* *Es*. L'application client manda il messaggio inserendolo in una coda apposita
  gestita dall'application server, a quel punto viene chiamato il metodo
  `onMessage()` del MDB, ma solo quando esso e' pronto (il tutto e' ovviamente
  gestito dall'Application Server)

## Singleton Bean
* Realizzano il Singleton Pattern dei GoF, cioe' sono classi che contengono dati
  e operazioni che sono in un qualche modo globali all'applicazione

## J2EE Server
* Fornisce la JVM e le classi di supporto agli EJB
* Fornisce funzioni di base di ORB e TP monitor (load balancing e transazioni)
* Fornisce funzioni di accesso ai DB
* Fornisce funzioni di load balancing
* Contiene sia il Web Container (che contiene le Servlet/JSP) e il EJB container

## EJB Container
* Fornisce l'ambiente in cui vengono eseguiti gli EJB
* Mantiene pools di istanze di Beans che sono pronti per soddisfare le
  richieste, gestendone in modo ottimale il passaggio da attivi/inattivi,
  schedulandone opportunamente l'esecuzione in multithreading
* Sincronizza le variabili di istanza degli entity Beans con il Database

### Entity Manager
* E' una parte del container che gestisce la persistenza
* Definisce un contesto di utilizzo che definisce l'ambito nel quale un'entita'
  e' creata e persiste
* Ci sono due modalita' di consistenza:
    * Container Managed: gestita dal container (- controllo, piu' facile)
    * Application Managed: gestita dal programmatore (+ controllo, piu'
      difficile)
* La Persistence Unit definisce un insieme di classi entity gestite da un
  singolo Entity Manager
* Tipicamente un Entity Manager corrisponde ad un singolo Data Store

## Java Messaging Service
* E' una funzionalita' offerta da JEE, permette di scrivere un'applicazione
  distribuita e loosely coupled
* Loosely Coupled: Il ricevente e chi invia non necessariamente devono essere
  disponibili allo stesso momento per poter comunicare in modo corretto
* Il ricevente e il mittente devono solo conoscere:
    * Il formato del messaggio
    * Quale destinazione utilizzare

> JMS assicura che il messaggio inviato verra' recapitato

* Si usa per scivere applicazioni che devono comunicare in modo asincrono,
  quindi quando sono composte da sottoinsiemi diversi. Ovviamente le parti
  sono indipendenti ma pur sempre scritti in Java
* es. Sistema Informativo con diverse Aree di Competenza
* Ogni EJB puo' inviare messaggi perche' implementa di base le interfacce, solo
  i Message Driven Beans sono in grado di riceverli (perche' implementano il
  metodo apposito)

* Tutta l'infrastruttura di scambio e gestione dei messaggi e' mediata dal *JMS
  provider*
* JMS implementa le due modalita' di comunicazione P2P e Publisher/Subscriber
    * es. Un'applicazione client chiama un session bean, questo andra' a sua
      volta a pubblicare un messaggio su un topic specifico su una coda di
      messaggi. A tale topic e' iscritta una particolare istanza di messaging, a
      cui sara' recapitato il messaggio corrispondente.

## EJB Object (Remote)
* Ogni EJB puo' essere definito con interfaccia remota o locale
* Se l'interfaccia e' definita remota, e permette di chiamare metodi di un
  oggetto che gira su un'altra macchina in modo totalmente nascosto al
  programmatore
