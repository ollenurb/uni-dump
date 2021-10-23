\newpage
# Modelli ad Albero 
* I modelli ad albero in generale nel libro vengono descritti come *feature
  trees*. Questi alberi generali possono poi essere specializzati in diversi
  tipi di modello ad albero in base al task da risolvere quali:
    * Decision trees
    * Ranking trees
    * Probability estimation trees
    * Regression trees
    * Clustering trees
* Un modello ad albero e' anche un modo per rappresentare diversi persorsi
  all'interno dello spazio delle ipotesi, un persorso tra ipotesi in cui i passi
  sono di *generalizzazione* o *specializzazione*. La specializzazione si
  ottiene scendendo nell'albero verso le foglie (aggiungendo vincoli), mentre la
  generalizzazione si ottiene risalendo l'albero verso la radice (rimuovendo
  vincoli)
* I feature trees raggruppano lo spazio degli esempi, cioe' lo segmentano in in
  funzione ai concetti che rappresentano le foglie.
* Per trasformare un feature tree in un decision tree, si associa una label di
  classe nella foglia che rappresenta il concetto. In sostanza si associa una
  stima di classe da a tutti gli esempi coperti da quel concetto.
 
> Feature tree $\underbrace{\rightarrow}_{Labelling}$ Decision tree
 
* Alberi diversi possono rappresentare equivalenti concetti ma con forma
  differente. Perche'?
    * Espressioni logiche sintatticamente differenti possono essere
      semanticamente uguali
    * Siccome un albero rappresenta diversi concetti (che sono di fatto
      espressioni logiche), allora concludiamo il ragionamento.

> Gli alberi corrispondono ad espressioni logiche in forma normale disgiuntiva
(DNF)

* Problema della troppa espressivita': e' possibile costruire un decision tree
  che classifichi un qualunque training set con 0 errori. (Si fa costruendo un
  feature tree in cui le foglie coprono uno e un solo esempio del training set,
  questo ovviamente causa overfitting)
* Per evitare l'overfitting si possono introdurre due *bias induttivi*:
    * Diminuire l'espressivita' del linguaggio in fase di apprendimento
    * Utilizzare un modo differente per cercare lo spazio delle ipotesi,
      scoraggiando l'algoritmo ad appredere ipotesi (alberi) troppo complesse

## Feature tree
* Un feature tree e' un albero in cui ogni **nodo interno** e' etichettato con
  una **feature**. Ogni **diramazione** e' etichettata con un **letterale**
  (valore possibile della feature) 
* L'insieme dei letterali di un dato nodo interno e' chiamato **split**. Ogni
  nodo interno di un feature tree costituisce uno split, cioe' una segmentazione
  dello spazio degli esempi coperto dall'ipotesi
* Per costruire un *feature tree* a partire da un dataset:
    * Si costruisce un **nodo** per ogni feature possibile
    * Per ogni nodo si dipartono tanti rami quanti sono i valori possibili della
      feature corrispondente a quel nodo (es. variabile binaria = 2 rami)
    * Nelle foglie si annotano quante sono le istanze etichettate come
      *positive* e quante *negative* che hanno *valore = ramo* in riferimento
      alla feature del nodo padre
* Come detto in precedenza, sono un modo compatto per rappresentare diverse
  ipotesi all'interno dello spazio delle ipotesi, in cui ognnoni ipotesi e'
  rappresentata implicitamente da una foglia. L'ipotesi risultante e' la
  congiunzione dei vincoli sui letterali incontrati nel percorso dalla *foglia*
  alla *radice*

## L'algoritmo GrowTree
\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\SetKwInOut{Input}{Input}\SetKwInOut{Output}{Output}
\Input{Data $D$, the set of features $F$}
\Output{Feature tree $T$ with labelled leaves}
\BlankLine
\If{$Homogeneus(D)$} { \Return $Label(D)$\; }
$S \leftarrow BestSplit(D, F)$\;
split $D$ into subsets $D_i$ according to feature values in $S$\;
\For{each $i$}{
    \eIf{$D_i \neq \emptyset$}
    {$T_i \leftarrow GrowTree(D_i, F)$\;}
    {$T_i$ is a leaft labelled with $Label(D)$\;}
}
\Return a tree whose root is labelled with $S$ and whose children are $T_i$\;
\caption{GrowTree algorithm}
\end{algorithm} 

