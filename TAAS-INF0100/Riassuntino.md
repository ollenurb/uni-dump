# Java Enterprise (JEE) e le architetture 3-Tier

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

---

# Service Oriented Architectures
* Grandi aziende devono integrare diversi sistemi (web moderni e legacy)
* La SOA e' una struttura di integrazione di questi diversi sistemi
* Prima della SOA tutte le funzionalita'/servici erano all'interno di dei
  "silos" monolitici, ed erano interne al monolite
* La SOA introduce dei servizi di business piu' piccoli riutilizzabili. Le
  applicazioni vengono poi costruite sulla base di questi servizi (Composite
  Sofware Applications)
* JEE e' ibrida: permette di realizzare entrambe le cose
* Cio' che rende potenti i Web Services e' il fatto che utilizzano dei linguaggi
  standard per comunicare tra loro (tipicamente XML/JSON)
* Appplication-Centric Web: le applicazioni espongono anche i servizi che
  possono essere utilizzati a loro volta da altre applicazioni (es. Google
  Books)

> I Web Services sono oggetti software incapsulati (implementazione nascosta,
  indipendente dal SO o linguaggio), mediati da un contratto (che descrive i
  servizi che espone) e che utilizza un linguaggio standard (tipo XML) per la
  comunicazione

* Ci sono diversi Standard di WS:
    * SOAP: e' un protocollo per il richiamo di procedure remote
    * WSDL: linguaggio per la definizione di WS, scritto in XML
    * UDDI: e' un protocollo per scoprire i Web Services, funge da "discovery"
      client
* In generale, la dinamica e' la seguente:
    * Un consumatore che vuole utillizzare servizio consulta l'UDDI registry
    * Il registro punta all'indirizzo del servizio e alla sua descrizione
      scritta il WSDL
    * Sapendo l'indirizzo e la descrizione del servizio, esso puo' venir
      richiamato mediante SOAP

* Ci sono due tipi di invocazioni dei Web Services
    * Invocazione Sincrona (RPC-Style): Mando la richiesta in SOAP e la risposta
      mi arriva sempre in SOAP, ma la aspetto.
    * Invocazione Asincrona (Document-Style): Mando la richiesta ma continuo a
      fare altro, la risposta arrivera' eventualmente.

## SOAP
* Un messaggio SOAP e' scritto in XML ed e' composto da 
    * **Header**: contiene molti dati opzionali, tra cui ad esempio anche
      headers di autenticazione
    * **Body**: contiene proprio la signature dei metodi quali valori di
      ritorno, valori di input, etc..
* Ci sono schema pre-fatti che descivono gli elementi principali
* SOAP prevede anche la gestione delle eccezioni, provvedendo con dei componenti
  appositi per le stesse

## WSDL
* Linguaggio per la descrizione di Web-Services
* Definisce dei costrutti per definire:
    * DataTypes: tipi di dati che sono permessi
    * Messaggio: descrizione del messaggio che puo' essere invocato sul web
      service
    * Operazione: descrizione astratta delle operazioni disponibili del web
      service
    * PortType: descrizione del tipo di interazione
    * Indirizzo: indirizzo dove risiede il servizio

* PortType puo' avere 4 titpi di interazione:
    * One-Way: il messaggio arriva al web service ma non c'e' nessuna risposta
    * Request-Response: il messaggio arriva al WS che rispondera'. Un output per
      ogni input
    * Solicit-Response
    * Notification: il server manda un messaggio al client che non riponde
      (opposto di one-way)

## UDDI
* E' una sorta di "pagine gialle" per trovare i web services
* Definisce delle operazioni per:
    * Caricare un nuovo web service nel registro
    * Fare l'update di un web service esistente
    * Cercare servizi (per tipologia di business, etc..)

* Ogni volta che si carica un web service nel registro devono essere specificate
  diverse informazioni dal punto di vista tecnico e di business
* L'UDDI contiene dei bindings che collegano gli UDDI registration files (che
  sono letteralmente le entry del registro) al file WDSL vero a proprio del
  servizio associato (che risiedono a loro volta sullo stesso server dove e'
  caricato il web service che rappresentano)

