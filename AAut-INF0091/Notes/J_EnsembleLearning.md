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

> Una classe di concetti (dataset) e' learnable (o **strongly learnable**) se
  esiste un algoritmo a tempo polinomiale per ottenere un modello con errore
  relativamente basso con un alta confidenza per tutti i concetti della classe.
  Contrariamente, un modello piu' debole di apprendibilita' (**weak
  learnability**) ha un rilassamento su questi vincoli, facendo cadere i requisiti
  che il learner debba essere in grado di raggiungere una precisione
  arbitrariamente elevata: un algoritmo di apprendimento debole puo' dare in
  output ipotesi che performino *leggermente* meglio di un random guess

* Ipotesi del problema del boosting: *"e' vero che i problemi di apprendimento
  fortemente apprendibili sono equivalenti ai problemi di apprendimento
  deboli?"*
* Nel '90 e' stato visto da Kearns et.al. che non erano equivalenti per certe
  restrizioni imposte sulla distribuzione dello spazio delle istanze. Per cui
  era palusibile che i due problemi non fossero equivalenti anche in tutti gli
  altri casi
* Sempre nel '90, pero', Schapire dimostro' che i due problemi fossero
  effettivamente equivalenti.

> ***Teorema**: Una classe di concetti $C$ e' apprendibile in modo debole se e
  solo se e' apprendibile in modo forte*

* In altri termini, se abbiamo un algoritmo di apprendimento $\mathscr{A}$ che
  sia in grado di generare una soluzione leggermente migliore di un random
  guess, allora esiste una procedura di boosting in grado di dare una soluzione
  **accurata a piacere**, ma che usa $\mathscr{A}$ come algoritmo di
  apprendimento di base
* Il miglioramento aumenta inoltre esponenzialmente con il numero di volte con
  cui si utilizza $\mathscr{A}$

 ![Grafico dell'error rate sul numero di iterazione $T$ di AdaBoost. Si noti
 come decresca esponenzialmente se l'algoritmo scelto genere weak
 learners](img/adaboost_error.png){ width=50% }

* Il teorema di Schapire non invalida pero' il teorema di Kearns poiche' suppone
  che la distribuzione non sia uniforme, che si suppone venga modificata in base
  alle esigenze da una fase di preprocessing iniziale
* L'idea generale del Boosting e' la seguente:
    * Nel training set $Tr$ assegna ad ogni esempio un peso
    * Man mano che il boosting va avanti, i pesi vengono *aggiustati* in base ai
      risultati delle predizioni:
        * Il peso degli esempi che sono correttamente predetti vengono abbassati
        * Il peso degli esempi che non sono correttamente predetti vengono
          alzati
* In questo modo man mano che va avanti la procedura di apprendimento,
  l'algoritmo di apprendimento viene forzato sempre di piu' a *"concentrarsi"*
  sulle porzioni dello spazio degli esempi che non sono correttamente
  classificate
* Possiamo notare inoltre che AdaBoost man mano che va avanti *"complica"*
  (impostando i pesi) sempre di piu' il problema di apprendimento, rendendo
  sempre meno valida l'ipotesi di ottenere un weak lerner in output
  dall'algoritmo di apprendimento, per cui ha delle limitazioni sul numero di
  iterazioni

### Algoritmo e Spiegazione

\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\SetKwInOut{Input}{Input}\SetKwInOut{Output}{Output}
\Input{dataset $D$ of labelled instances; weak learning algorithm $\mathscr{A}$; no.
iterations $T$}
\Output{ensemble model $M(x)$ using $T$ models learned over $D$ with
$\mathscr{A}$}
\BlankLine

$w^1= \left[ \frac{1}{|D|}, \dots, \frac{1}{|D|} \right]$

