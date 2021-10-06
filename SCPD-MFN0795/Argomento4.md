# Paradigmi di programmazione paralleli
Nella programmazione parallela ci sono due macrocategorie principali di
paradigmi di programmazione:
    * Stream Parallel (task parallel)
    * Data Parallel
Lo scopo di tali paradigmi e' di indicare dato un problema, dove si trova (da
dove viene "*estratto*") il parallelismo.
In realta' il libro di testo a cui fa riferimento il corso, segue una
classificazione differente ma comunque le considerazioni ad alto livello fatte
in questa sezione rimangono valide.

## Stream Parallel
Nel caso stream parallel, l'assunzione e' quella di avere uno stream (lista
unbounded) di dati. L'accesso ai dati di uno stream richiede che ogni elemento
sia acceduto in sequenza, per cui e' differente da un array in cui e' possibile
accedere in modo random in qualsiasi posizione. Le forme di parallelismo piu'
comuni nel caso stream parallel sono a loro volta *Pipeline* e *farm*.
Nel caso della pipeline l'idea e' quella di calcolare una funzione $f$ per uno
stream di dati inbound. Tale funzione e' possibile scomporla in diverse
sottofunzioni indipendenti tra di loro, formalmente e' possibile rappresentare
$f$ come composizione di $n$ funzioni
$$
f = f_1 \cdot f_2 \cdot \dots \cdot f_n
$$
In questo modo, le funzioni possono essere eseguite in parallelo tra di loro,
stile "catena di montaggio".

![Modello di esecuzione a pipeline\label{figPipeline}](img/4.1_pipeline.png){
width=50% }

Se nel caso di una pipeline sequenziale il tempo di esecuzione e' 
$$
T_{seq} = T_{f1} + T_{f1} + \dots + T_{fn}
$$
in una pipeline parallela si ha che il tempo di esecuzione e'
$$
T_{par} = \max_{i \in 0, \dots, n}(T_{fi})
$$
In questa forma di parallelismo, il caso migliore e' evidentemente quello in cui
tutti i tempi di esecuzione delle singole $f$ sono uguali, in modo che il tempo
massimo non penalizzi gli altri tempi.
Il problema del pipelining puo' essere essenzialmente evidenziato per mezzo di
un esempio: Se supponiamo che il tempo piu' grande sia quello di $T_{f3}$ e che
tutti gli altri tempi siano minori e che si comunichi con primitive di
comunicazione asincrone bloccanti. Allora il buffer di ricezione del processo
che gestisce $f_3$ molto probabilmente soffrira' di overflow per le troppe
richieste provenienti dai "passi" inferiori della pipeline. Dimensionare tale
buffer e' inoltre impossibile.

Nel caso del paradigma task farm, l'idea e' invece quella di avere un processo
iniziale che distribuisce gli elementi dello stream ad elementi di calcolo
diversi, in cui tutti processano la funzione $f$. In questo senso differisce
dalla pipeline in cui i diversi processi calcolavano le sottofunzioni $f_n$.

![Modello di esecuzione task farm. L'elemento di computazione E(mitter) manda ai
workers ($f$) gli elementi dello stream da computare. Una volta computati, il
processo C(ollector) colleziona i risultati dai workers.
\label{figFarm}](img/4.2_taskfarm.png){ width=50% }

Il tempo di esecuzione sequenziale di un modello task farm e' pari al tempo di
esecuzione di $f$ stesso
$$
T_{seq} = T_f
$$
Nel caso parallelo, supponendo che si abbiano $n$ elementi di calcolo (workers),
come prima approssimazione si ha
$$
T_{par} = \frac{T_f}{n}
$$
In pratica, se vediamo l'intero sistema come una pipeline in cui $T_E, (T_f =
T_f/n), T_C$ sono i tempi di esecuzione rispettivamente dell'emitter, della
funzione e del collector, abbiamo che il tempo di esecuzione reale e' pari a
quello di una pipeline
$$
T_{par} = \max \{ T_E, \frac{T_f}{n}, T_C \}
$$
Se assumiamo ora a scopo di semplificazione che $T_E = T_C$(tempo di dispatching
e collection uguali). Dal momento che abbiamo detto che per una pipeline le
performance migliori si raggiungono quando i tempi sono tutti uguali, allora
possiamo imporre che
$$
n \leq \frac{T_f}{T_E}
$$
Questa relazione evidenzia come le prestazioni di questo paradigma aumentino
linearmente fino ad un threshold $\tilde{n}$. Questa situazione evidenzia un
collo di bottiglia, dato appunto dai tempi di servizio dell'*emitter* e del
*collector*. Un modo per aumentare $\tilde{n}$ il piu' possibile e' quello di
fare batching di task (aumentare la grana computazionale).

## Data Parallel
Nel data parallelism, l'impostazione e' diversa rispetto allo stream
parallellism. I dati non sono piu' sottoforma di generico stream in cui i dati
non erano gia' tutti disponibili, ma sono invece gia' tutti presenti all'interno
di una struttura (lista, matrice, tensore ecc..) per cui e' possibile gia'
accederli tutti insieme.
Il paradigma data parallel si occupa di esplicitare il parallelismo dividendo i
dati (gia' presenti) tra i diversi elementi di calcolo.
Principalmente, ci sono due sottocategorie principali di data parallelism:
* Globally Synchronous: *tutti* i processing elements necessitano di
  sincronizzarsi tra di loro (tipicamente mediante una barrier)
* Locally Synchronous (o *stencil*): *alcuni* processing elements necessitano di
  sincronizzarsi tra di loro

Alternativamente possiamo caratterizzare le computazioni data parallel nel modo
seguente (prendendo come esempio di struttura dati una *lista*):
* $map f [a_0, \dots, a_n] = [f(a_0), \dots, f(a_n)]$ 
* $reduce \oplus [a_0, \dots, a_n] = a_0 \oplus \dots \oplus a_n$ 
* $stencil f [a_0, \dots, a_n] = [ \dots, f(a_{i-1}, a_i, a_{i+1}), \dots]$ (in
  questo caso si e' presa come esempio una funzione a $3$ parametri, ma in
  generale ne ha $n$)

# Embarassingly Parallels Computations
Nella parallelizzazione di programmi sequenziali, quello che si vuole ottenere
idealmente e' una suddivisione del problema in parti diverse (idealmente $p$)
che saranno eseguite in parallelo dai diversi $p$ processori. Molti problemi
sono facilmente divisibili mentre altri no. La disivibilita' deriva
principalmente dalla presenza o meno di dipendenze tra operazioni che devono
essere eseguite in un ordine preciso. Quando questa dipendenza e' assente, le
operazioni possono essere eseguite indipendentemente su ogni dato, per cui e'
possibile parallelizzare tali operazioni.  Molti problemi hanno questa
caratteristica, tanto che sono stati chiamati problemi "embarassingly
parallels", proprio per la facilita' con cui si puo' ottenere una suddivisione
del problema sequenziale per ottenere una versione parallela.
