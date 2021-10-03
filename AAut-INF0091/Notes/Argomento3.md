# Concept Learning
* Concept learning concerne l'apprendimento di espressioni logiche (anche
  chiamate *concetti*) dalle istanze di esempio $x \in Te$. Piu' nello
  specifico, si vuole apprendere una descrizione della classe dei positivi
  espressa in termini di espressione logica 
* Se l'espressione $A$ e' vera per l'istanza $x$ si diche che $A$ ***copre*** $x$
* L'insieme delle espressioni che sono coperte da $A$ e' chiamato
  ***estensione*** di $A$ denotato come $\mathscr{X}_A = \{ x \in \mathscr{X} |
  A \text{covers} x\}$
* Se $\mathscr{X}_A \supseteq \mathscr{X}_{A'}$ si dice che $A$ e' *almeno
  generale quanto* $A'$ 
* Ogni espressione logica puo' essere riscrita come una
  congiunzione/disgiunzione di clausole (*Conjunctive/Disjunctive Normal Form*)
* ***Regola***: Clausola $A \rightarrow B$ dove $B$ e' un singolo letterale.
  Viene anche chiamata *clausola di Horn*.

## Lo spazio delle ipotesi
* L'impostazione piu' semplice nel concept learning e' quella in cui le
  espressioni logiche che descrivono concetti sono rappresentate solo mediante
  ***congiunzioni***.
* Lo spazio di tuti i possibili concetti e' chiamato ***hypotesis space***

## Least general generalization
* Il concetto (o ipotesi) meno generalizzabile e' chiamato *least general
  generalisation (LGG)*
* Nell'esempio 4.1 del libro questa generalizzazione e' la LGG e' quella
  risultante nell'ultimo passo ottenuto
* Intuitivamente e' possibile vedere la LGG di due istanze nello spazio delle
  ipotesi come il concetto piu' vicino a due istanze in cui le linee che le
  connettono si intersecano (vedere appunti libro)
* Lo spazio delle ipotesi ha le stesse proprieta' di una nota struttura
  matematica chiamata ***reticolo***, un ordine parziale in cui qualsiasi coppia
  di elementi ha un *least upper bound* e un *greatest lower bound*.
* L'***LGG*** di un set di istanze equivale quindi al *least upper bound* di
  tutte le istanze appartenenti a quel reticolo
* Un modo per trovare la LGG potrebbe essere quello di applicare ripetutamente
  una generalizzazione LGG alla coppia $(x, h_i)$ dove $h_i$ e' la LGG corrente.
  (Algoritmo 4.1 a pagina 108)
* Le istanze negative servono ad evitare di over-generalizzare. (Esempio 4.2
  pagina 110)

## Percorsi all'interno dello spazio delle ipotesi
* ***Definizione (Version Space)***: Un concetto si dice *completo* se copre
  tutti gli esempi positivi. Un concetto e' *consistente* se non copre nessun
  esempio negativo. Il ***version space*** e' l'insieme di tutti i concetti
  *completi* e *consistenti*. Tale set e' *convesso*, per cui e' definito
  interamente da i suoi due concetti meno e piu' generali.
* 
