\newpage
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
    - *nr.* istanze distinte: $3 \cdot 2 \cdot 2 \cdot 2 \cdot 2 \cdot 2 = 96$
    - *nr.* ipotesi sintatticamente valide: $5 \cdot 4 \cdot 4 \cdot 4 \cdot 4 \cdot 4 = 5120$
    - *nr.* ipotesi semanticamente valide: $1 + (4 \cdot 3 \cdot 3 \cdot 3 \cdot 3
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

## Trovare massima ipotesi piu' specifica: L'algoritmo Find-S
* L'algoritmo Find-S si basa su due specifiche ipotesi per poter funzionare:
    1. Lo spazio delle ipotesi $H$ contiene un'ipotesi che descrive il target
       concept $c$
    2. Il dataset di training $D$ non contiene errori ed e' consistente (non ha
       esempi contenenti "rumore", oppure non ci sono due istanze uguali ma con
       labels discordi)
* Se prendiamo per vere queste due ipotesi, si puo' definire un algoritmo per
  cercare l'ipotesi che meglio approssima $c$, chiamato ***Find-S***:
  
\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\SetKwInOut{Input}{Input}\SetKwInOut{Output}{Output}
\Input{$D$}
\Output{The maximal specific hypothesis $h$ that covers every example in $D$}
\BlankLine
Initialize $h$ with the most specific hypotesis in $H$ $(\emptyset, \dots,
\emptyset)$\;

\For{each each positive training instance $x_i$}{
\If{the constraint $a_i$ in $h$ is \textbf{not} satisfied by $x_i$}{
  replace $a_i$ in $h$ by the next more general constraint satisfied by
  $x_i$\;
}
}
\caption{Find-S}
\end{algorithm} 
 
* L'idea dietro all'algoritmo e' quella di partire inizialmente dall'ipotesi
  piu' specifica possibile in $H$ (cioe' quella composta da soli $\emptyset$), e
  generalizzarla ogni qual volta che si trovi un esempio che non viene coperto
  da tale ipotesi. In questo modo si trova l'ipotesi meno generale possibile ma
  che copre tutti li esempi
* Gli esempi considerati per generalizzare $h$, pero', sono solo gli esempi
  positivi per cui *vengono ignorati gli esempi negativi*. Questo perche' il
  target concept non copre nessun esempio negativo, di conseguenza non e'
  necessaria nessuna revisione dell'ipotesi $h$
* La proprieta' chiave dell'algoritmo find-S e' che tutte le ipotesi all'interno
  di $H$ siano rappresentate come insieme di *congiunzioni* di vincoli
* $h$ e' l'ipotesi piu' specifica in $H$ in grado di coprire tutti gli esempi.
  $h$ e' inoltre consistente anche con gli esempi negativi, posto che: 
    * I dati siano corretti
    * Il target concept $c$ sia presente in $H$ 
* L'algoritmo find-S, pero', presenta alcune limitazioni evidenziate dai punti
  seguenti:
    * Non si ha modo di capire, ne di avere una misura su quanto il learner
      abbia effettivamente confluito sul target concept
    * In caso ci siano piu' ipotesi consistenti con gli esempi di train, Find-S
      scegliera' sempre la piu' specifica, scartando le altre che potrebbero
      essere l'effettivo target concept
    * Non sempre i dati di train sono consistenti e l'algoritmo non ha modo di
      riconoscere quando questo accade
    * Nel caso in cui ci siano multiple ipotesi piu' generali in grado di
      coprire tutti gli esempi, l'algoritmo non fa nessuna scelta informata tra
      le scelte

## L'algoritmo Candidate-Elimination e il Version Space
* ***Definizione (Version Space)***: Un concetto si dice *completo* se copre
  tutti gli esempi positivi. Un concetto e' *consistente* se non copre nessun
  esempio negativo. Il ***version space*** e' l'insieme di tutti i concetti
  *completi* e *consistenti*. Formalmente si dice che l'ipotesi $h$ e'
  consistente con i dati di train $D$ se:
  $$
  Consistent(h, D) = (\forall (x, c(x)) \in D) h(x) = c(x)
  $$
  dove $c$ e' il *target concept*.
  Analogamente, il versio space e' definito formalmente come
  $$
  VS_{H,D} = \{ h \in H | Consistent(h, D) \}
  $$
* Un modo ovvio per rappresentare il version space e' semplicemente quello di
  enumerare ogni elemento in una lista. L'algoritmo chiamato
  *List-Then-Eliminate* segue questo principio:
   
  \begin{algorithm}[H]
  \DontPrintSemicolon
  \SetAlgoLined
  \SetKwInOut{Input}{Input}\SetKwInOut{Output}{Output}
  \Input{$D$}
  \Output{The Version Space $VS$}
  \BlankLine
  $VS \leftarrow$ list containing every hypothesis in $H$\;
  \For{each training example $(x, c(x))$}{
      Remove from $VS$ every hypothesis $h$ such that $h(x) \neq c(x)$\;
  }
  Return $VS$
  \caption{List then Eliminate}
  \end{algorithm} 
 
  Sfortunatamente, l'algoritmo richiede di enumerare ogni possibile elemento
  all'interno del version space, che e' computazionalmente insostenibile
* Il *Version space* puo' essere anche definito in termini dei suoi limiti:
    * Un **general boundary** chiamato $G$ contenente i membri generalmente
      massimi, consistenti con $D$
    * Uno **specific boundary** chiamato $S$ contenente i membri specificamente
      massimi, consistenti con $D$
