# Motif Finding

* In generale, il problema del motif finding e' simile ad un problema di pattern matching, con la
  differenza che il pattern non e' conosciuto a priori
* Un'altra grande differenza e' che i *motifs* possono presentare delle mutazioni, per cui anche se
  si conoscesse il pattern (motifs) da cercare, impiegare algoritmi di pattern matching sarebbe
  inutile (perche' non si troverebbero tutti i motifs con almeno una mutazione)
* Piu' formalmente, possiamo dire che un $(n, k)$ motif e' un pattern di lunghezza $n$ che appare
  con $k$ mismatches all'interno della sequenza di DNA
* L'obiettivo del motif finding e' ritrovare il pattern $P$ (motif) all'interno della sequenza di
  DNA, data la sua lunghezza e il numero di mutazioni ($(n, k)$)
* Considerando un motif $(15,4)$, prendendo due istanze del pattern qualsiasi $P_i, P_j$, e'
  possibile che possano differire al piu' di $4+4=8$ mutazioni
* Motifs Logos: E' un modo di rappresentare quanto sono probabili le mutazioni all'interno del motif
* I motifs sono molto importanti perche' corrispondono ai cosiddetti (*Transcription Factors Binding
  Sites*), cioe' opportune sezioni a monte del gene che ne regolano la silenziazione, il
  potenziamento e la trascrizione
