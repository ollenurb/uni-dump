\newpage
# Bilanciamento del Carico e Terminazione
Il il bilanciamento del carico e' utilizzato per distribuire il carico in
maniera equa tra tutti i processi in modo da ottenere lo speedup migliore
possibile. La terminazione invece e' un problema che concerne la determinazione
di quando il programma debba effettivamente terminare (cioe' ha fatto cio' per
cui e' stato programmato). Piu' nello specifico, si vuole che il protocollo di
terminazione (come ad esempio quello di `MPI`) venga rispettato.
Sia il *load balancing* che la *termination detection* sono dei probemi
particolarmente difficili quando parliamo di un ambiente distribuito
(tipicamente message passing)

Ci sono vari modi per garantire il bilanciamento del carico. Le due famiglie
principali sono il *bilanciamento statico* e il *bilanciamento dinamico*.
Essenzialmente il bilanciamento statico e' fatto a tempo di compilazione, per
cui e' generalmente piu' efficiente della sua controparte, mentre quello
dinamico e' calcolato a runtime. Nonostante il bilanciamento dinamico sia meno
performante di quello statico, risulta comunque piu' flessibile.
Alcune tecniche di load balancing statico sono ad esempio:

* *Round Robin*: assegna i tasks alle UC in maniera sequenziale, passando di
  nuovo alla prima UC quando tutte sono state assegnate
* *Randomized Algorithms*: assegna i tasks in modo randomico
* *Recursive Bisection*: divide ricorsivamente il problema in sottoproblemi di
  uguale effort computazionale
* *Simulated Annealing* o *Algoritmi Genetici*: tecniche di ottimizzazione per
  trovare l'assegnamento sub-ottimo

Ci sono un certo numero di problemi fondamentali che riguardano il load
balancing, nonostante esistano delle soluzioni matematiche chiuse.

* E' molto difficile stimare accuratamente il tempo di esecuzione senza
  effettivamente eseguire le parti di programma
* I delay di comunicazione cambiano profondamente in base alle circostanze
  operative (es. la topologia di alcune reti e' inerentemente non uniforme,
  fattori legati al caching in sistemi non distribuiti ecc..)
* Alcuni problemi hanno un numero indeterminato di step per raggiungere la
  soluzione (es. convergenza)

Il bilanciamento dinamico risolve questi problemi poiche' essenzialmente sono
dati dal fatto che il tempo di esecuzione non puo' essere noto, mentre nel
bilanciamento dinamico implicitamente lo sono.
Tutti i fattori precedenti vengono tenute in considerazione effettivamente
dall'algoritmo di load balancing, che comunque introduce un overhead nel
programma. Nonostante cio', la risoluzione di questi problemi e' solo in linea
di principio e dipende da altre variabili, per cui si potrebbe incappare in un
caso in cui si perda piu' di quello che si guadagni.

Possiamo classificare il bilanciamento dinamico in due ulteriori varianti:

* Centralizzata
* Decentralizzata

Quando parliamo di struttura centralizzata stiamo essenzialmente parlando di un
paradigma *Master-Worker*, in cui il master e' il punto centralizzato incaricato
di schedulare i tasks ai workers. Il problema di questo tipo di approccio e' che
il *master* e' il *single point of failure*, per cui se esso per qualche ragione
dovesse smettere di funzionare l'intero sistema cadrebbe.

> Per risolvere il problema del *single point of failure*, Kubernetes impiega 3
  masters, in cui 2 di essi sono essenzialmente la copia di quello principale.
  L'idea e' che si massimizzi cosi' la *reliability* ma sacrificando il
  *thoughtput*.

La terminazione nel caso del load balancing centralizzato e' particolarmente
semplice. Essa puo' terminare solo quando le seguenti condizioni sono
soddisfatte insieme

* La coda dei task dle master e' vuota
* Ogni worker ha fatto una richiesta senza che nessun'altro task sia stato
  generato

L'idea del load balancing decentralizzato e' invece quella di distribuire il
compito del master tra tutti i workers. In linea di principio ogni worker puo'
ricevere dei tasks da altri workers e a sua volta puo' inviare tasks ad altri
workers. Un modo per farlo e' organizzare una struttura gerarchica di masters.
Ogni master gestira' un sottoinsieme di workers con la propria coda interna, che
verra' riempita a sua volta dal master padre al livello successivo. Ovviamente
una rete di master puo' avere qualsiasi struttura.
Un'altra soluzione e' quella di distribuire totalmente la pool di task su tutti
i workers, comunicando tra di loro come se fossero una rete *peer-to-peer*:

* **Receiver-Initiated method**: un worker richiede i tasks dagli altri workers
  quando non ha piu'/abbastanza tasks da eseguire. E' un metodo che si e'
  dimostrato funzionare bene con alti carichi e pochi processi. Il problema e'
  che in generale un worker non ha idea di chi e' messo nelle condizioni di
  inviarle dei tasks, per cui potrebbe fare molte richieste a processi che sono
  nelle sue stesse condizioni, per cui all'aumentare al numero di processi il
  numero di comunicazioni aumenta di conseguenza con magnitudine piu' grande.
* **Sender-Initiated method**: un worker manda i tasks ad altri processi che
  seleziona. Tipicamente un worker con un alto carico passa i suoi taks ad altri
  che si sono resi disponibili ad accettarli. Contrariamente al metodo
  receiver-initiated funziona bene solo per carichi molto bassi.

Questi due metodi vengono chiamati in letteratura come *work-stealing*.
In questo caso la terminazione puo' avvenire solo se le seguenti condizioni di
terminazione sono soddisfatte:

* Ogni worker non deve avere uno o piu' task non eseguiti completamente.
  (*condizione locale di terminazione*)
* Non ci devono essere piu' messaggi in transito nel sistema (*condizione
  globale di terminazione*)

