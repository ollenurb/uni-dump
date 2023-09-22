---
title: 'Riassunto di Tecnologie del Linguaggio Naturale'
subtitle: 'Parte 2: Semantica Lessicale'
author: Matteo Brunello
numbersections: true
papersize: a4
geometry: margin=2.5cm
---

# Introduzione
La semantica lessicale è lo studio del **significato** delle parole e le loro
**relazioni**. La ricerca nelle ontologie è diventata sempre più centrale
nell'ambito della semantica lessicale. Un'ontologia è un modello semantico
formale basato sulla logica per rappresentare la conoscenza specifica di un
dominio. L'ontologia definisce un vocabolario che concettualizza la conoscenza e
permette quindi di rappresentare fatti per mezzo dei termini specificati in
esso. Tale vocabolario può poi essere condiviso, per cui facilita anche
l'interscambio di conoscenza.

L'importanza di avere un vocabolario comune può essere esplicata per mezzo di un
esercizio mentale: immaginiamo di voler rappresentare un bicchiere d'acqua.
Qualche persona potrebbe vederlo mezzo pieno, mentre altri potrebbero vederlo
mezzo vuoto. In questo caso, stabilire un vocabolario comune permette di
*fissare* la stessa prospettiva con cui si descrive la realtà di riferimento.

Il termine ontologia deriva dalla filosofia. Essa è per appunto la disciplina
che studia la natura (ciò che esiste) e la struttura della realtà. Un'ontologia
filosofica è un sistema strutturato di *entità*, organizzato in *categorie* e
*relazioni*.

Un'ontologia è una specifica esplicita di una concettualizzazione. Essa fornisce
un insieme di primitive rappresentazionali (che formano il vocabolario) con le
quali è possibile modellare un dominio di conoscenza. Tali primitive sono
*classi* e *relazioni* e tramite esse è possibile rappresentare diverse
situazioni che coinvolgono diverse entità/individui appartenenti alle classi.
L'insieme di primitive e di rappresentazioni di situazioni forma una *Knowledge
Base*, essa è quindi composta da:

* Componente Terminologica (ontologia): indipendente da una particolare
  situazione. Specifica i termini che rappresentano la formalizzazione del
  dominio. 
* Componente Asserzionale: riflette specifiche situazioni, rappresentate per
  mezzo dei termini dell'ontologia.

> La semantica riguarda il "ciò che è", il che coincide con ciò che riguarda le
> ontologie stesse.

## Design di Ontologie
Una buona parte del design di ontologie si concentra nel determinare se due
classi sono in relazione di sottoclasse tra di loro o meno. Un criterio per fare
ciò è l'*identity criteria*. Un criterio di identità sono le condizioni che
servono a stabilire l'uguaglianza di due entità. Ad esempio, una durata è uguale
ad un'altra se sono entrambe lunghe uguali, per cui il criterio di identità
sarà: *stessa lunghezza*. Se due classi non hanno lo stesso criterio di
identità, allora non possono essere in relazione di sottoclasse tra loro.

## Ontologie Fondazionali
Le ontologie fondazionali sono ontologie che catturano un insieme di distizioni
base valide in vari domini. Formalizzano in qualche senso la conoscenza di senso
comune, di base, sulla quale tutta la conoscenza più specifica si basa. Esistono
diverse ontologie fondazionali sviluppate in vari periodi come risultato di vari
sforzi di ricerca, quali DOLCE, SUMO e CYC.

DOLCE segue un approccio moltiplicativo, secondo il quale diverse entità possono
essere co-localizzate nello stesso istante di tempo e nello spazio. Questo
perchè ad esempio il vaso e la terracotta sono due istanze che sono
co-localizzate dallo stesso spazio-tempo, ma non sono la stessa cosa. 
DOLCE si basa su una distinzione fondamentale tra:

* *Enduranti* (entità): oggetti che esistono completamente nel tempo, cambiando
  proprietà nel tempo ma pur sempre mantenendo la propria identità. 
* *Perduranti* (eventi): oggetti che accadono, si svolgono o sviluppano nel
  tempo estendendosi accumulando diverse parti temporali.