* In generale, l'identificazione di motifs presenta diverse sfide di non facile risoluzione:
    * Non si a priori la sequenza di caratteri che compone un motif
    * Non si sa dove il motif e' localizzato all'interno del gene
    * Da un gene all'altro un motif puo' differire (come detto puo' avere delle mutazioni)
    * E' difficile distinguere un motif che effettivamente ha una funzione di regolazione da una
      sequenza di un motif casuale che non ha nessuna correlazione con i geni

## The Gold Bug's Problem

* Il problema del motif finding e' simile al problema posto da Edgar Allan Poe nel suo breve
  raccondo The Gold Bug's Problem
* Il succo e' che nella storia c'e' un mittente che codifica un messaggio e lo manda ad un
  destinatario. L'idea e' che quando il destinatario riceve il messaggio, dovra' decifrarlo,
  cercando di capire cosa c'e' scritto dentro
* Ci sono pero' diverse assunzioni che si possono fare per poter decifrare il messaggio, che in
  qualche modo si legano al problema del motif finding nel DNA:
    * Il messaggio e' codificato in lingua Inglese
    * Ad ogni simbolo corrisponde una lettera dell'alfabeto Inglese
    * Nessuna lettera corrisponde a piu' di un simbolo
    * I segni di punteggiatura non sono codificati
* Un approccio molto semplice (quasi banale) e' quello di contare il numero di occorrenze dei
  simboli all'interno del messaggio. Nello stesso modo si puo' contare la frequenza dei simboli
  delle parole inglesi. Successivamente si ordinano entrambe le liste di simboli e lettere in modo
  decrescente per frequenza, ottenendo quindi una mappa simbolo -> lettera. Questo approccio si
  rivela pero' molto scadente
* (*l-tuple count*) Un approccio alternativo potrebbe essere quello di calcolare le frequenze di
  coppie oppure terne di simboli al posto dei singoli caratteri. Una volta trovata l'occorrenza con
  la frequenza piu' alta, si vanno a sostituire tutte le occorrenze dei simboli nel testo. A questo
  punto si possono fare delle inferenze che man mano portano a decifrare l'intero testo.
* Ovviamente per poter risolvere il problema sono necessari due prerequisiti:
    1. La frequenza delle tuple-terne di lettere di tutte le parole in Inglese devono essere
       conosciute
    2. Tutte le parole della lingua Inglese devono essere conosciute
* Come detto, ci sono diverse similarita' rispetto al motif finding problem:
    * I nucleotidi nel motifs codificano un messaggio nel linguaggio "genetico" = simboli nel golden
      bug problem codificano un messaggio nella lingua inglese
    * Per poter risolvere il problma si puo' analizzare la frequenza dei pattern nelle sequenze
      nucleotidiche = per poter risolvere il problma si puo' analizzare la frequenza dei pattern nel
      testo codificato 
    * E' necessaria una conoscenza di motifs regolatori gia' scoperti = e' necessaria la conoscenza
      delle parole in inglese
* Il motif finding e' pero' di piu' difficile risoluzione:
    1. Non si ha un dizionario completo dei motifs
    2. Il linguaggio "genetico" non ha una "grammatica" standard
    3. Solo una frazione molto piccola delle sequenze nucleotidiche codifica effettivamente il motif

## Approccio iniziale alla soluzione

* Siccome il problema di motif finding e' molto difficile, iniziamo a introdurre una restrizione
  sulla lunghezza del pattern in modo da facilitare il problema. Inoltre supponiamo che lo stesso
  motifs non si presenti esattamente nello stesso modo in ogni sequenza
* Definizione dei parametri:
    * $t$ numero di sequenze di DNA
    * $n$ lunghezza di ogni sequeza di DNA
    * $DNA$ insieme complessivo delle sequenze di dna (matrice bidimensionale $t \times n$)
    * $l$ lunghezza del motif (*l-mer*)
    * $s = (s_1, s_2, s_3, \dots, s_t)$ array delle posizioni iniziali dei motifs 
* $s = (s_1, s_2, s_3, \dots, s_t)$ indica l'indice in cui inizia il motif $s$ all'interno della
  sequenza $1, 2, .., t$ 
* Supponiamo di sapere $s$, allora possiamo allineare ogni motif all'interno delle sequenze e
  calcolare la cosiddetta matrice di profilo, che contiene la frequenza di ogni nucleotide per ogni
  colonna. 
* Infine, si costruisce la stringa di consenso con i nucleotidi con frequenza maggiore. Tale stringa
  puo' essere considerata come una stringa "antenata" dalle quale sono emerse altre istanze mutate
  dello stesso motif
* Per calcolare uno score sulla stringa di consenso, si considera la seguente funzione di scoring:
$$
score(s,DNA) = \sum_{i=1,k \in \{A,C,G,T\}}^{l} count(k, i)
$$
* Dove $count(k, i)$ rappresenta la frequenza del nucleotide $k$ nel motif
* Fino ad ora abbiamo supposto che le posizioni iniziali $s$ siano conosciute a priori, ma nel caso
  reale non lo sono
* Possiamo quindi formalizzare il problema del motif finding come un problema di massimizzazione:
    * **Goal**: Dato un insieme di sequenze di DNA, trova un insieme di $t$ *l-mers* per ogni
      sequenza, che massimizzino la funzione score
    * **Input**: Una matrice $t \time n$ di $DNA$ e $l$, la lunghezza del pattern da trovare 
    * **Output**: Un array di $t$ posizioni che indicano l'inizio di ogni motif nella sequenza
      *i-esima*, che massimizzano la funzione score

## Metodo Brute Force

* Un approccio molto semplice potrebbe essere l'approccio brute force, computando ogni possibile
  combinazione delle posizioni iniziali $s$
* L'obiettivo e' quello di massimizzare $score(s, DNA)$ variando le posizioni iniziali $s_i$ dove:
$$
s_i = [1, \dots, n-l+1], \; 
i = [1, \dots, t]
$$
* Il problema di questo metodo e' che per ogni sequenza $t$ combina $n-l+1$ posizioni, cio'
  significa che vengono considerati $(n-l+1)^t$. Per ogni set di posizioni, la funzione di score
  richiede $l$ operazioni, per cui la complessita' dell'algoritmo e' di $O(ln^t)$.
* L'algoritmo brute force puo' essere applicato solo in istanze molto molto piccole

## Problema della stringa mediana

* Dato un insieme di $t$ sequenze di DNA, trova il pattern che compare in tutte le $t$ sequenze con
  il numero minimo di mutazioni
* Al posto di provare variando le posizioni iniziali e provare a trovare una stringa consenso che
  rappresenti il motif, si possono variare invece tutti i possibili motifs direttamente
* Distanza di Hamming: Date due stringhe $v$ e $w$, $d_H(v, w)$ e' il numero di coppie di nucleotidi
  che non fanno match quando $v$ e $w$ vengono allineate
* Per ogni sequenza di DNA $i$, computa ogni $d_H(v, x)$ dove $x$ e' un *l-mer* con posizione
  iniziale $s_i$ e $v$ e' la sequenza di motif
* Una volta calcolate le corrispondenti distanze di Hamming, considera il minimo di tutte queste
  distanze
* E' possibile poi considerare la distanza totale, che e' la somma di tutte le distanze minime per
  ogni sequenza
* E' possibile quindi formulare un algoritmo per trovare la stringa mediana:
    * **Goal**: Dato un insieme di sequenze di DNA, trova la stringa mediana
    * **Input**: Una matrice $n \times n$ di DNA, e $l$, la lunghezza della stringa
    * **Output**: Una stringa mediana, cioe' una stringa $v$ di lunghezza $l$ che minimizzi la
      distanza totale su tutte le stringhe di lunghezza $l$

```
MedianStringSearch(DNA, t, n, l)
bestWord <- AAA..AA
bestDistance <- INFTY
    for each l-mer v from AAA..AA to TTT..TT
        if TotalDistance(v, DNA) < bestDistance
            bestDistance <- TotalDistance(v, DNA)
            bestWord <- v
return bestWord
```

* Il motif finding problem e' equivalente al problema della stringa mediana
* E' possibile dimostrare che *minimizzare* la distanza totale e' equivalente a *massimizzare* lo
  score:
    * Per ogni colonna della matrice di profilo $i$, vale la seguente relazione $Score_i +
      TotalDistance_i = t$
    * Siccome ci sono $l$ colonne (tante quante la lunghezza del motif), vale anche
      $Score + TotalDistance = l * t \rightarrow Score = l * t - TotalDistance$
    * Dal momento che $l$ e $t$ sono costanti, minimizzare la distanza totale equivale a
      massimizzare lo score 
* Il problema della stringa mediana deve esaminare solamente $4^t$ ($|\Sigma|^t$) combinazioni di
  $v$, per cui e' leggermente piu' efficiente della soluzione brute force
* Per aumentare l'efficienza dell'algoritmo, si puo' pensare di ridurre lo spazio di ricerca,
  evitando di considerare alcune sequenze *l-mer*
* L'idea e' quella di rappresentare le sequenze non piu' come sequenze di caratteri ma come sequenze
  di numeri, applicando la seguente trasformazione: $A = 1, C = 2, G = 3, T = 4$
* In questo modo per passare alla prossima stringa da considerare basta aumentare di 1 il numero
  della sequenza
  