## Terminazione Distribuita
### Algoritmi di terminazione ad Albero
E' possibile ricavare anche un algoritmo di terminazione distribuito molto
generale. L'idea e' quella di ricavare una struttura a grafo, indipendente dalla
struttura di comunicazione dei workers che descrive la relazione di attivazione
tra task diversi. Essenzialmente l'algoritmo funziona nel modo seguente:

* Se un worker ha mandato un task ad un altro worker ne diventa il padre
* Quando un worker riceve un task, manda immediatamente indietro un messaggio di
  *acknowledge*, ma solo se il worker da cui lo riceve sta nella gerarchia piu'
  in alto di lui (e quindi e' un padre, nonno ecc..)

In questo modo possiamo determinare se un worker qualsiasi puo' terminare
verificando che tutte le seguenti condizioni siano rispettate:

* La condizione di terminazione locale del singolo worker e' soddisfatta
* Il worker ha trasmesso tutti i suoi messaggi di acknowledgement per task che
  ha ricevuto
* Il worker ha ricevuto tutti i suoi messaggi di acknowledgement per i task che
  ha mandato

In questo modo il grafo di attivazione si espande in dimensioni quando i workers
comunicano task tra di loro, mentre si riduce ad un solo punto quando devono
terminare. Si noti come una conoscenza distribuita venga in questo modo
accentrata su un solo punto (l'ultimo worker che terminera')
Ovviamente ci sono versioni differenti di questo algoritmo che inducono delle
strutture differenti di quelle a grafo come ad esempio degli anelli

### Algoritmi di terminazione a Energia fissa
L'idea e' essenzialmente quella di impostare una quantita' fissa all'interno del
sistema detta *energia*. Il sistema inizializza il worker iniziale con tutta
l'energia dell'intero sistema. Ogni volta che un worker manda delle richieste di
tasks ad altri workers, ne passa una porzione della sua energia. In caso un
worker ricevesse delle richieste per dei task (e cosi' anche una porzione di
energia), l'energia verra' suddivisa e passata ad altri workers.
Un worker in idle, (che non ha task da eseguire) prima di richiedere nuovi
tasks, passa la propria energia al worker da cui l'ha ricevuta. In generale, un
worker non mandera' indietro la sua energia fin quando tutta l'energia che ha
inviato ad altri workers non sara' tornata indietro (non avranno terminato i
loro tasks).
Quando tutta l'energia ritorna al worker iniziale (*root*) e diventa idele,
allora si e' sicuri che tutti i workers sono idle e la computazione puo'
terminare.
Il problema principale e' che la divisione dell'energia dovra' essere
rappresentata su un numero a precisione finita, per cui quando si va a fare la
somma delle energie parziali per poi mandarle indietro, la somma potrebbe non
essere uguale alla quantita' originale.
Un'altro problema, sempre legato alla rappresentazione dell'energia, e' dato dal
fatto che non si possa dividere l'energia all'infinito, perche' raggiungerebbe
lo zero molto velocemente.