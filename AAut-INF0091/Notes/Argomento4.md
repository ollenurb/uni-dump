# Decision Trees

## Introduzione Generale
* Sono stati visti concettualmente i **feature trees** e i **decision trees**
* Per costruire un *feature tree* a partire da un dataset:
    * Si costruisce un **nodo** per ogni feature possibile
    * Per ogni nodo si dipartono tanti rami quanti sono i valori possibili della
      feature corrispondente a quel nodo (es. variabile binaria = 2 rami)
    * Nelle foglie si annotano quante sono le istanze etichettate come
      *positive* e quante *negative* che hanno *valore = ramo* in riferimento
      alla feature del nodo padre
* La regola dei rami che si dipartono per ogni valore possibile non e' stretta
  poiche' alcuni rami possono essere anche "fusi" tra loro imponendo
  implicitamente una congiunzione
* Ogni foglia all'interno di un feature tree rappresenta un'espressione logica
  (ipotesi) in cui vincoli sono in *congiunzione* tra di loro. Per questa
  ragione, puo' essere visto anche come una congiunzione di espressioni logiche
  congiuntive. 
* Le ipotesi restringono lo spazio degli esempi in sottoinsiemi, chiamati
  *segmenti*.
* Ancora, in altri termini, possiamo vedere l'intero spazio espresso come
  congiunzione delle *espressioni logiche* che rappresentano i *segmenti* dello
  spazio.
* Un *feature tree* puo' essere trasformato in un *decision tree*, prendendo
  ogni foglia e associando il labelling positivo/negativo se il segmento e'
  identificato maggiormente da istanze positive/negative

> Decision trees are strictly more expressive than conjunctive concepts

* Side effect della citazione sopra: supponiamo di costruire un *decision tree*
  in cui ogni segmento e' rappresentato da un solo esempio. (ogni foglia ha un
  solo esempio positivo) Allora quello che avremmo ottenuto sara' un modello
  *overfitted*.
* Per introdurre un bias induttivo si riduce deliberatamente l'espressivita' del
  linguaggio

## Feature tree
* Un feature tree e' un albero in cui ogni **nodo** e' etichettato con una
  **feature**. Ogni **diramazione** e' etichettata con un **letterale** (valore
  possibile della feature) 
* Modo compatto per rappresentare diverse ipotesi all'interno dello spazio delle
  ipotesi, in cui ogni ipotesi e' rappresentata implicitamente da una foglia.
  L'ipotesi risultante e' la congiunzione dei vincoli sui letterali incontrati
  nel percorso dalla *foglia* alla *radice*
* L'algoritmo `GrowTree` e' la procedura di apprendimento piu' utilizzata dalla
  maggior parte dei tree learners. Segue un approccio *[divide and
  conquer](divide and conquer)* (segmentazione prograssiva in modo ricorsivo)
  and *greedy* (sceglie sempre l'alternativa migliore, senza riconsiderarla
  mai). L'approccio greedy potrebbe portare ad una soluzione *sub-ottima*, per
  cui si potrebbero utilizzare algoritmi con forme di backtracking al costo di
  un maggior tempo di esecuzione e memoria

## Decision Trees
* Purezza di un segmento: probabilita' empirica che ci sia almeno un esempio
  classificato positivo:
  $$
  \dot{p} = \frac{n^+}{n^+ = n^-}
  $$
* Probabilita' empirica: inferita dalle osservazioni (training set)
* 
