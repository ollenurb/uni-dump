# Breve rassegna storica
Dall'inizio degli anni 60 in poi naque la necessita' di creare nuovi metodi per la rappresentazione
della conoscenza. Questo perche' fino a quel momento si era utilizzata la logica dei predicati, le
quali presentavano diversi problemi in temini di adeguatezza espressiva, monotonicita' e di
efficienza computazionale nelle procedure di dimostrazione.
Schematicamente possiamo riassumere il quadro storico in 4 periodi principali a cui corrispondono 
le relative scoperte:

* Reti semantiche e frames (anni 60-70)
* Logiche non classiche (anni 70-80)
* Logiche descrittive (anni 80-90)
* Ontologie computazionali (anni 2000)
* Linked Data (dal 2010)

## Reti semantiche 
Una rete semantica e' un grafo i cui nodi rappresentano i concetti e gli archi le relazioni tra di
essi.  Questa tipologia di rete semantica e' detta **grafo relazionale**. Un punto a favore della
rappresentazione della conoscenza tramite rete semantica e' dato dal fatto che chi ne usufruisce e'
in grado di  visualizzare con immediatezza le relazioni tra i concetti, e di misurare e delimitare
in termini di "distanza" i concetti. Inoltre, una caratteristica implicita che deriva dalla natura
topografica stessa della rete, e' che il ragionamento puo' essere visto intuitivamente come un
**percorso** sul grafo. Inferire un fatto corrisponderebbe quindi a creare un percorso sul grafo,
partendo dai nodi che rappresentano le premesse, per poi arrivare fino ai nodi che rappresentano le
conclusioni. Una versione migliore delle reti semantiche sono le reti semantiche proposizionali, 
le quali includono nodi che rappresentano **proposizioni**. Introducento anche questo tipo di nodi
e' quindi possibile rappresentare anche credenze soggettive, senza che insorgano contraddizioni.


## Il sistema SNePS
E' un sistema software per la rappresentazione della conoscenza e per il ragionamento che si basa
sulle reti semantiche proposizionali, incorporando alcuni elementi della teoria dei frame.
Il sistema permette di inserire nuova conoscenza, cercare nodi con determinate caratteristiche e
inferire nuove asserzioni a partire da altre esistenti.
In SNePS ci sono 3 differenti tipi di nodo:

* I nodi molecolari: Rappresentano proposizioni
* I nodi base: Rappresentano individui con determinate caratteristiche a cui non si vuole dare un
  nome
* I nodi variabili: Rappresentano individui arbitrari o proposizioni

E' possibile poi collegare i vari nodi tra loro tramite le relazioni gia' predefinite nel sistema
oppure tramite relazioni definite ad-hoc.
Per asserire una proposizione in un determinato contesto si utilizza il comando `assert P`. In
questo modo si possono creare *credenze* di diversi soggetti nella rete andando a differenziare i
contesti.
Un contesto all'interno del sistema e' costituito da 3 diversi componenti:

* Un nome
* Un insieme di ipotesi: Asserzioni che fanno parte del contesto
* Un flag: Indica se il contesto e' consistente

### Frame Theory 
Sono un'evoluzione delle reti semantiche finalizzata a rappresentare la conoscenza di tipo
*stereotipato*. Un frame e' una struttura dati per la rappresentazione di *situazioni
stereotipiche*, come ad esempio il trovarsi in una determinata stanza oppure l'essere ad un
compleanno di un bambino. 
I livelli piu' alti di un frame sono fissi e rappresentano cose che sono sempre vere in merito a 
situazioni specifiche. I livelli piu' bassi hanno nodi terminali chiamati *slots* i quali devono 
essere riempiti con istanze specifiche o dei dati. 

Struttura di un frame: 

* Contrassegnato da un identificativo
* Ha degli slot piu' generali e specifici
* Ha degli slot piu' generici: essi possono avere dei vincoli di tipo, inoltre il contenuto di un
  frame puo' puntare ad un altro frame.
* Procedure per il calcolo automatico dei valori