* L'algoritmo `GrowTree` e' la procedura di apprendimento piu' utilizzata dalla
  maggior parte dei tree learners. Segue un approccio *[divide and
  conquer](divide and conquer)* (segmentazione progressiva in modo ricorsivo) e
  *greedy* (sceglie sempre l'alternativa migliore alla riga 4, senza
  riconsiderarla mai).
* L'approccio greedy potrebbe portare ad una soluzione *sub-ottima*. Per
  risolvere il problema si potrebbero utilizzare algoritmi con forme di
  backtracking al costo di un maggior tempo di esecuzione e memoria
* `GrowTree` e' l'astrazione massima possibile, poiche' assume che alcune
  funzioni specifiche per la soluzione del task siano implementate . In questo
  modo e' possibile costruire modelli ad albero per diversi task, ma utilizzando
  lo stesso algoritmo per la fase di learning. Come si vede dall'algoritmo, le
  procedure sono:
    * `Label(D)`: ritorna l'etichetta piu' appropriata per etichettare tute le
      istanze del dataset $D$. Nel caso della classificazione potrebbe essere ad
      esempio la classe maggioritaria.
    * `Homogeneus(D)`: ritorna `true` se il dataset $D$ e' sufficientemente
      omogeneo. Anche qui, ogni task specifico ha il suo concetto di
      omogeneita'. Nella classificazione, potrebbe essere vero solo quando
      l'intero dataset ha istanze appartenenti ad una sola classe
    * `BestSplit(D, F)`: ritorna la *feature* che genera lo split migliore
 
## Decision Trees
* Introduciamo il criterio di *purezza*, con cui valuteremo gli split e le
  etichette da assegnare alle foglie per trasformare un feature tree in un
  decision tree.
* Supponiamo di avere a che fare con features booleane, per cui dato un dataset
  $D$, lo split risultante dividera' $D$ in $D_1$ e $D_2$
* Supponiamo inoltre che le classi disponibili per la classificazione siano 2
  (positiva e negativa)
* La ***purezza*** di una partizione $D$, costituita da $n^+$ esempi positivi e
  $n^-$ esempi negativi e' data dalla *probabilita' empirica*
  $$
  \dot{p} = \frac{n^+}{n^+ + n^-}
  $$
* Purezza massima: $0$ oppure $1$, che indica la presenza di soli positivi o
  soli negativi
* Avendo ora una nozione di purezza, possiamo introdurre delle misure per
  calcolare l'***impurezza*** di una partizione:
    * **Minority class**: ($min\{\dot{p}, 1-\dot{p}\}$) rappresenta la
      probabilita' di fare un errore in caso sia stata scelta la classe
      maggioritaria come label
    * **Gini Index**: ($2\dot{p}(1-\dot{p})$) rappresenta la probabilita' di
      fare un errore in caso siano state assegnate randomicamente le labels alle
      istanze, ma campionandole dalla distribuzione delle classi originaria
    * **Entropy**: ($-\dot{p} \cdot \log_2(\dot{p}) - (1-\dot{p}) \cdot
      \log_2(1-\dot{p})$) e' l'*informazione* attesa. Piu' e' pura la
      partizione, minore sara' l'informazione attesa.
* Si noti che l'impurezza' deve essere uguale nel caso si scambiassero le classi
  (positivi con negativi e viceversa). Inoltre deve essere pari a 0 quando
  $\dot{p} = 0,1$ e raggiungere il massimo in $\frac{1}{2}$.
* L'impurezza' **attesa** di uno split $D \rightarrow \{D_1, \dots, D_l\}$ e'
  data dalla media delle impurezza' di ogni singolo sottoinsieme $D_j$:
  $$
  Imp(\{D_1, \dots, D_l\}) = \sum_{j = 1}^l \frac{| \; D_j \; |}{| \; D \;
  |}Imp(D_j)
  $$
  dove il rapporto $\frac{| \; D_j \; |}{| \; D \; |}$ rappresenta la
  probabilita' che un esempio preso dalla partizione $D$ "ricada" nella
  partizione $D_j$.
