# Concept Learning
* Alla base dell'apprendimento induttivo si fa un'assunzione importante: se il
  modello riesce ad approssimare la funzione target molto bene dagli esempi,
  allora approssimera' la funzione target anche su esempi non osservati (futuri)
* Concept learning concerne l'apprendimento di espressioni logiche (anche
  chiamate *concetti*) dalle istanze di esempio $x \in Te$. Piu' nello
  specifico, si vuole apprendere una descrizione della classe dei positivi
  espressa in termini di espressione logica 

## Ripasso Logica
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
* Un ipotesi $h$ e' una *congiunzione* di vincoli sugli attributi, in cui ogni
  vincolo puo' essere:
    * Posto su un valore specifico $Water=Warm$
    * Qualsiasi valore (ignorato) $Water = ?$
    * Nessun valore (*null hypotesis*) $Water = \emptyset$
* Lo spazio di tutte le ipostesi possibili e' chiamato ***hypotesis space***,
  denotato con la lettera $H$
* Il task del concept learning e' uguale a quello della classificazione. Dati:
    * Delle istanze $\mathscr{X}$ descritte in termini di $i$ attributi $a_i$ 
    * Un funzione target (o *target concept*) $c: \mathscr{X} \rightarrow \{0, 1\}$
    * Un set di ipotesi $H$ in cui le singole ipotesi sono descritte in termini
      di congiunzione di vincoli sugli attributi $a_i$
    * Un set di istanze etichettate $(x, c(x)) \in D$
  Determinare un'ipotesi ***target*** $h \in H$ tale che $\forall x \in D, h(x)
  = c(x)$ cioe' che $h$ *copra* ogni $x$ nel training set 
* Il numero delle ipotesi e' esponenzialmente grande rispetto al numero di
  attributi e valori che possono assumere. Consideriamo l'esempio in cui le
  istanze siano rappresentate da un attributo che puo' assumere 3 valori e altri
  5 che possono assumere solo 2 valori. Allora, possiamo calcolare:
    - # istanze distinte: $3 \cdot 2 \cdot 2 \cdot 2 \cdot 2 \cdot 2 = 96$
    - # ipotesi sintatticamente valide: $5 \cdot 4 \cdot 4 \cdot 4 \cdot 4 \cdot 4 = 5120$
    - # ipotesi semanticamente valide: $1 + (4 \cdot 3 \cdot 3 \cdot 3 \cdot 3
      \cdot 3) = 973$
* Il task dell'apprendimento equivale a ricercare all'interno dello spazio delle
  ipotesi le ipotesi che siano consistenti con il target concept target $c$

## Ordinamento delle ipotesi
* Molti algoritmi di apprendimento migliorano la ricerca all'interno dello
  spazio delle ipotesi sfruttando una proprieta' inerente ad ogni problema di
  concept learning: l'ordinamento specifico-generale delle ipotesi
* Consideriamo due ipotesi:
    * $h1$ = ``< Sunny, ?, ?, Strong, ?, ? >`
    * $h2$ = ``< Sunny, ?, ?, ?, ?, ? >`
* Dal momento che $h2$ impone meno vincoli di $h1$, coprira' un insieme di
  istanze piu' grande di quello coperto da $h1$
* ***Definizione: ($\geq_g$)*** Siano $h_j$ e $h_k$ due
  ipotesi definite sull'insieme delle istanze $\mathscr{X}$. $h_j$ e' detta
  ***piu' o ugualmente generale di*** $h_k$ (scritto come $h_j \geq_g h_k$) se e
  solo se $\forall x \in \mathscr{X}: [(h_k(x)=1) \rightarrow (h_j(x)=1)]$
* Formalmente, la relazione $\geq_g$ definisce un ordine parziale su $H$
* Lo spazio delle ipotesi insieme alla relazione di ordinamento appena descritta
  costituiscono un *reticolo*, in cui le ipotesi piu' generali sono nella parte
  inferiore. Se ci si sposta verso la parte superiore diventano piu' specifiche.
  Per cui sono ordinate dal basso verso l'alto mediante la relazione descritta.
* Nel vertice superiore del reticolo c'e' l'ipotesi nulla (quella piu' specifica
  di tutte, composta da soli 0), mentre al vertice inferiore c'e' l'ipotesi piu'
  generale (composta da tutti punti interrogativi)

## Trovare l'ipotesi specifica massima: L'algoritmo Find-S
* L'algoritmo Find-S si basa su due specifiche ipotesi per poter funzionare:
    1. Lo spazio delle ipotesi $H$ contiene un'ipotesi che descrive il target
       concept $c$
    2. Il dataset di training $D$ non contiene errori ed e' consistente (non ha
       esempi contenenti "rumore", oppure non ci sono due istanze uguali ma con
       labels discordi)
* Se prendiamo per vere queste due ipotesi, si puo' definire un algoritmo per
  cercare l'ipotesi che meglio approssima $c$, chiamato ***Find-S***:
* ***Algoritmo (Find-S)***:
    1. Initialize $h$ with the most specific hypotesis in $H$ $(\emptyset,
       \dots, \emptyset)$
    2. For each positive training instance $x_i$:
        - For each attribute constraint $a_i$ in $h$:
            - if the constraint $a_i$ in $h$ is satisfied by $x_i$:
                - do nothing
            - else
                - replace $a_i$ in $h$ by the next more general constraint
                  satisfied by $x_i$
        - End For
    3. End For
    4. Output hypothesis $h$

* L'idea dietro all'algoritmo e' quella di partire inizialmente dall'ipotesi
  piu' specifica possibile in $H$ (cioe' quella composta da soli $\emptyset$), e
  generalizzarla ogni qual volta che si trovi un esempio che non viene coperto
  da tale ipotesi.
    
## Percorsi all'interno dello spazio delle ipotesi
* ***Definizione (Version Space)***: Un concetto si dice *completo* se copre
  tutti gli esempi positivi. Un concetto e' *consistente* se non copre nessun
  esempio negativo. Il ***version space*** e' l'insieme di tutti i concetti
  *completi* e *consistenti*. Tale set e' *convesso*, per cui e' definito
  interamente da i suoi due concetti meno e piu' generali.