## REST
* Representational State Transfer (REST)
* E' uno stile di architettura software per sistemi distribuiti
* Diventato uno standard famoso in tutto il mondo
* Permette di utilizzare sia XML che JSON come linguaggi
* In REST un servizio identifica delle risorse
* Queste risorse possono essere operate mediante un'interfaccia uniforme che e'
  data dai metodi HTTP: POST/PUT/DELETE/GET
* Alternativa light alla controparte SOAP/WSDL
* Le interazioni sono inoltre stateless
* Gli URI hanno una struttura tipo directory
    * `GET /api/customer`: ritorna tutti i customers
    * `GET /api/customer/{id}`: ritorno il customer con specifico id
* A differenza di SOAP che espone il documento che descrive le operazioni, REST
  espone direttamente le risorse. Le operazioni sono specificate implicitamenre
  dai metodi HTTP
* Inoltre tutte le tipologie di risposte sono codificate dagli HTTP status codes
* REST e' molto piu' facile da invocare di SOAP anche

# Architettura a Microservizi
* Nata pochi anni fa
* "SOA Done Well": Architetura totalmente distribuita che si basa sui servizi
  REST.
* La componente fondamentale e' il microservizio. Esso individua un determinato
  servizio, corredato da tutti i 3 layers: presentation, business logic e dati
* Ognuno di essi e' autonomo, indipendente e deployabile e collabora con tutti
  gli altri servizi per formare un'applicazione univoca
* In JEE quando c'e' un problema di load balancing, l'application system fa
  salire un intero container. In questo modo alloca anche dei beans che non sono
  strettamente utili e che non servono. Nei microservizi non abbiamo questo
  problema perche' abbiamo piu' granularita' per fare load balancing.
* Ogni microservizioe e' totalmente autocontenuto e puo' venire sviluppato con
  il linguaggio e la tecnologia adatta per il compito che deve svolgere
* I benefici dei microservizi sono molti:
    * I servizi sono piccoli, per questo sono facilmente capibili e riscrivibili
      interamente in caso. Inoltre facilitano la collaborazione (1 team = 1
      microservizio)
    * La scelta della tecnologia e' indipendente dagli altri, per cui possono
      essere adottate nuove tecnologie nel tempo
    * Il deployment dei microservizi e' individuale, significa che se uno cade,
      solamente il servizio non sara' disponibile, ma non l'intero server
    * Sono molto scalabili (basta aggiungerli)
    * Sono molto agili sia nello sviluppo che nell'utilizzo
* Con la continous integration posso effettuare dei test indipendenti sui
  singoli microservizi
* Alcuni downsides dei microservizi sono pero':
    * L'interazione tra i microservizi e' particolarmente complicata, per cui e'
      difficile immaginarsi a priori il bare minimum di comunicazioni necessarie
      tra i vari ms (ad esempio fare una join)
    * Difficile fare monitoring, cioe' avere un posto centralizzato per fare
      logging
    * E' necessario automatizzare il processo di deployment
* Quanto deve essere piccolo un microservizio?
    * Se sono troppo piccoli diventano praticamente delle classi che parlano
      l'una con l'altra (troppo traffico)
    * Se sono troppo grossi si perdono comunque i benefit dell'autocontenimento
      (diventano monoliti essenzialmente)
* Il monolite funziona bene per delle applicazioni piccole che devono gestire un
  numero limitato di utenti. Hanno una sola codebase ed e' molto semplice il
  deployment (singola applicazione)
* Il problema deriva dallo scaling: all'aumentare del numero di utenti e di
  sviluppatori aumenta il numero di moduli entangled e la difficolta' di
  manutenzione
* Approccio Tradizionale: Uno o diversi servizi si servono di un singolo
  database monolitico
* Approccio a microservizi: Diversi servizi integrano al proprio interno dei
  database contenenti i dati e le tabelle necessarie a provvedere il servizio
  implementato. Il layer di presentazione si occupa di andare a chiamare i vari
  microservizi. Ogni microservizio implementa un'interfaccia REST. I
  microservizi sono stateless, cioe' non tengono conto delle interazioni con
  l'utente
* La comunicazione tra microservizi puo' essere
    * Sincrona: request/response, implementata dalla orchestration architecture
    * Asincrona: event based, implmenetata dalla choreography architecture
* Un'altro vantaggio e' che posso mandare avanti le versioni di singoli
  microservizi, quindi ho un'ulteriore granularita' da questo punto di vista