\For{$t \in \{ 1, \dots, T \}$} {
    {$m_t = \mathscr{A}(D, w^t)$ \;}
    {$\epsilon_t = \sum^n_{i=1} w_i^t I[y_i \neq m_t(x_i)]$ \;}
    {$\alpha_t = \frac{1}{2} ln \frac{1 - \epsilon_t}{\epsilon_t} $\;}
    \For{$i \in \{ 1, \dots, n \}$} {
        {$w_i^{t+1} = w_i^t exp(-\alpha_t y_i m_t (x_i))$\;}
    }
    {$w^{t+1} = normalize(w^{t+1})$\;}
}

\Return $M(x) = sign(\sum^T_{t=1} \alpha_t m_t (x))$ \;

\caption{AdaBoost Algorithm - learn an ensemble model}
\end{algorithm}

* Nel predecente algoritmo:
    * $\mathscr{A}$ e' un algoritmo che deve dare in output modelli con
      accuratezza *leggermente* maggiore del $50$% (puo' anche essere ad esempio
      $50.1$%)
    * Linea 1: I pesi vengono inizializzati allo stesso peso iniziale
    * Linea 3: Viene appreso un classificatore $m_t$ sui dati coi pesi correnti
      $w_t$
    * Linea 4: Calcola l'errore pesato di tutti gli esempi che non sono stati
      classificati correttamente (la funzione indicatrice vale 1 se l'argomento
      e' True, 0 altrimenti)
    * Linea 5: Calcola il peso associato al voto del classificatore corrente
      ($\alpha_t \in [0, +\infty]$
    * Linea 6-9: Aggiorna i pesi nel dataset considerando anche quelli
      precedenti

* Il perche' viene calcolato in quel modo $\alpha$ ha delle ragioni teoriche
  precise. Quella principale e' che l'algoritmo visto puo' essere derivato come
  un *algoritmo di minimizzazione greedy della perdita esponenziale pesata
  dell'ensemble*
* Ad ogni step AdaBoost cerca in modo greedy il peso $\alpha_t$ che minimizza
  $M_T$ (dove $M_T$ e' l'ensemble del passo attuale)
* Assumiamo ad esempio che abbiamo gia' costruito parte dell'ensemble
  $$
  M_{T-1}(x) = \sum^{T-1}_{t=1} \alpha_t m_t(x)
  $$
  e concentriamoci su come scegliere $m_T$ e $\alpha_T$ sotto le condizioni che
  la perdita sia esponenziale
* Per definizione, sappiamo innanzitutto che $M_T(x) = M_{T-1}(x) + \alpha_T
  m_T(x)$, per cui basta applicare la definizione di errore esponenziale e
  effettuare delle manipolazioni algebriche
  $$
  \begin{aligned}
  E &= \sum_i e^{-y_i M_T (x_i)}\\
    &= \sum_i e^{-y_i(M_{T-1}(x_i) + \alpha_T m_T(x_i))}\\
    &= \sum_i e^{-y_i M_{T-1}(x_i)} \cdot e^{-y_i \alpha_T m_T(x_i)}\\
    &= \sum_i w_i^T e^{-y_i \alpha_T m_T(x_i)} \\
    &= \sum_{\{i | y_i = m_T(x_i)\}} w_i^T e^{-\alpha_T} + \sum_{\{i | y_i \neq m_T(x_i)\}} w_i^T e^{\alpha_T}
  \end{aligned}
  $$
  e otteniamo che e' la somma degli errori di cui la classificazione e' corretta
  e quelli in cui la classifizaione non e' corretta.
* Nel passo 4 si impone che:
  $$
  w_i^T =
  \begin{cases}
  e^{-y_i M_{T-1}(x_i)} &\text{se }T>1 \\
  1 &\text{se } T = 1
  \end{cases}
  $$
* Ora $w_i^T$ e' effettivamente la formulazione ottenuta nell'algoritmo (linea
  6-9) poiche'
  $$
  \begin{aligned}
  w_i^T &= e^{-y_i M_{T-1}(x_i)} \\
      &= e^{-y_i(\alpha_{T-1} m_{T-1}(x_i) + M_{T-2}(x_i)}\\
      &= e^{-y_i m_{T-2}(x_i)} \cdot e^{-y_i \alpha_{T-1} m_{T-1}(x_i)}\\
      &= w_i^{T-1} \cdot e^{-y_i \alpha_{T-1} m_{T-1}(x_i)}
  \end{aligned}
  $$
  che e' appunto la formulazione che si trova nell'algoritmo.
* Con la formula trovata dell'errore, possiamo anche rispondere ad un'altra
  domanda. Il fatto e' che si vorrebbe trovare un modo per dire all'algoritmo
  quale tra gli $m_T$ scegliere. Il problema e' complicato pero' dal fatto che
  in entrambe nelle somme
  $$
  \sum_{\{i | y_i = m_T(x_i)\}} w_i^T e^{-\alpha_T} + \sum_{\{i | y_i \neq m_T(x_i)\}} w_i^T e^{\alpha_T}
  $$
  compare in entrambe $m^T$. L'idea e' quella di riuscire a "rimuovere" da una
  delle due somme $m^T$ in modo da ritrovarci a discutere solo una delle due
  somme, per cui sommiamo e togliamo la stessa quantita' $\sum_{\{i | y_i \neq m_T(x_i)\}} w_i^T e^{\alpha_T}$
  $$
  \begin{aligned}
  E &= \sum_{\{i | y_i = m_T(x_i)\}} w_i^T e^{-\alpha_T} + \sum_{\{i | y_i \neq
  m_T(x_i)\}} w_i^T e^{\alpha_T} \\
    &= \sum_{\{i | y_i = m_T(x_i)\}} w_i^T e^{-\alpha_T} + \sum_{\{i | y_i \neq
    m_T(x_i)\}} w_i^T e^{\alpha_T} + \sum_{\{i | y_i \neq m_T(x_i)\}} w_i^T
    e^{\alpha_T} - \sum_{\{i | y_i \neq m_T(x_i)\}} w_i^T e^{\alpha_T}\\
    &= \sum_i w_i^T e^{-\alpha_T} + \sum_{\{ i | y_i \neq m_T(x_i) \}}
    w_i^T(e^{\alpha_T} - e^{-\alpha_T})\\
  \end{aligned}
  $$
  abbiamo trovato quindi che per minimizzare l'errore rispetto a $m_T$ e'
  sufficiente minimizzare
  $$
  \sum_{\{ i | y_i \neq m_T(x_i) \}} w_i^T(e^{\alpha_T} - e^{-\alpha_T})
  $$
* Facciamo un passo indietro ora e vogliamo trovare il peso ottimale $\alpha_T$
  che minimizzi il numero di missclassificazioni. Per scegliere il peso
  ottimale, cerchiamo un $\alpha_T$ che annulla la derivata di $E$.
  $$
  \frac{\partial E}{\partial \alpha_T} =
  \sum_{\{ i | y_i \neq m_T(x_i) \}} w_i^T e^{\alpha_T} - \sum_{\{ i | y_i = m_T(x_i) \}} w_i^T e^{-\alpha_T}
  $$
  **TODO** Da finire roba matematica che non ho voglia di scrivere qua LOL
* **TODO**: Inserire algoritmo resampling

## Perche' ensemble learning funziona
* Ci sono diverse motivazioni del perche' l'ensemble learning funzini. In primo
  luogo e' per una proprieta' del Bias/Variance dilemma.
* Sappiamo che per il teorema del bias/varianza tradeoff possiamo scomporre
  l'errore in
  $$
  \mathbb{E}(\epsilon(x)) = Bias(x) + Var(x) + Noise(x)
  $$
* E' stato dimostrato che tutti i metodi di ensemble riducono sia la componente
  di bias che la componente di varianza dell'errore. E' stato dimostrato
  empiricamente pero' che che il Bagging agisce principalmente come macchina di
  riduzione della varianza, per cui e' piu' efficace con classificatori quali
  alberi di decisione che hanno basso bias e alta varianza