In DOLCE la relazione principale tra enduranti e perduranti è quella di
*partecipazione*: un endurante *"vive"* nel tempo, partecipando in qualche
perdurante.
La cosa interessante è che i perduranti hanno una locazione temporale ben
definita, mentre la locazione spaziale no. Essa è appunto definita
indirettamente dalla locazione spaziale dei partecipanti. La stessa cosa succede
con gli enduranti, però con la locazione temporale.

Un'altra caratteristica principale di DOLCE sono le **qualità**, cioè delle
entità di base che possiamo percepire o misurare quali forme, colori, grandezze,
odori, ecc..
La differenza tra qualità e proprietà è che le prime sono particolari, legate
alle singole entità, mentre le seconde sono universali, cioè condivise da tutti
gli individui che fanno parte della stessa classe.
Da ciò ne segue che due individui non possono avere la stessa qualità.

Un'altra peculiarità di DOLCE è che si distingue tra le *qualità* (es. il colore
di una specifica rosa) e il loro *valore* (es. una particolare gradazione di
rosso). Quest'ultimo è detto *quale*, e descrive la posizione di una qualità
individuale all'interno di un certo spazio concettuale. Ad esempio, quando
diciamo che due rose hanno lo stesso colore, intendiamo che le loro qualità (che
sono distinte), hanno la stessa posizione all'interno dello spazio colori (che
in questo caso è lo spazio concettuale).
Questa differenza permette di rappresentare la relazione che esiste tra concetti
espressi come aggettivi e concetti espressi come nomi.

# Rappresentazioni Strutturate
La rappresentazione strutturata della conoscenza nasce dall'esigenza di
rappresentare la conoscenza del mondo in cui un sistema intelligente deve
operare. Per soddisfare questa esigenze, un sistema di rappresentazione
strutturata deve fornire:

* Un **linguaggio di rappresentazione**, che definisce le strutture sintattiche
  per la rappresentazione delle informazioni.
* Un **insieme di regole** di manipolazione delle struttura sintattiche in
  accordo con il loro significato.

Vediamo quindi alcuni sistemi di rappresentazione strutturata visti.

## Reti Semantiche
Sono una classe di sistemi di rappresentazione che adottano una struttura a
grafo (*rete*) in cui i *nodi* rappresentano *concetti*, mentre gli *archi*
rappresentano *proprietà* dei concetti.

L'istanza più semplice di questa classe di sistemi sono i *grafi relazionali*.
Essi permettono di descrivere le relazioni tra le diverse *entità* del grafo. In
questo grafo i diversi nodi rappresentano le *entità*, collegate tra loro da
*archi* etichettati in modo da esplicitare la *relazione* che intercorre tra le
due entità collegate. Dal punto di vista formale, i grafi relazionali
implementano un sottoinsieme del calcolo dei predicati del primo ordine: gli
archi rappresentano i *predicati*, e i nodi i *termini*.

La limitazione piu' grande di questa tipologia di rete semantia risiede
nell'espessivita'. Esse difatti sono in grado di rappresentare solamente l'idea
della congiunzione. Inoltre, le relazioni espresse dagi archi sono unicamente
binarie, per cui tutta una casse di predicati con arieta' > 2 devono essere
espressi per mezzo di un nodo intermedio che rappresenta il predicato.

Le *reti proposizionali* sono invece un'evoluzione rispetto ai grafi relazionali
perche' introducono la possibilita' di rappreesentaree intere proposizioni per
mezzo dei nodi. Queste reti sono piu' espressive dei grafi relazionali poiche'
e' possibiel introdurre i connettivi logici e dei contesti all'interno dei quali
fare operare i quantificatori. L'aumentata capacita' espressiva permette di
esprimere idee piuttosto articolate, ad esempio permette di distinguere la
negazione di un'intera proposizione dalla negazione di una proposizione
*incassata* all'inteno di una poposizione.
Inoltre, sapendo che la congiunzione e' implicita nella rete e avendo introdotto
la possibilita' di negare delle proposizioni, tramite De Morgan e' possibile
ottenere qualsiasi altro connettivo logico quale OR o AND.

Un concetto molto importante nelle reti semantiche e' anche la decisione di
quali informazioni devono essere rappresentate esplicitamente e quali devono
invece essere dedotte al momeento necessario. Per stabilirlo ci sono due
strategiee principali:

1. Relazione di Copertura: si rappresentano solo i legami essenziali che
   connettono ciascun nodo con la classe immediatamente superordinata. Ne
   risultano reti piu' efficienti dal punto di vista di memoria ma di meno dal
   punto di vista computazioinale in caso di inferenze.