* Tipi di architetture a microservizi:
    * API Gateway: un microservizio gateway funge da hub principale che riceve tutte
      le richieste e si occupa di smistarle ai vari microservizi
    * Event/Driven architecture: I microservizi comunicano con messaggi asincroni su
      un message bus condiviso (pub/sub)
    * Hybrid Event-driven + RPC architecture: I microservizi comunicano sia in modo
      sincrono che asicrono (con message bus)

* Cosa fare quando le performance delle reti dei microservizi sono scadenti?
    * Si deve cercare di minimizzare l'impatto della latenza
    * Considerare delle dimensioni per i servizi piu' grandi, quindi meno
      fine-grained 
    * Evitare dei comportamenti "chatty", cioe' troppa comunicazione tra i
      servizi evitando quella inutile
* Il tutto si capisce ovviamente per trial-error

* Registration Service: E' un servizio esterno in cui vengono registrati tutti
  gli indirizzi dei microservizi. E' molto piu' flessibile di un approccio
  hard-wired.

* Differenze tra SOA e Microservizi
    * SOA stateful, microservizi stateless
    * SOA tendono a utilizzare un enterprise service bus (ESB) mentre i
      microservizi si apoggiano ad un sistema meno elaborato di message
      brokering
    * SOA sono composti da piu' linee di codice dei microservizi (che posso
      avere anche solo 100 LOC)
    * I SOA mettono piu' enfasi nella riusabilita', mentre i microservizi si
      concentrano nel fare decoupling il piu' possibile
    * In cambiamento in un SOA richiede un cambiamento nell'intera applicazione
      monolitica
    * I SOA usano spesso DB relazionali, mentre i microservizi gravitano piu'
      spesso con DB non relazionali (NoSQL)

* Pincipi di design dei microservizi:
    * High Coesion: una sola cosa ma ben fatta
    * Autonomous: indipendentemente intercambiabili e deployabili
    * Business Cetric Domain: costruiti intorno alle componenti di dominio
    * Resilience: tener conto dei failures durante la fase di design 
    * Observable: il loggging deve essere centralizzato
    * Automation: impiego di tools per il testing e il deployment automatico

* Problema di duplicazione dei dati: introduce un grande problema di
  consistenza.

* Approccio sviluppo Domain-Centric: 
    * Si identificano prima i domini di business
    * Successivamente si definiscono i domain boundaries (come comunicano e
      quali sono i contratti tra i servizi)
    * Infine ci si mette d'accordo su un linguaggio comune per comunciarsi ai
      domain boundaries

* Greenfield Software development: essenzialmente partire da 0, from scratch
    * Non ci sono restrizioni
    * Non c'e' legacy code
    * Molto raro

* Brownfield Software development: occorre creare nuovo software tenendo conto di
  software gia' esistente
    * Presenza di legacy code
    * Il nuovo software deve essere integrato con l'infrastruttura precedente
    * Maggioritario rispetto al greenfield
* Per migrare un sistema Brownfield si individuano tutte le componenti delle
  diverse business units che hanno il minimo numero di dipendenze e si
  refattorizzano in microservizi singoli

## Design Patterns microservizi

* Broker Composition Pattern
    * Le richieste vengono filtrate da un Gateway
    * Il gateway pubblica sul bus dei messaggi le richieste
    * Il bus (message broker) si occupa di smistarle ai vari servizi
    * E' automaticamente bilanciato, poiche' ogni servizio andra' a servire la
      prossima richiesta solo quando avra' finito di processare la precedente

* Aggregate Composition Pattern
    * Prevede un aggregatore a lato frontend che va ad aggregare i risultati dei
      diversi microservizi (Frontend Service Aggregator)

* Chain Composition Pattern 
    * Viene chiamato un solo servizio e tutti gli altri vengono chiamati a
      catena
    * In questo caso sono richieste sincrone

* Branch Composition Pattern
    * Anche in questo caso c'e' un aggregatore frontend
    * La differenza sta nel fatto che i microservizi possono essere chiamati in
      due modi:
        * Chain synch: a catena in mood sincrono
        * Broker async: in modo asincrono (siccome i servizi utilizzano un
          message broker)

### Data Consistency
* Siccome queste architetture sono distribuite, anche i dati che trattano sono
  distribuiti, per cui e' necessario trovare un modo per garantire la
  consistenza dei dati