* $G$ ed $S$ definiscono l'intero version space 
* **Piu' esempi muovono $S$ verso il basso** (piu' generali), mentre **meno
  esempi muovono $G$ verso l'alto** (piu' specifici)
* L'algoritmo Candidate-Elimination funziona con lo stesso principio
  dell'algoritmo *List-Then-Eliminate* ma utilizza una rappresentazione molto
  piu' compatta del version space. Piu' nello specifico, il version space e'
  rappresentato da $G$ ed $S$
    * Nel primo passo considera l'intero version space, impostando $G$ ed $S$ a
      contenere l'ipotesi piu' generale e quella piu' specifica rispettivamente
    * Una volta che l'algoritmo termina, l'intero versio space specificato dai
      due limiti $G$ ed $S$ contiene solo ed esclusivamente ipotesi consistenti
      con gli esempi

\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\SetKwInOut{Input}{Input}\SetKwInOut{Output}{Output}
\Input{$D$}
\Output{The Version Space defined in terms of $G$ and $S$}
\BlankLine
Initialize $G$ to the set of maximally general hypothesis in $H$
($?, \dots, ?$)\;
Initialize $G$ to the set of maximally specific hypothesis in $H$
($\emptyset, \dots, \emptyset$)\;
\For{each training example $d$}{
    \eIf{$d$ is a positive example}{
        Remove from $G$ any hypothesis inconsistent with $d$\;
        \For{each hypothesis $s$ in $S$ that is not consistent with $d$}{
            Remove $s$ from $S$\;
            Add to $S$ all minimal generalizations $h$ of $s$ such that $h$ is
            consistent with $d$ and some member of $G$ is more general than $h$\;
            Remove from $S$ any hypothesis that is more general than another
            hypothesis in $S$
        }
    }{
        Remove from $S$ any hypothesis inconsistent with $d$\;
        \For{each hypothesis $g$ in $G$ that is not consistent with $d$}{
            Remove $g$ from $G$\;
            Add to $G$ all minimal specializations $h$ of $g$ such that $h$ is
            consistent with $d$ and some member of $S$ is more specific than $h$\;
            Remove from $G$ any hypothesis that is less general than another
            hypothesis in $G$
        }
    }
}
\caption{Candidate Elimination}
\end{algorithm} 

* Nell'algoritmo, le righe 8 e 15 servono a rendere $S$/$G$ un riassunto di
  tutte le ipotesi consistenti con gli esempi positivi/negativi
* Le righe 9 e 16 servono a mantenere tali insiemi minimi, manenendo solo le
  ipotesi piu'/meno generali
* Mano a mano che gli esempi vengono considerati dall'algoritmo, i limiti $G$ ed
  $S$ si avvicinano sempre di piu' monotonicamente, delimitando il version space
  di ipotesi candidate sempre piu' piccolo.
* Se in $H$ e' contenuta l'ipotesi univoca che rappresenta il target *target
  concept* e il numero di esempi e' abbastanza grande, allora l'algoritmo
  Candidate Elimination convergera' all'ipotesi target univoca.
* Nel caso invece in cui ci fossero esempi inconsistenti, $G$ ed $S$
  eventualmente tendono a diventare vuoti con l'aumento del numero di esempi
  considerati. Tale situazione si verifica anche quando il target concept non
  puo' essere rappresentato con il linguaggio attuale (congiunzioni di vincoli)
* Nel caso in cui non si avessero abbastanza esempi per cui il VersionSpace
  contenga ancora molte ipotesi si potrebbero:
    * Richiedere altri esempi etichettati ad un oracolo   
    * Usare le ipotesi del version space per classificare esempi futuri
* Nel primo caso, consideriamo lo scenario in cui il *learner* abbia accesso in
  qualche modo ad un *oracolo* esterno. Il learner puo' utilizzare delle *query*
  (istanze) che vengono classificate correttamente dall'oracolo per aumentare la
  velocita' di convergenza.
* Una strategia generale per la generazione di query e' scegliere quelle che
  vengono classificate correttamente da meta' delle ipotesi nel version space e
  negativamente dalla restante meta'. In questo modo il version space si
  dimezza ad ogni esempio, per cui il target concept puo' essere trovato in
  $log_2(|VS|)$ esperimenti

* Unbiased Learner: modello che utilizza il linguaggio dell'intera logica
  (disgiunzioni, congiunzioni, negazioni). Il numero di concetti esprimibili e'
  enorme, ed e' pari al power set $P(X)$. **Sicuramente** $H$ conterra' il
  target concept
* Un unbiased learner e' impossibile da avere. Il bias e' un concetto
  fondamentale che sta alla base dell'apprendimento.

## Inductive Bias
* Serve per fare l'inductive leap
* I larners possono essere classificati anche in base al loro bias induttivo:
    * **Rote learner**: Salva esempi, classifica $x$ se e solo se matcha un
      esempio precedente (nessun bias induttivo = nessuna abilita' di
      generalizzare) 
    * **Version Space candidate elimination**: Classifica gli esempi se tutti i
      membri del version space concordano. (bias induttivo = lo spazio delle
      ipotesi $H$ contiene il concetto target $c$) 
    * **Find-S**: TODO

> TODO: Inserire esercizi