* Purity Gain: Immaginiamo che il dataset $D$ venga splittato in $\{D_1, \dots,
  D_l\}$ dalla feature $f$. Con purity gain intendiamo la quantita' 
  $$
  Imp(D) - Imp(\{D_1, \dots, D_l\})
  $$
  che concettualmente indica il *gain in purezza* che si avrebbe se si
  includesse $f$ come feature di split.
* Questo concetto di impurezza, viene utilizzato quindi dall'algoritmo
  `BestSplit` per calcolare lo split che minimizza l'incertezza 

\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\SetKwInOut{Input}{Input}\SetKwInOut{Output}{Output}
\Input{Data $D$, the set of features $F$}
\Output{Feature $f$ to split on}
\BlankLine
$I_{min} \leftarrow 1$ \;
\For{each $f \in F$}{
    \If{$Imp(\{ D_1, \dots, D_l \}) < I_{min}$}
    { 
    $I_{min} \leftarrow Imp(\{ D_1, \dots, D_l \})$\;
    $f_{best} \leftarrow f$\;
    }
}
\Return $f_{best}$\;
\caption{BestSplit algorithm}
\end{algorithm} 

### Entropia
* L'entropia e' una misura che quantifica la quantita' di confusione di un certo
  evento, ed e' misurata in ***bits***
* Se un esperimento ha $n$ possibili outcome (equiprobabili), e' possibile
  rappresentare ogni outcome possibile mediante $b = \left \lceil log_2 \: n
  \right \rceil$ bits di informazione
* Per fare un'esempio, supponiamo di lanciare un dado a 6 facce:
    * Per rappresentare l'outcome si utilizzano $b = \left \lceil log_2 \: 6
      \right \rceil = \left \lceil 2.58 \right \rceil = 3$ bits di informazione
    * Supponiamo ora di trovare un "*suboutcome*", cioe' una quantita' di
      informazione minore ma dipendente comunque dall'outcome finale, ad
      esempio, la ***parita'*** del risultato del lancio
    * Per rappresentare la parita', sarebbero necessari $b_1 = \left \lceil
      log_2 \: 2 \right \rceil  = 1$ bits.
    * Dopo il lancio, se abbiamo l'informazione sulla parita', si riduce la
      *quantita' di confusione* rispetto all'evento, per cui avremmo gia' $b_1$
      bits di informazione su $b$. La differenza $b - b_1$ quantifica quanta
      informazione rimane da comunicare per sapere l'intero outcome 