* I problemi di data consistency sono dati da:
    * Architettura Distribuita
    * Dati distribuiti
    * Transazioni distribuite
* Il SAGA pattern e' un pattern per ottenere la proprieta' ACID nei microservizi
* Si basa sulla presenza del LOG: esso colleziona tutti i dati degli eventi di
  scambio di messaggi tra i vari servizi
* Attraverso i LOG posso fare il rollback
* Il SAGA Execution Coordinator monitora i log e va a fare conseguentemente le
  richieste di "compensazione" qualvolta ci sia un errore
* Tutte le request/response che vengono inviate vengono salvate nel SAGA LOG
* Quando c'e' un errore, il SEC va a fare undo di tutte le richieste che aveva
  fatto (e che aveva opportunamente salvato nel proprio log)

### Eventual Consistency
* E' un approccio in cui essenzialmente si accetta la possibilita' che i dati
  siano effettivamente inconsistenti

## API Gateway
* L'API Gateway permette un accesso centralizzato ai microservizi da parte delle
  applicazioni esterne
* Permette di ottenere:
    * Funzionalita' distribuite
    * Dati distribuiti
    * Sicurezza distribuita
* Puo' essere utilizzato per:
    * Gestire le diverse versioni delle API
    * Gestire la sicurezza/autenticazione
    * Load Balancing
    * Logging Centralizzato
    * Controllo del traffico
    * Caching
    * Trasformazioni delle richieste

* Il Gateway ci permette inoltre di nascondere il modo in cui interagiscono i
  microservizi (es. alcuni potrebbero usare REST, altri SOAP, RPC-JSON, ecc..)

> Al suo interno vengono solitamente inserite tutte le funzionalita' che
> dovrebbero essere diversamente ripetute da tutti i microservizi

## Microdatabase
* Essenzialmente l'idea e' quella di inserire un singolo database per ogni
  microservizio
* Tipicamente per migrare da un monolite, si migrano tutte le tabelle dei dati
  che sono necessarie alla *funzione* del microservizio (*function-first
  design*) 
* I dati sono un mezzo (per definire le funzioni) non un obiettivo finale

## Event Driven
* L'approccio si basa sull'utilizzo di un message broker per fare
  l'aggiornamento dei dati: ogni servizio viene notificato dall'event bus
* In molti caso si possono evitare quindi dei database locali (alcuni servizi
  possono utilizzare anche solo un meccanismo di caching)
* Esempio: 
    * Servizio A aggiorna i suoi dati, manda l'evento sull'event bus
    * Servizi B, C, D che hanno dei dati che dipendono da esso aggiorneranno i
      dati di conseguenza

## Continous Integration
* La CI ha l'obiettivo di gestire le release del software, facendo delivery del
  software per componenti singole del software e non interamente
* L'architettura a microservizi si presta bene a questa metodologia di sviluppo:
  posso fare testing di un solo microservizio e farne il deploy automatico
* Attraverso un Continous Deployment Tool, anziche' testare e deployare l'intera
  applicazione, posso andare a fare il testing/deployement automatico a livello
  dei microservizi

## Rabbit MQ
* E' un Message Broker Open Source
    * E' reliable
    * Fa routing (inoltra il messaggio ai destinatari sottoscritti)
    * Ha una CLI
* I client possono essere scritti in diversi linguaggi
* I servizi offeri da Rabit MQ sono:
    * Possibilita' di dichiarare diverse entita' indipendenti
    * Monitorare le code di messaggi
    * Inviare e ricevere messaggi
    * Monitorare i processi Erlang, i file descriptors e l'utilizzo di memoria
    * Forzare delle chiusure di connessioni e svuotamenti di code
* Il paradigma e' sempre Publisher/Subscriber e si basa sullo standard di
  messaging AMQP: ad ogni messaggio ricevuto succede un messaggio di ACK 
* Permette diverse interazioni:
    * Direct message: messaggio diretto ad una sola coda
    * Fanout message (Broadcast): messaggio viene inviato a tutti i topic
    * Topc Exchange (Pub/Sub): il messaggi veine inviato solamente a dei
      topic specificati

# Docker
* Docker e' un software per la gestione di containers (container engine)
* I containers sono come delle macchine virtuali lightweight, poiche' non
  bisogna virtualizzare anche il livello operativo
