\newpage
# Features

## Tipologie di Features
* Le features possono essere definite formalmente come delle mappe $f_i:
  \mathscr{X} \rightarrow \mathscr{F}_i$, che mappano ogni istanza in
  $\mathscr{X}$ al dominio delle features $\mathscr{F}_i$.
* Il dominio delle features puo' essere reale ($\mathbb{R}$), intero
  ($\mathbb{Z}$) ma puo' anch essere un insieme discreto come i colori, i
  booleani e cosi' via
* Possiamo distinguere le features anche in base alle operazioni che possiamo
  fare sui valori. Si pensi ad esempio alla media, che puo' essere fatta
  solamente su alcune tipologie di valori come ad esempio l'altezza di una
  persona ma non il suo gruppo sanguigno.
* Il range delle operazioni possibili dipende anche dall'esistenza di una scala
  di misura. Quando abbiamo una scala di misura possiamo effettivamente fare
  delle operazioni algebriche sui valori (somma, prodotto ecc..)
* Distinguiamo quindi in base a questo criterio diversi tipi di features:
    * **Categoriche**: features i cui valori non possono essere ordinati (es.
      Booleane)
    * **Ordinali**: features i cui valori possono essere ordinati. Non
      necessariamente possono essere dei valori numerici (es. insiemi di
      caratteri o stringhe che esprimono un ranking come "primo, secondo, terzo"
      ecc..)
    * **Quantitative**: features in cui si possono fare operazioni algebriche
      (somma/prodotto ecc..)
