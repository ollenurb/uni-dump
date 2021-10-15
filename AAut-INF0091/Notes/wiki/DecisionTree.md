% Decision Tree

* E' essenzialmente un *[feature tree](FeatureTree.md)* ma con le labels
  attaccate alle foglie (nel caso della [classificazione](Classificazione.md)).
* Un decision tree (ma anche un feature tree) rappresenta un'espressione scritta
  in [forma normale disgiuntiva](DNF.md). Dal momento che ogni espressione
  logica puo' essere riscritta in DNF, i decision trees sono massimamente
  espressivi. Cio' significa che possono rappresentare perfettamente ogni
  dataset, posto che non esistano inconsistenze.  
* La troppa espressivita' puo' rappresentare un problema: supponiamo che esista
  un decision tree in cui ogni foglia copra esattamente un solo esempio
  positivo. Tale albero sara' completamente *overfitted*, cioe' adattato troppo
  ai dati ed incapace di generalizzare. Per introdurre un *[inductive
  bias](InductiveBias.md)*, si puo' limitare deliberatamente l'epressivita' del
  linguaggio indotto dai decision trees.  
* La costruzione di un *decision tree* tipicamente consiste nella creazione di
  un *feature tree* e di una trasformazione successiva nel corrispondente
  decision tree in base al task da svolgere. 
* Se si hanno $c$ classi e $l$ foglie in un feature tree, ci sono $c^l$
  possibili modi di etichettare le foglie dell'albero per trasformarlo in un
  decision tree.
 
> L'ordinamento crescente delle probabilita' empriche $\dot{p}$ nelle foglie di
un albero di decisione, corrisponde ad una curva *convessa* nel ROC plot con i
*dati di train*. Cio' permette di avere la $AUC$ piu' grande possibile.

* Dal punto di vista di coverage curve, aggiungere uno split consiste in due
  passaggi: 
      1. Dividere il segmento in due segmenti (che rappresentano i nodi figli)
      2. Riordinare i segmenti in base alla probabilita' empirica associata
  Possiamo inoltre vedere l'apprendimento come un iterazione di questi due
  passaggi, oppure come una seguenza di passi di split (1) per poi impiegare un
  re-ordering finale (2).
* Generalmente, all'aumentare del numero di foglie l'errore del modello
  diminuisce fino a raggiungere un punto minimo. Da quel punto in poi, se si
  continuano ad aumentare le foglie, si verifica l'overfitting del modello, per
  cui l'error rate aumenta.
* Il processo di ***pruning*** consiste nell'accorpare tutte le foglie
  appartenenti ad un *sottoalbero*
    * Utile in caso si voglia *"comunicare"* l'albero per cui la quantita' di
      dati/informazione e' importante
    * Perdita di performance in caso si voglia utilizzare per il task di
      *ranking/probability estimation*
    * Algoritmo *reduced-error pruning* serve a fare pruning su alberi di
      decisione. Richiede un altro dataset $P$ di pruning per poter stimare
      l'accuratezza dell'albero potato

## Ranking Trees
* Per ottenere un *ranking tree* a partire da un *feature tree*:
    1. Si calcolano le probabilita' empririche $\dot{p}$ associate alle foglie
    2. Si riordinano le foglie in base al valore della probabilita' empirica
       $\dot{p}$ associato alle stesse. 

## Classification Trees
* Per ottenere un *tree classifier* a partire da un *feature tree*:
    1. Si calcola un punto di operazione *(decision threshold)* nel coverage
       space, che e' l'intersezione tra i segmenti che rappresentano le foglie
       dell'albero e la curva isometrica con coefficiente angolare pari a
       $\frac{clr}{c}$, dove $clr=\frac{Pos}{Neg}$ e al *cost ratio* $c =
       \frac{c_{FN}}{c_{FP}}$ (rateo dei costi di missclassificazione, per
       esempio magari vogliamo punire di piu' i falsi positivi rispetto ai falsi
       negativi).
    2. Tutte i segmenti (*foglie*) a sinistra del punto saranno etichettate con
       la classe positiva, mentre i restanti a destra con la classe negativa.
* Alternativamente:
    1. Si calcola il *class ratio* di ogni *i-esima* foglia come
       $\frac{n_i^-}{n_i^+}$
    2. Se $\frac{n_i^-}{n_i^+} \cdot \frac{c_{FP}}{c_{FN}} > 1$, allora si
       assegna la classe a numeratore (negativa), poiche' il costo di
       missclassificazione e' piu' grande al denominatore
    * In questo modo, si tiene conto dei costi come se ogni esempio positivo
      fosse stato missclassificato come falso negativo e ogni esempio negativo
      come falso positivo.

## Probability estimation Trees
* Per ottenere un *probability-estimator tree* a partire da un *feature tree*: 
    1. Si calcola la probabilita' empririca di ogni foglia
    2. Si applica un [Laplace Smoothing](LaplaceSmoothing.md).