* In altri termini, i containers vengono virtualizzati a livello di sistema
  operativo, riducendo notevolmente l'overhead. L'SO puo' quindi eseguire piu'
  containers in modo concorrente
* Un container contiene tutti i pacchetti e le applicazioni necessarie a far
  girare l'applicazione desiderata
* Questo permette anche di eliminare inconsistenze derivanti dallo specifico
  ambiente utillizzato
* Ogni container e' isolato dall'altro

* I benefici sono suddivisibili in due lati:
    * Lato Developers: eliminano le inconsistenze derivanti dallo specifico
      ambiente utilizzato, inoltre gli ambienti di sviluppo risultano piu'
      puliti riducendo il numero di conflitti/problemi
    * Lato IT Operations: in ambito devops svolge un ruolo di assoluta
      importanza per ridurre quello che viene definito come il "systems
      development lifecycle"
* Tools:
    * `docker-machine`: tool per installare ed eseguire containers
    * `docker-compose`: tool per definire ed eseguire applicazioni che
      utilizzano piu' applicazioni containerizzate per mezzo di un file YAML

* **Docker Registry**: servizio di storage per le immagini docker, possono essere
  anche self hosted
* **Docker Hub**: e' il docker registry pubblico
* **Docker Repository**: diverse immagini docker uguali ma con tag di versione
  differente

* Quando si parla di docker bisogna differenziare due concetti:
    * Docker Image: e' il template che esegue il docker container. E' un
      pacchetto eseguibile standalone che definisce tutto il necessario per far
      girare l'applicazione, incluso il codice, il runtime, le librerie,
      variabili d'ambiente ecc...
    * Docker Container: e' l'istanza di runtime di un'immagine, cioe' cio' che
      l'immagine diventa in memoria quando viene eseguita (E' come una VM, per
      cui e' completamente isolata di default dalla macchina host)

* Le immagini e i containers vengono gestiti dal Docker Engine. Esso e' un
  processo demone che e' possibile controllare tramite un'interfaccia REST
  oppure tramite un programma CLI
* Un'immagine docker viene definita da un Dockerfile: un file testuale che
  indica tutti i comandi da eseguire necessari a creare un'immagine contenente
  un'applicazione
* Ricapitolando:
    * Da un Dockerfile si ottiene un'immagine docker (`docker build`)
    * Si fa girare l'immagine ottenuta ottenendo un container (`docker run`)
* La cosa interessante e' che alla necessita di molte richieste e' possibile far
  salire delle immagini (che condividono ad esempio lo stesso volume)
  permettendo una scalabilita' orizzontale
* Un'altra possibilita' e' utilizzare un container che definisce un ambiente per
  il testing e un'altro per definire un ambiente per il deployment
* Docker compose permette anche di creare delle reti locali in modo che i
  containers possano comunicare tra di loro e non risultino quindi isolati
* Inoltre, permette anche di definire dei volumi in modo da rendere persistenti
  i dati di una determinata applicazione

# Kubernetes
* Sostanzialmente e' un orchestratore di container: organizza e gestisce delle
  applicazioni che sono containerizzate