* In base alla tipologia di feature possiamo calcolare diverse statistiche:
    * **Statistiche di tendenza centrale**: come la *media* (o valor medio),
      *mediana* (valore a meta' dell'ordinamento) o la *moda* (valore piu'
      frequente). La media possiamo calcolarla solo nelle features quantitative,
      la mediana per quelle ordinali/quantitative e la moda per tutte.
      La media inoltre viene calcolata in modi differenti in base alla scala
      della feature:
        * *Lineare*: la media viene calcolata come media **aritmetica**
        * *Reciproca* (ad esempio se ho delle velocita'): la media viene calcolata
          come media **armonica**
        * *Frequenza* (in musica ad esempio): la media viene calcolata come media
          **geometrica**
    * **Statistiche di dispersione**: Ci dicono di quanti si disperdono i valori
      rispetto a dei valori centrali o altri valori. Possono essere:
        * *Varianza* (scarto quadratico medio)
        * *Deviazione Standard* (la radice quadrata della varianza)
        * *Range* (differenza tra valor massimo e valor minimo) o il *midrange
          point* (media della somma tra minimo e massimo).
        * *Percentili* (il *p-esimo* percentile e' il valore tale che il
          *p-percento* degli esempi hanno il valore della feature piu' piccolo
          di tale valore)
    * **Statistiche di forma**: indicano quanto una distribuzione e' concentrata
      intorno ad un *picco* (*peakedness*):
        * *Skeweness*: definita come $m_3/\sigma^3$, cioe' il rapporto tra il
          terzo momento centrale e deviazione standard al cubo. Un valore
          positivo indica che la coda a destra della distribuzione e' piu' lunga
          di quella a sinistra. Viceversa se negativo.
        * *Kurtosis*: definita come $m_4/\sigma^4$. Spesso si considera
          l'eccesso di kurtosis rispetto al kurtosis della Gaussiana ($3$).
          Piu' tale eccesso e' alto piu' la distribuzione ha un picco piu'
          evidente che nella distribuzione Gaussiana normale.

> **Momento Centrale**: Il *k-esimo* momento centrale puo' essere visto come una
  generalizzazione dello scarto quadratico medio. In generale si calcola come
  $$
  m_k = \frac{1}{n} \sum^n_{i=1} (x_i - \mu)^k
  $$
  Notiamo che il primo momento centrale e' sempre 0 perche' gli scarti positivi
  e negativi si cancellano tra loro, mentre $k=2$ corrisponde alla varianza e
  con $k=3$ puo' essere positivo o negativo.


* Abbiamo detto che lo spazio delle istanze e' rappresentato come $\mathscr{X} =
  \mathscr{F}_1 \times \dots \times \mathscr{F}_d$. Ogni istanza e'
  rappresentata come un vettore $(v1, \dots, v_d)$ in cui il valore $v_i$
  rappresenta il valore della feature *i-esima*.
* Avere troppe features appesantisce troppo gli algoritmi di ricerca, per cui si
  cerca sempre di ridurle il piu' possibile per evitare la maledizione della
  dimensionalita'. In questo caso, quindi, stiamo dicendo che l'informazione
  necessaria e' espressa solo dalle $d$ features, per cui tutte le altre vengono
  filtrate.
* Le features strutturate consistono nell'accorpamento di una o piu' features in
  una sola feature. In questo modo si riduce il numero di features complessivo,
  pure senza dover eliminare features che potrebbero essere significative.
* Il problema principale della creazione di features strutturate e' l'esplosione
  combinatoriale in termini dei valori delle features previste

## Trasformazioni delle Features
* Ogni modello che abbiamo visto, tratta diverse tipologie di features in modi
  differenti:
    * I modelli probabilistici trattano ogni feature come se fosse *categorica*
    * I modelli ad albero ignorano la scala delle feature quantitative
      considerandone solo l'ordine (di fatto trattandole come features ordinali)
    * I modelli geometrici (basati sulla distanza) sono in grado di trattare
      solo features quantitative
* La notizia positiva e' che possiamo passare da una tipologia di feature ad
  un'altra tramite delle trasformazioni. La tabella seguente riassume le varie
  trasformazioni necessarie a passare da una tipologia all'altra.

![Overview delle possibili trasformazioni per passare a varie tipologie di
trasformazioni. Sulle righe ci sono le tipologie di partenza, mentre sulle
colonne ci sono le tipologie di arrivo](img/feature_transformations.png)

### Operazioni di discretizzazione
* Concernono le operazioni per trasformare variabili di tipo quantitativo in
  varibili di tipo ordinale (ordinati ma finiti) e categorico. Le operazioni di
  Thresholding sono dei casi specifici di discretizzazione.
* Le operazioni di discretizzazione possono essere **supervisionate** o
  **non-supervisionate**

#### Discretizzazione non supervisionata
* Il Thresholding non supervisionato consiste nel dividere i valori in due
  intervalli chiamati *bins*. Il threshold puo' essere dato delle statistiche di
  tendenza centrale.
* Altre operazioni comuni di discretizzazione non supervisionata sono invece:
    * `Equal-Width partitioning`: Consiste nel dividere il range in $N$
      intervalli di uguale lunghezza data da $MAX-min/N$. E' il piu' semplice da
      ottenere ma gli outliers dominano la scelta dei bin piu' estremi. Se la
      distribuzione e' sbilanciata non gesticono bene i dati, per cui ci
      potrebbero esser bins anche vuoti.
    * `Equal-Depth partitioning`: consiste nel dividere il range in $N$
      intervalli, ognuno contenente approssimativamente lo stesso numero di
      istanze (cosi' come si fa nei percentili). Cosi' facendo ottengo dei bins
      che hanno quasi tutti lo stesso numero di istanze.
    * `k-Means`: possiamo utilizzarlo in casi di features univariate

#### Discretizzazione supervisionata
* L'operazione fondamentale nella discretizzazione supervisionata e' quella di
  trattare le feature in questione come un *ranker*: si ordinano i dati in base
  alla feature e successivamente si a a vedere nel segmento identificato dalla
  etichetta di classe, se in quel segmento l'etichetta di classe e' uniforme o
  variabile.
* I segmenti identificati dall'etichetta di classe sono chiamati ***run(s)***

**Discretizzazione per partizionamento ricorsivo:**
* Similarmente a quello che si fa nei feature trees, si utilizza il
  principio di *entropia*
* L'idea e' quella di prendere il dataset, calcolarne l'entropia e considerare
  tutti i possibili split, sceliendo quello che ottimizza l'*Information Gain*.
* Lo split generera' cosi' due intervalli, per cui il passo successivo e' quello
  di applicare ricorsivamente lo stesso principio per i due intervalli generati.
* L'algoritmo termina quando le probabilita' empriche sono le stesse in tutto il
  ranking oppure i gli intervalli (bins) sono *puri* o hanno lo stesso valore di
  feature.

\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\SetKwInOut{Input}{Input}\SetKwInOut{Output}{Output}
\Input{set of labelled instances $S$ ranked on feature values $f(x)$; scoring
function $Q$}
\Output{sequence of thesholds $t_1, \dots, t_{k-1}$}
\BlankLine
\If{stopping criterion applies} { \Return $\emptyset$\; }
split $S$ into $S_l$ and $S_r$ using threshold $t$ thet optimizes $Q$\;
$T_l = RecPart(S_t, f, Q)$\;
$T_l = RecPart(S_l, f, Q)$\;
\Return $T_l \cup \{ t \} \cup T_r$ \;
\caption{GrowTree algorithm}
\end{algorithm}