2. Chiusura Transitiva: si rappresentano esplicitamentee tutti i possibili
   legami fra i nodi della rete. Piu' eefficiente in fase di inferenza, meno
   efficiente dal punto di vista di memoria. Inoltre e' difficile da mantenere
   una rete del genere.

Nella fase di design si deve optare per un tradeoff di questi due aspetti
fondamentali.

A prima vista, le reti semantiche introdurrebbero solamente un'ulteriore
macchinosita' nella rappresentazione, avendo pur sempre lo stesso potere
espressivo della logica. In realta', questo tipo di reti si presta molto bene a
rappresentare la conoscenza di tipo gerarchico. Le proprieta' vengono ereditate
dalle varie classi, rendendo il meccanismo di inferenza una semplice visita
della rete, senza dover applicare sofisticate regole.
Inolte, queste reti sono economiche nella rappresentazione perche' non bisogna
replicare ogni volta la stessa prroprieta' (se ereditata) per tutti i nodi ogni
volta.

Alcuni problemi noti delle reti semantiche sono:

* Ereditarieta' multipla: nel caso vi sia un conflitto di valori, non e'
  possiible stabilie un criterio risolutivo che abbia caratteere generale, tutto
  dipende dall'algoritmo di ricerca utilizzato. (es. Nixon Quacchero o
  Pacifista) Si puo' risolvere applicando il criterio della *dissonanza
  cognitiva*, in cui prevale il valore che riteniamo prevalente.
* Appartenenza e inclusione: non esiste la distinzione tra nodi che
  rappresentano individui e nodi che rappresentano *classi* o *insiemi di
  individui*
* Mancanza di una semantica formale: il significato di una rete deriva
  esclusivamente dalla natura delle procedure che la manipolano, per cui e'
  impossibile separare la semantica di una rete dal suo uso.

## Frame
Un'altro sistema di rappresentazione strutturata molto famoso sono i *frames*.
Introdotti da Minsky nel 1975, permettono di rappresentare della conoscenza
stereotipica riguardo a situazioni, luoghi, oggetti o personaggi. L'idea e' che
forniscano una *cornice concettuale* all'interno della quale i nuovi dati
vengono interpretati alla luce delle conoscenze derivate dall'esperienza
precedente.
L'organizzazione della conoscenza relativa ad un certo dominio permette di
facilitare sia il reperimento delle informazioni che i processi inferenziali
necessari ad agire in modo intelligente.
Cosi' come le reti semantiche, anche i frames mancano di una semantica formale,
per cui bisogna presupporre l'esistenza di adeguate procedure in grado di
estrarre le informazioni in essi contenute.

I sistemi a frame organizzano l conosccenze in strutture gerarchiche in cui gli
elementi sono collegati fra loro da espressioni di tipo `isA` o `ako`, che
consentono la trasmissione ereditaria dele proprieta'. Le proprieta' dei frame
che sono a livelo piu' alto nella gerarchia restano fisse, mentre i liveli piu'
bassi possono essere contraddistinti da proprieta' speecifiche, anche in
contrasto con quelle delle superclassi.

Ogni frame ha un nome che identifica univocamente l'oggetto che esso
rappreesenta. Le caratteristiche dei vari oggetti sono rappresentate per mezzo
di un insieme di slot: caselle in cui vengono inserite le informazioni. (es.
frame ristorante puo' avere slot relativi a categoria, indirizzo, giorno di
chiusura ecc..). Ogni slot puo' avere un valore di default che viene inserito in
caso non ci sia la possibilita' di riempire tale slot con valori specifici.
Gli slot possono inoltre avere come valore riferimenti ad altri frames.

Otre ala componente *dichiarativa*, i frames supportano anche una parte
*procedurale*, poiche' permettono ad esempio di calcolare i valori degli slot
per mezzo di procedure specifiche. Ci sono due tipologie principali di procedure
in tal senso:

* Procedure *if needed*: procedure che codificano metodi ad-hoc per il calcolo
  del valore di uno slot qualora sia richiesto dal processo di elaborazione in
  corso.
* Procedure *if added*: rimangono silenti fino a quando non si tenta di riempire
  qualche slot a cui sono associate.