* E' strettamente legato all'architettura a microservizi
* Kubernetes puo' girare sia sul cloud pubblico, che sui data centers privati
* In generale si occupa di implementare
    * Scheduling
    * Self-Healing (autostart di containers crashati)
    * Scaling (spawn di copie per scalabilita' orizzontale)
    * Updating (aggiornamento di singole componenti senza dover riavviare
      l'intero sistema)
* Un nodo **Master** funge da orchestratore e decide le politiche di
  orchestrazione ed esecuzione definite in un file di **Deployment**
* Ogni nodo gestito dal master e' un *insieme di containers Docker*
* I componenti principali di kubernetes sono:
    * API Server: espone le API all'esterno per controllare il cluster
    * Cluster-Store: e' cio' che Kubernetes utilizza per salvare tutte le
      configurazioni e gli stati del cluster
    * Controller manager: un controller di controller, cioe' controlla il master
      e puo' forzare alcuni comandi ad esso
    * Scheduler: assegna il lavoro ai nodi in modo bilanciato 
* `kubectl` e' un comando per gestire il cluster kubernetes

* Un Pod e' l'unita' computazionale di Kubernetes che viene fatta girare su un
  particolare Nodo
    * Un nodo puo' essere sia una macchina virtuale che fisica
    * Ovviamente un nodo puo' far girare piu' pods
* Ogni nodo e' composto da 3 componenti:
    * **Kubelet**: e' il master del nodo che controlla ed istanzia i pods, parla
      con il master del cluster. e' un entrypoint per inviare comandi al nodo
    * **Container Engine**: l'engine che deve far girare i vari pods
    * **Kube Proxy**: siccome tutti i containers in un nodo condividono lo
      stesso IP, kube proxy smista automaticamente le richieste ai vari
      containers all'interno di un pod
* Il Manifest e' il file **dichiarativo** per dire quello che deve fare il
  master
    * Specifica il numero di repliche di un nodo, le immagini dei containers, il
      port forwarding, ecc...
* Un Pod e' l'unita' atomica computazionale di scheduling
    * Ospita uno o piu' containers
    * Tutti i containers condividono lo stesso ambiente del Pod (ad esempio
      l'indirizzo IP)
    * Puo' vivere solo all'interno di un singolo nodo (non in piu' nodi
      contemporaneamente)
    * Il lifecycle puo' avere 4 stati differenti:
        * Pending
        * Running
        * Failed
        * Succeeded
    * Vengono costruiti secondo il manifest file
* Tipicamente inserire troppi servizi all'interno di un singolo pod ne aumenta
  il coupling (tight coupling)

> La migliore scalabilita' si ottiene aumentando Pods, non aumentando
  Containers all'interno dei pods!

* Kubernetes mette a disposizione anche tutto un sistema di labeling per aiutare
  con la continous integration
    * Ogni Pod puo' essere etichettato
    * es. etichetto con beta, poi quando pusho una versione posso cambiare solo
      quelli etichettati in un certo modo

# Cloud Computing
* La differenza tra Hosting e il Cloud Computing e' che nella prima non si paga
  in base all'utilizzo (tipicamente in base al numero di accessi al servizio)
* Con Cloud Architecture e' una serie di tecnologie infromatiche orientate a
  fornire dei servizi sia software che hardware attraverso la rete
* Possiamo individuare diverse categorie nel Cloud Computing:
    * Infrastracture as a Service (IaaS)
        * Offre un'infrastruttura in termini di risorse hardware (tempo CPU,
          memoria)
        * Soluzione adottata soprattutto per task che sono computazionalmente
          intensivi
        * Molte aziende lo utilizzano per evitare di avere l'hardware in azienda
          (boh)
    * Platform as a Service (PaaS)
        * Fornisce l'ambiente software tramite il quale il programmatore puo'
          fare il deploy dell'intera applicazione
    * Software as a Service (SaaS)
        * Sono delle vere e proprie applicazioni che girano su hwardware remoti
        * Ne sono un esempio (Google Docs, Gmail, ecc..)
        * Utilizzare software as a service ha diversi benefici, tra cui la
          riduzione di risorse on premises, meno costi, non necessita di
          installazioni locali e' piu' facile da aggiornare e non necessita di
          troppa manutenzione
        * Di contro, ci sono diversi rischi associati tra cui la scarsa
          customizzazione, performance limitate e puo' essere quindi piu'
          difficile da integrare con i software esistenti
    * Containers as a Service (CaaS)
        * Offre essenzialmente solo il container engine
    * Functions as a Service (FaaS):
        * L'utente non fa altro che eseguire direttamente una funzione. Il
          deploy e' solo delle funzioni! 

* On-Premises: funzionalita' del cloud computing che sono in realta' nella rete
  locale
* Service Level Agreement: e' un contratto che si stipula con il provider che
  definisce tutti i termini e le condizioni dell'utilizzo del servizio (tra cui
  il prezzo)

## Heroku
* E' un servizio PaaS, per cui fornisce l'ambiente software tramite il quale il
  programmatore puo' effettuare il deploy dell'applicazione
* In Heroku ci sono i cosiddetti Dynos, che indicano dei servizi che vengono
  offerti dalla piattaforma. (es. dynos di mysql, dynos di postgres ecc..)
* Tramite una CLI viene creata un'applicazione heroku
    * L'applicazione viene prima sviluppata in locale
    * Successivamente viene fatto il deploy con la CLI di Heroku
* Si integra perfettamente con git, siccome il deploy viene fatto su una remote
  Heroku apposita
