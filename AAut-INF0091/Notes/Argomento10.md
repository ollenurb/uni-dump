\newpage
# Ensemble Learning
* L'esemble learning e' una collezione di metodi atti ad apprendere una funzione
  obiettivo andando a far *apprendere diversi modelli e **combinarli** assieme*
* L'idea principale e' quella di partire da un dataset $D$ e ottenere $T$ diversi
  modelli derivando dataset diversi $D_1, \dots, D_T$. Una volta uttenuti
  vengono appresi con l'algoritmo di aprendimento $A$ ottenendo $M_1, \dots,
  M_T$ modelli, che vengono combinati infine nello stesso modello $M$
* Un modo molto comune per combinare i modelli ottenuti e' per mezzo del voto
  maggioritario:
  $$
  M(x) = f \left(  \sum^T_{i=1} w_i M_i(x) \right)
  $$
  dove:
    * $w_i$ e' il peso associato al modello $M_i$. Tipicamente e' compreso tra
      $0$ e $1$ e la loro somma totale e' $1$.
    * $f(x)$ e' una funzione di threshold
* Nella formula, $w_i > w_j$ significa "*$M_i$ e' piu' affidabile di $M_j$*".
  Tipicamente $w_i > 0$, ma potrebbe anche essere $<0$ per indicare che il
  modello $i$ e' sbaglia piu' di quanto fa giusto. In generale e' quindi una
  misura che indica quanto *buono* e' il modello (in relazione a tutti gli
  altri)
* A partire da questo schema generale di combinazione possiamo poi utilizzare
  diversi algoritmi per determinare come vengono generati i dataset $D_T$ e come
  vengono calcolati i pesi $w_i$ e la $f$

## Bagging
* Il primo di questi algoritmi e' ***Bagging*** (*Bootstrap Aggregation*)
  [Breiman et.al., 1996]

\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\SetKwInOut{Input}{Input}\SetKwInOut{Output}{Output}
\Input{dataset $D$; ensemble size $T$; learning algorithm $\mathscr{A}$}
\Output{ensemble of models whose proportions are combined by voting or averaging}
\BlankLine

\For{$t=1$ to $T$} {
    {build a bootstrap sample $D_t$ from $D$ by sampling $|D|$ data points with
    replacement\;}
    {run $\mathscr{A}$ on $D_t$ to produce a model $M_t$\;}
}
\Return $\{M_t | 1 \leq t \leq T\}$ \;

\caption{Bagging - Train an ensemble of models from bootstrap samples}
\end{algorithm}

* Bootstrap: insieme costruito campionando $n$ elementi con rimpiazzamento da
  $D$
* $M(x)$ si ottiene attraverso una votazione semplice (maggioritaria). Per cui
  basta imporre che $w_i = \frac{1}{T}$ e $f(x) = x > 0.5$.
* Nel problema dell'ensemble learning, idealmente si vuole che tutti i $T$
  modelli che sono stati appresi siano diversi tra loro. Bagging promuove questa
  proprieta' attraverso i bootstraping.
* Grazie al sampling, Bagging ha inoltre la proprieta' di costruire insiemi di
  esempi che seguono la distribuzione originale del dataset originale $D$
* La tecnica di Bagging funziona molto bene quando i classificatori hanno
  un'alta varianza perche' se avessero una bassa varianza i vari classificatori
  differirebbero poco tra di loro e non si avrebbe un'effettivo miglioramento
  con il bagging. D'altra parte, classificatori con alta varianza differiscono
  di molto tra di loro, rendendo piu' efficace il bagging.

> Mediamente, una replica di bootstrap conterra' circa il 63% di esempi unici
  del dataset originale. Questo perche' la probabilita' di **NON** estrarre un
  esempio e' $(1-\frac{1}{n})^n$ (l'esponente deriva dal fatto che i lanci sono
  indipendenti). Tale numero e' un limite notevole che tende a $1/e = 0.3678..$,
  per cui ne segue che $1 - 0.3678$% degli esempi di $D$ saranno inclusi nella
  replica di bootstrap.

## Random Forest
* Una random forest e' un'istanziazione del **Bagging** che utilizza alberi di
  decisione non potati (per migliorarne la diversita' tra gli altri modelli)
  come modelli.
* L'idea e' quella di considerare solo un sottoinsieme (scelto casualmente)
  delle features su cui fare split quando si costruisce il singolo albero.
* Piu' precisamente, si sceglie un sottoinsieme di cardinalita' $|F'| =
  \sqrt{|F|}$. In questo modo si ottengono diversi modelli che sono meno precisi
  rispetto ad un albero se l'avessimo appreso "normalmente", ma che performano
  meglio quando viene effettuato il bagging.

## AdaBoost
* AdaBoost (*Adaptive Boosting*) [Freund and Schapire et.al., 1997]