* Questo e' cio' che capita anche quando vogliamo utilizzare l'entropia per
  scegliere gli split migliori:
    * Il dataset iniziale ha una certa quantita' di confusione, che dipende da
      come e' distribuita l'etichetta nel training set
    * Dopo che viene fatto lo split, il dataset e' diviso in diverse partizioni,
      ciascuna con una certa confusione associata (sempre legata a come
      l'etichetta di classe e' distribuita all'interno della partizione)
    * Un buono split ci permette di *guadagnare* parte dell'informazione,
      riducendo l'incertezza iniziale (quella del nodo padre)
* Se un evento $E$ ha probabilita' $p$ di accadere, allora l'informazione
  ottenuta se osserviamo l'evento e':
  $$
  I(E) = log_2(\frac{1}{p}) = -log_2 \: p
  $$
  * Se un evento e' altamente probabile $p \approx 1$, allora $I(E) \rightarrow
    0$
  * Se un evento e' improbabile $p \approx 0$, allora $I(E) \rightarrow 1$
  * L'idea e': immagina di lanciare ripetutamente una moneta truccata con $P(T)
    = 0.9$. Quanto saresti ancora sorpreso se dopo 10 lanci in cui e' uscito
    solo testa, uscisse ancora $T$?
* Se un esperimento ha $n$ possibili outcomes $E_1, \dots, E_n$, ognuno con
  probabilita' $p_1, \dots, p_n$, allora la quantita' media di informazione
  ottenuta quando osserviamo un generico outcome e' l'*informazione attesa* o
  *entropia*
  $$
  H(E) = \sum^n_{i=1} p_i \cdot \log_2(\frac{1}{p_i}) = - \sum^n_{i=1} p_i \cdot
  log_2(p_i)
  $$
* E' la somma delle probabilita' di accadere degli eventi $i$ esimi per la loro
  rispettiva quantita' di informazione attesa

## Alberi di decisione e coverage plot
* Ciascun nodo (interno ed esterno) in un albero di decisione corrisponde ad un
  ipotesi fatta nello spazio degli esempi. Analogamente, corrisponde anche ad un
  segmento nello spazio del coverage plot, in cui:
    * I segmenti verticali corrispondono ai nodi ***puri***, con $\dot{p} = 1$
    * I segmenti orizzontali corrispondono ai nodi con $\dot{p} = 0$ (composti
      da soli esempi della classe negativa)
    * I segmenti in diagonale corrispondono ai nodi ***massimamente impuri***
      (coprono la sessa quantita' di esempi positivi e negativi)
 
> L'ordine dei segmenti all'interno del coverage plot non dipende dalla
struttura dell'albero ma dalla probabilita' empirica dei nodi corrispondenti

* Nella fase di apprendimento, mano a mano che si aggiungono split, i segmenti
  si spostano sempre piu' in alto verso il ROC heaven (cioe' il piunto con AUC
  massimo), fino ad arrivare a concidere con esso. Cio' significa che tutti gli
  esempi positivi (del training set) sono coperti dall'albero.

## Ranking Trees
* Come gia' detto, i modelli ad albero dividono lo spazio degli esempi in
  segmenti (o partizioni)
* Se ordiniamo le foglie di un feature tree, e' possibile ottenere un ranking
* Dal momento che si conosce la distribuzione delle classi all'interno del
  singolo segmento, si pososno ordinare secondo l'*empirical probability* della
  foglia
* In caso di foglie con pari merito, si da' la precedenza a quelle che coprono
  un numero maggiore di esempi
* L'ordinamento predilige le foglie piu' adatte a coprire piu' esempi positivi
  andando via via verso quelle piu' adatte a coprire esempi negativi
 
> *I ranking trees ottenuti mediante l'ordinamento delle foglie del feature tree
secondo empirical probability, produce sempre una curva convessa nel ROC plot
sui dati di train*

* La citazione e' dimostrabile nel modo seguente:
    * La pendenza di un segmento e' data dal rapporto
      $\frac{\dot{p}}{(1-\dot{p})}$. 
    * Al crescere di $\dot{p}$ si ottiene una trasformazione monotona, poiche'
      se scelgo $\dot{p'} > \dot{p}$, allora anche la pendenza
      $\frac{\dot{p'}}{(1-\dot{p'})} > \frac{\dot{p}}{(1-\dot{p})}$  
    * Quindi, un *ordinamento decrescente delle probabilita' empiriche* causa un
      *ordinamento decescente delle pendenze*, di fatto generando una curva
      *convessa*

* La crescita di un albero man mano che l'apprendimento sul dataset progredisce
  puo' essere visto in termini di coverage plot come l'iterazione dei due
  passaggi seguenti: (o alternativamente, l'esecuzione di una sequenza del primo
  passaggio per un'esecuzione finale del secondo)
    1. Aggiungi uno split nel coverage plot. Questo dividera' il/i segmento/i
       piu' grandi (padri)
    2. Riodina i segmenti secondo probabilita' empirica associata crescente

## Labelling di un feature tree 
* Etichettare un albero consiste nell'apporre delle etichette di classe nei nodi
  foglia
* Se noi abbiamo $c$ classi e $l$ foglie in un albero, ci sono $c^l$ modi
  possibili di etichettare le foglie 
* In un albero con $l$ foglie, ci sono $l!$ possibili *ordinamenti* dei segmenti
  corrispondenti alle foglie nel coverage space
* Tipicamente per etichettare una foglia generica si utilizza il criterio della
  classe di maggioranza. Questo criterio semplicistico nasconde pero' un
  problema: non tiene conto dei differenti costi a fronte di un errata
  missclassificazione. 
* Spesso si vuole ottenere un labelling basato su dei costi di
  missclassificazione specifici al dominio di riferimento. Ad esempio,
  supponiamo di voler rilevare la presenza di una data malattia potenzialmente
  grave. Chiaramente, il costo di missclassificazione come falso negativo e'
  piu' grande di un costo di missclassificazione come falso positivo poiche' il
  costo di una vita umana e' piu' grande del costo economico di ulteriori test.
* $c=\frac{c_{FN}}{c_{FP}}$ denota il *cost ratio*, cioe' il rapporto tra costo
  di *missclassificazione dei positivi* e il costo di *missclassificazione dei
  negativi*
  * Quando $c > 1$, significa che costano piu' gli errori sui positivi che gli
    errori sui negativi. Il modello in questo modo, cerchera' di commettere meno
    errori sui positivi rispetto ai negativi.
  * Viceversa, quando $c < 1$ costano di piu' gli errori sui negativi rispetto
    ai psoitivi
  * Quando invece $c = 1$, i costi sono uguali.

> *Quando $c > 1$, il modello andra' ad assegnare la classe positiva ad un
maggior numero di foglie rispetto all'assegnamento della classe maggioritaria,
anche nelle foglie con un maggior numero di negativi.  L'inverso succede invece
quando $c < 1$, cioe' la classe negativa viene assegnata ad un maggior numero di
foglie rispetto all'assegnamento con il criterio della classe maggioritaria*

* L'ordine parte da tutte classi negative, e man mano che il *cost-ratio* cresce
  le etichette passano da negative a positive, arrivando infine alla stessa
  classificazione che si avrebbe se fossero state assegnate mediante *empirical
  probability*

## Trasformazione da feature tree a modello
* Come detto in precedenza, un feature tree puo' essere trasformato in un
  qualsiasi modello ad albero per la soluzione di uno specifico task.
* E' possibile sfruttare la distribuzione delle classi nelle foglie per
  ottenere:
  1. Un **ranker**: ordinando in modo crescente i segmenti foglia in base alla
     loro empirical probability, calcolate sul training set
  2. Un **probability estimator**: applicando una stima di probabilita' ad ogni
     foglia calcolata mediante *Laplace* oppure *m-smoothing*
  3. Un **classificatore**: scegliendo il *punto di operazione ottimale*
     (decision threshold) come l'intersezione della curva del classificatore nel
     *ROC plot* e la curva con coefficiente angolare pari a $\frac{1}{c \cdot
     clr}$. Come risultato, le foglie associate ai segmenti doppo il punto di
     operazione predirranno positivi, mentre le rimanenti negativi.
* Ovviamente esiste un altro metodo piu' semplice per scegliere la classe senza
  dover effettuare una costruzione geometrica:
    1. Nella foglia *i-esima* calcoliamo il prodotto $\frac{n_i^-}{n_i^+} \cdot
       \frac{c_{FP}}{c_{FN}}$. In questo modo si tiene conto degli errori di
       missclassificazione come se ogni esempio positivo e ogni esempio negativo
       venisse missclassificato. 
    2. Col risultato del prodotto calcolato al passo 1, utilizziamo il criterio
       della classe di maggioranza. Se $>1$ allora assegnamo la label della
       classe a numeratore, altrimenti quella a denominatore.

## Semplificazione di alberi 
* Un aspetto importante dei modelli predittivi (e quindi anche dei modelli ad
  albero), e' che e' dimostrato che l'aumentare della complessita' del modello
  (numero di nodi), l'errore del modello sul *test set* e sul *training set*
  tende a diminuire fino ad una certa soglia.
* Da questa soglia in poi, l'aumentare del numero di nodi fa diminuire l'errore
  solamente sul *training set*, mentre l'errore sul *test set* continua a
  crescere. Questa situazione e' gia' stata vista e rappresenta l'*overfitting*
  del modello.
* Ci sono diversi modi per diminuire la complessita' dei modelli e evitare cosi'
  il conseguente overfitting.
 
### Pruning
* E' possibile applicare una fase di postprocessing di potatura chiamata pruning
* Puo' essere effettuato dopo il labelling, in caso i figli dello stesso padre
  predicano predicano la stessa classe, si considererebbe solo il nodo padre. In
  questo caso, e' particolarmente utile in casi in cui si voglia trasmettere il
  modello (siccome pesa meno) o se lo si voglia leggere. Il problema e' che
  peggiora la precisione del modello, al momento che l'*AUC* risultante e'
  minore. 
* Alternativamente puo' essere impiegato un passaggio dell'algoritmo di
  *post-processing* `PruneTree`.
* L'algoritmo utilizza un dataset separato (*pruning set*) per testare se la
  precisione del modello semplificato (output dell'algoritmo) e' maggiore di
  quello precedente 
 
\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\SetKwInOut{Input}{Input}\SetKwInOut{Output}{Output}
\Input{Labelled data $D$, decision tree $T$}
\Output{Pruned tree $T'$}
\BlankLine
\For{every internal node $N$ of $T$, starting from the bottom}{
    $T_N \leftarrow$ subtree of $T$ rooted at $N$ \;
    $D_N \leftarrow \{ x \in D \; | \; x \;\text{is covered by} \; N\}$ \;
    \If{accuracy of $T_N$ over $D_N$ is worse than majority class in $D_N$}
    { 
    replace $T_N$ in $T$ by a leaf labelled with the majority class in $D_N$\;
    }
}
\Return pruned version of $T$\;
\caption{PruneTree(T, D) algorithm - reduce-error pruning of a decision tree}
\end{algorithm} 

### Stima degli errori di generalizzazione
* Alternativa alla fase di post processing discussa in precedenza (`PruneTree`)
  che diversamente e' impiegata durante la fase di apprendimento
* Si associa un valore $k$ ad ogni foglia. Se la foglia non diminuisce l'errore
  del padre di almeno $k+g$, allora non viene creata a priori. 
  In altri termini significa che non viene creata la foglia se la
  classificazione rispetto al nodo padre non migliora di almeno $g$ istanze.
* $E_{tot} = \sum^N_{i=1} e_i + N \cdot g$ (errore di generalizzazione)

## Sensitivita' rispetto alla distribuzione delle classi 
> I criteri di impurezza del *Gini index* e quello dell'*entropia attesa*,
  sono sensibili ai cambiamenti nella distribuzione delle classi, mentre
  $\sqrt{Gini}$ non lo e'.
  
* Se si volessero inoltre includere i costi nel criterio di splitting, si
  potrebbe decidere di introdurre delle *copie* di esempi positivi/negativi
  all'interno del train set.
  * Supponiamo ad esempio che i costi sui positivi siano 10 volte piu' costosi
    della controparte negativa
  * E' possibile *inflazionare* il dataset di train inserendo per ogni esempio
    positivo 10 copie dello stesso
* Il metodo dell'inflazione rappresenta un'*alternativa* per includere il
  *cost-ratio* rispetto al metodo discusso in precedenza (per determinare le
  condizioni operative del modello)
* L'inflazione del dataset aumenta i tempi di training

## Apprendimento di alberi come riduzione della varianza
* Quando si parla di predizione di una classe, lo scopo e' quello di predirre
  una variabile Booleana (*Bernoulli*) incerta che ha una certa probabilita' di
  accadere $\dot{p}$
* L'apprendimento di un albero consiste nella minimizzazione di una funzione
  obiettivo, rappresentata dalla varianza di tale variabile pari a $(1-\dot{p})$
* Possiamo definire negli stessi termini un problema di ***regressione***, in
  cui la varianza e' calcolata come
  $$
  Var(Y) = \frac{1}{|Y|}\sum_{y \in Y} (y - \overline{y})^2
  $$

### Regression trees
* Negli alberi di regressione le variabili target son ocontinue e non discrete
  come visto fino ad ora
* Per apprendere un feature tree che verra' utilizzato per il task di
  regressione, si devono apporre delle modifiche alle procedure gia' viste per
  l'agoritmo `GrowTree`:
    * Si utilizza al posto della misura di impurita' $Imp(Y)$ la varianza
      $Var(Y)$ nell'algoritmo `BestSplit`
    * La funzione `Label(Y)` ritorna il valor medio di tutti i valori nella
      foglia $Y$
    * La funzione `Homogeneus(Y)` ritorna `true` se la *varianza* della foglia
      $Y$ e' al di sotto di un certo limite (*threshold*)
* Gli alberi di regressione sono piu' suscettibili all'overfitting dal momento
  che le foglie conterranno molti meno esempi 
 
### Clustering trees
* Introduciamo una funzione $dis: X \times X \rightarrow \mathbb{R}$ che indica,
  data una *coppia* di istanze nello spazio degli esempi la loro
  *dissimilarita'*
* La nozione di dissimilarita' puo' essere estesa ad un intero set $D$:
  $$  
  Dis(D) = \frac{1}{|D^2|} \sum_{x_1 \in D} \sum_{x_2 \in D} dis(x_1, x_2)
  $$
* $Dis(D)$ puo' essere quindi utilizzata come indice di impurezza nell'algoritmo
  `BestSplit`. Piu' bassa e' la dissimilarita' di un dataset $D_j$ migliore
  sara' il cluster delle istanze $D$.
* La dissimilarita' di uno split e' data dalla media pesata di ogni split
  *j-esimo*
  $$
  Dis(\{ D_1, \dots, D_l \}) = \frac{|D_j|}{|D|} Dis(D_j)
  $$
  (*probabilita' di passare dal nodo padre al nodo j-esimo moltiplicata per la
  dissimilarita' dello split j-esimo*)
* La dissimilarita' $dis(x_1, x_2)$ puo' essere calcolata mediante distanza
  euclidea: se l'istanza e' espressa solo in termini di features numeriche, si
  puo' definire come 
  $$
  dis(\vec{x_1}, \vec{x_2}) = (\vec{x_1} - \vec{x_2})^2 = \sum^d_{j=1} [x_{1j} -
  x_{2j}]^2
  $$
* E' dimostrabile sostituendo la formula di $dis(x_1, x_2)$ all'interno di
  $Dis(D)$ che $Dis(D) = 2 \cdot Var(D)$
* Gli split quindi diminuiscono la varianza rispetto alle features di valori
  numerici. Ogni split avra' quindi sempre varianza minore del padre.
* I clusters molto piccoli avranno una dissimilarita' molto piccola, per cui
  sarebbe necessario un *pruning* di tali nodi per evitare un overfitting
* I clusters composti invece da singole istanze, dovrebbero essere ignorati
  quando viene calcolata la dissimilarita' di uno split, poiche' ritornano la
  dissimilarita' piu' ottimistica possibile ($0$)

### Coesione e Separazione di Clusters 
* La varianza di una dataset $D$ (e conseguentemente la sua dissimilarita') son
  costanti
* Consideriamo $k$ cluster $(D_1, \dots, D_k)$ di $D$
* Il centroide complessivo del dataset e' definito come
  $$
  \vec{c} = \frac{1}{|D|} \sum_{\vec{x} \in D \vec{x}}
  $$

* Possiamo definire diverse quantita':
    * **TSSE** = (*Total Sum of Squared Errors*)
      $$
      TSSE = \sum_{\vec{x} \in D} (\vec{x} - \vec{c})^2 = |D| \cdot Var(D) =
      \frac{|D|}{2} Dis(D)
      $$
    * WSSE = (*Within Sum of Square Errors*) - Indica quanto i clusters sono
      coesi, ottenuta calcolando quanto le istanze si discostano dal
      ***centroide interno***, cioe' l'istanza che piu' si avvicina alla media.
      (il centroide *i-esimo* e' il centroide calcolato rispetto al cluster
      *i-esimo*).
      $$
      WSSE = \sum_{i=1}^k \sum_{\vec{x} \in D_i} (\vec{x} - \vec{c_i})^2
      $$
    * BSSE = (*Between Sum of Square Errors*) - Indica quanto i clusters sono
      separati tra di loro, ottenuta calcolando quanto i centroidi interni
      dei singoli clusters si discostano dal centroide complessivo (quello
      dell'intero dataset $D$)
      $$
      BSSE = \sum_{i = 1}^k |D_i| (\vec{c_i} - \vec{c})^2
      $$
* E' possibile derivare che $TSSE = WSSE + BSSE$, per cui quello che si vuole
  ottenere e':
    * Una minimizzazione del termine $WSSE$, siccome si vuole che le istanze di
      un cluster siano il *piu' coese possibile* tra loro
    * Una massimizzazione del termine $BSSE$, siccome si vuole che le istanze di
      un cluster siano il *piu' separate possibile* dalle istanze degli altri
      clusters
