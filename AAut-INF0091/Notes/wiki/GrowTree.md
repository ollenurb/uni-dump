% Algoritmo Grow Tree

* Procedura generica per la generazione di [feature trees](FeatureTrees.md) a
  partire da un train dataset
* Segue un approccio *divide-and-conquer*: divide i dati in diversi
  sottoinsiemi, ne costruice i feature trees associati e infine li combina
  insieme per ottenere quello corrispondente ai dati originali
* Gli algoritmi *divide-and-conquer* sono espressi naturalmente mediante
  procedure ricorsive. Anche *GrowTree* lo e'.
* Approccio Greedy: ogni volta che considera uno *split* prende solo il
  migliore, senza riconsiderare la scelta impiegando qualche mezzo di
  *backtracking*. Per questa ragione puo' trovare soluzioni sub-ottime

**Algoritmo**:
![Algoritmo GrowTree](./img/GrowTree.png){ width=100% }

## Procedure
* L'algoritmo e' generico. In base all'implementazione delle procedure seguenti
  puo' essere adottato a generare feature trees per tasks differenti:
    * `Homogeneus(D)`
    * `Label(D)`
    * `BestSplit(D, F)`

### Homogeneus(D) 
* Indica se il dataset $D$ e' abbastanza *omogeneo* da poter essere etichettato
  con la stessa label.
* Ogni task ha la sua definizione di *omogeneita'* specifica.
* Nel caso della classificazione, un dataset $D$ e' omogeneo se e solo se ogni
  istanza $x \in D$ appartiene alla stessa classe

### Label(D)
* Indica l'etichetta piu' appropriata per etichettare le istanze del dataset $D$
* Nel caso della classificazione, viene scelta l'etichetta presente in numero
  maggiore tra le istanze di $D$

### BestSplit(D, F)
* Indica lo *split* migliore per il dataset $D$, dato un set $F$ di
  [features](Features.md) disponibili per lo split
* Lo *split* e' determinato da una feature $f \in F$. BestSplit ritorna di fatto
  $f$
* Per trovare la feature con il migliore split, si introduce il concetto di
  *[Impurezza](Impurezza.md)* di uno split
* La procedura funziona essenzialmente considerando ogni $f_i \in F$ (che genera
  lo split $\{ D_1, \dots, D_l \}$) e calcolando $Imp(\{ D_1, \dots, D_l \})$.
  Mano a mano che considera le features, tiene conto sempre di quella che ha
  impurezza minima. Alla fine, ritorna la feature $f$ con impurezza minima.
* Questo modo di procedere, serve a scegliere la feature su cui fare lo split
  che ***riduce maggiormente l'incertezza** tra tutte.

**Algoritmo:**

![Algoritmo BestSplit](img/BestSplit.png){ width=100% }
