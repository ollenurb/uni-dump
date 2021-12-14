\newpage
# Modelli Probabilistici
* Lo strumento principale per fare inferenza probabilistica e' il teorema di
  Bayes
  $$
  P(Y = y \; | \; X) = \frac{P(X | Y = y) \cdot P(Y = y)}{P(X)}
  $$
  Dove:
    * $P(Y=y \; | \; X)$ e' detta **probabilita' a posteriori** (cioe' stimata
      *dopo* aver visto l'esempio $X$), e indica la probabilita' che la classe
      di una data istanza $X$ sia $y$
    * $P(X \; | \; Y = y)$ e' detta **likelihood**, e indica la probabilita' di
      ottenere un'istanza $X$ se ipotizziamo di campionarla dalla classe $y$
    * $P(Y =y)$ e' detta **probabilita' a priori**, e indica la probabilita' di
      una classe, senza conoscenze pregresse sulle features (quindi considera
      solamente la distribuzione delle classi nel dataset)
    * $P(X)$ e' anch'essa una **probabilita' a priori**, ma in questo caso sulle
      features osservate. E' la probabilita' di ottenere l'istanza $X$ se presa
      un'istanza a caso all'interno del training set

* $X$ e' un vettore **aleatorio** che rappresenta un singolo esempio in termini
  dei valori delle sue features
* Anche $Y$ e' una variabile aleatoria che indica invece il valore di target
* Quando si fanno delle inferenze di tipo probabilistico sul valore di target,
  uno dei metodi che si utilizzano piu' spesso corrisponde alla
  ***massimizzazine della probabilita' a posteriori*** (MAP), cioe' si considera
  la probabilita' corrispondente al valore target $y$ piu' probabile. Questo e'
  ragionevole dal momento che la probabilita' piu' alta minimizza l'errore.
* Cio' corrisponde a scegliere il valore $y$ che massimizzi la probabilita'
  sapendo che l'esempio sia $X$. Siccome $X$ e' fisso, l'unica parte variabile
  sara' $y$, per cui possiamo ignorare nella legge di Bayes il termine $P(X)$
  siccome non ne influenza il valore, e limitarci a massimizzare solo il
  numeratore

* I modelli probabilistici si dividono in due tipologie principali:
    * ***Modelli Discriminativi***: modellano la distribuzione di probabilita' a
      posteriori $P(Y \; | \; X)$. Si focalizzano sulla scelta della classe data
      l'istanza, scegliendo la classe piu' probabile per $X$. Non hanno
      l'obiettivo di descrivere in termini assoluti la distribuzione delle
      classi in modo che si possa utilizzare per determinare quale sia quella
      piu' probabile data una istanza da classificare
    * ***Modelli Generativi***: modellano la distribuzione di probabilita' della
      classe in termini di features, in maniera congiunta ($P(X, Y)$). Si pone
      l'obiettivo di modellare *come si distribuiscono le caratteristiche
      all'interno delle varie classi*. Nonostante siano piu' espressivi, i
      modelli generativi non si usano sempre, perche' richiedono una quantita'
      molto grande di dati in modo che siano statisticamente significativi.
      Avere dei modelli generativi permette in oltre di **creare** esempi
      verosimili di una determinata classe, perche' vengono creati a partire
      dalle distribuzioni di probabilita' delle features

> *Nota: Esistono al giorno d'oggi dei modelli chiamati GAN (Generative
  Adversarial Networks) che modellano in maniera generativa le classi*

* Caratteristiche dei modelli generativi:
    * Un modello generativo richiede di memorizzare la distribuzione di
      probabilita' congiunta, che aumenta esponenzialmente in dimensioni
      rispetto al numero delle features. Tuttavia, e' possibile semplificare lo
      spazio delle ipotesi introducendo l'indipendenza delle features (*naive
      Bayes*)
    * Ci sono casi in cui non riescono a modellare tanto bene come si
      distribuiscono le features tra le varie classi. Magari in una classe il
      modello e' molto preciso a descriverla in termini di combinazioni di
      valori di features mentre in altre no. In altri termini, e' possibile che
      l'accuratezza di $P(X)$ potrebbe essere non bilanciata rispetto
      all'accuratezza di $P(Y | X)$. Nonostante cio', se $P(X)$ e' piccola,
      sappiamo che sara' molto poco probabile che arrivino esempi di quel tipo,
      per cui il tasso di missclassificazione rimane molto basso.
    * L'apprendimento dai dati puo' essere visto come un processo progressivo di
      riduzione dell'incertezza (cioe' dell'entropia)

## Apprendimento come riduzione dell'incertezza
* Supponiamo di voler stimare la probabilita' a priori $\theta$ ($P(Y)$)
  che una email sia spam
    * Una stima iniziale e' stimare $\hat{\theta} = d/n$ dove $d$ e' il numero
      di istanze che sono spam
    * La stima data pero' e' una stima di massimizzazione della probabilita' a
      posteriori, per cui non significa che altri valori di $\theta$ siano
      completamente esclusi. Per poteri considerare, e' piu' appropriato
      modellare il valore $\theta$ come una distribuzione di probabilita'
      binomiale ($\beta$-*distribution*).
    * Ogni volta che si ispeziona una email si aggiorna la distribuzione, si
      riducendo l'incertezza riguardo la probabilita' di spam $\theta$. In
      questo modo la distribuzione si "*schiaccia*" aumentando in altezza e
      diminuendo in larghezza verso uno specifico valore di likelihood di
      classe.

* In sostanza il metodo puo' essere riassunto nei seguenti passaggi:
    1. Fai una stima iniziale a priori $P(Y)$
    2. Aggiorna la stima iniziale guardandondo i dati, producendo una stima a
       posteriori $P(Y \; | \; X)$
    3. Riutilizza come stima iniziale a priori la stima prodotta a posteriori
       $P(Y) = P(Y \; | \; X)$

![Distribuzione di probabilita' di $\theta$ man mano che consideriamo nuovi
esempi di emails. In questo caso abbiamo 1 non spam e tutte il resto
spams](img/distribution_theta.png)

* La riduzione di incertezza corrisponde ad una riduzione della varianza.
  Notiamo che nel picco (con $n=10$) la varianza e' molto bassa significa che
  l'incertezza e' bassa di conseguenza
* Andando a modellare la stima attraverso una distribuzione di probabilita'
  otteniamo inoltre diversi vantaggi:
    * Possiamo generare un modello *generativo*, per cui campionare dalla
      distribuzione ci permette di creare nuove istanze verosimili (i metodi
      Monte Carlo fanno una cosa simile)
    * Come gia' detto e' possibile misurare l'incertezza misurando semplicemente
      la varianza rimanente
    * Possiamo quantificare la probabilita' di affermazioni sul parametro stesso

> *In breve, la prospettiva Bayesiana consiste nell'usare queste distribuzioni
per codificare le nostre credenze. In questo modo si possono associare delle
distribuzioni di probabilita' ad ogni cosa: non solo a features e a valori
targets ma anche a parametri e modelli stessi.*

* Un qualunque modello di predizione, se si comporta come si comporterebbe il
  teorema di Bayes (avendo opportunamente modellato le probabilita'
  necessarie), e quindi farebbe le stesse conclusioni che farebbe il teorema di
  Bayes, allora tale modello e' detto **Bayes ottimale**

> *Risultati teorici dicono che un classificatore probabilistico non puo' fare
meglio del teorema di Bayes, cioe' il teorema di Bayes e' il meglio
raggiungibile da un modello*

## Modelli Probabilistici e Significato Geometrico
* E' possibile vedere delle connessioni tra i modelli probabilistici e i
  modelli geometrici. Per far cio' introduciamo prima alcune definizioni

> **Distribuzione Normale Univariata**: La distribuzione normale (o Gaussiana)
  ha la seguente pdf
  $$
  P(x | \mu, \sigma) = \frac{1}{\sqrt{2\pi} \sigma}
  exp\left( - \frac{1}{2} \left[ \frac{x - \mu}{\sigma}\right]^2 \right)
  $$
  dove $\mu$ e' la media e $\sigma$ la deviazione standard.

> **Distribuzione Normale Multivariata**:
  $$
  P(x | \mu, \Sigma) = \frac{1}{(2\pi)^{d/2} \sqrt{|\Sigma|}}
  exp\left( - \frac{1}{2} (x - \mu)^T \Sigma^{-1} (x - \mu) \right)
  $$
  in cui $x = (x_1, \dots, x_d)^T \in \mathbb{R}^d$ e $\Sigma$ e' la
  matrice della covarianza. $\mu = (\mu_1, \dots, \mu_d)$ e' il vettore che
  contiene le medie rispetto ai singoli valori di $x$

## Connessione 1
* Sviluppiamo ora un possibile modello probabilistico e confrontiamolo con
  quello geometrico. Noteremo delle connessioni interessanti.
* Iniziamo considerando il caso univariato in due classi, per cui sappiamo
  che le istanze sono rappresentate da una sola feature $x \in \mathbb{R}$.
* Diciamo che il modello e' ***misto*** se ipotizziamo che le classi siano
  state "generate" da una legge di tipo probabilistico.
  Cio' significa che ogni classe ha la propria *distribuzione di probabilita'*,
  che puo' essere diversa dall'altra. Diciamo inoltre che entrambe sono
  delle distribuzioni *Gaussiane*, per cui parliamo di modello a ***mistura di
  Gaussiane***.
* Rappresentiamo quindi la distribuzione delle classi secondo delle Gaussiane:
  $$
  P(x | \oplus) = \frac{1}{\sqrt{2 \pi} \sigma^{\oplus}} exp\left(-\frac{1}{2}
  \left[ \frac{x - \mu^{\oplus}}{\sigma^{\oplus}} \right]^{2} \right), \quad
  P(x | \ominus) = \frac{1}{\sqrt{2 \pi} \sigma^{\ominus}} exp\left(-\frac{1}{2}
  \left[ \frac{x - \mu^{\ominus}}{\sigma^{\ominus}} \right]^{2} \right)
  $$
* Poiche' il valore della classe e' fissato, stiamo parlando di Likelihood. In
  altri termini le funzioni ci descrivono la **probabilita' di ottenere uno
  specifico esempio in una classe fissata**.
* Per poter definire il decision boundary del modello, sfruttiamo le proprieta'
  degli esponenti e definiamo il ***Likelihood Ratio*** come:
  $$
  LR(x) = \frac{P(x | \oplus)}{P(x | \ominus)} =
  \frac{\sigma^{\oplus}}{\sigma^{\ominus}} exp\left(-\frac{1}{2} \left[
  \left(\frac{x - \mu^{\oplus}}{\sigma^{\oplus}}\right)^{2} - \left( \frac{x -
  \mu^{\ominus}}{\sigma^{\ominus}}\right)^{2} \right] \right)
  $$

> Si noti che il decision boundary coincidera' con tutti quei punti in cui **LR
  = 1**, per cui quando le probabilita' delle due classi sono uguali, e non si
  puo' prendere una decisione.

* Consideriamo ora un caso specifico e supponiamo che le due componenti abbiano
  la stessa deviazione standard $\sigma^{\oplus} = \sigma^{\ominus} = \sigma$.
  Ne deriva (calcoli omessi) che
  $$
  LR(x) = exp \left[ \gamma(x - \mu) \right]
  $$
  in cui
    * $\gamma = (\mu^{\oplus} - \mu^{\ominus})/\sigma^2$ e' la differenza tra le
      medie in proporzione alla varianza
    * $\mu = (\mu^{\oplus} + \mu^{\ominus})/2$ e' il **punto medio** tra le medie
      delle due classi
* Dalla relazione precedente, ne segue che il punto di decisione e' situato al
  valore di $x = \mu$ (cioe' il punto medio tra le due classi), poiche' rende
  $LR(x) = 1$.
* Possiamo quindi ottenere un classificatore lineare di base scegliendo come
  decision boundary la linea bisettrice perpendicolare al segmento che
  connette $\mu^{\oplus}$ e $\mu^{\ominus}$.
* In generale, quando $\Sigma^{\oplus} = \Sigma^{\ominus}$ il decision boundary
  interseca il segmento $\mu^{\oplus} - \mu^{\ominus}$ nel mezzo, **con un
  angolo retto se le features nons ono correlate**, mentre con **un angolo non
  retto se le features sono correlate***
* Alternativamente, quando $\Sigma^{\oplus} \neq \Sigma^{\ominus}$ **il decision
  boundary e' iperbolico** (cioe' coincide con un intervallo delimitato dai punti
  n cui le pdf si intersecano). In altri termini, non e' contiguo all'interno
  dello spazio degli esempi.

> *Piu' in generale, ne segue che $LR(x) = 1$ per tutte le istanze $x$ che sono
  equidistanti dai centroidi rappresentati dai vettori $\mu^{\oplus}$ e
  $\mu^{\ominus}$. Ma questo significa che il decision boundary sara' una linea
  dritta a distanza uguale dalle medie, per cui equivale ad un classificatore
  lineare*

* Da questa ultima osservazione possiamo dire che nel caso in cui le features
  Gaussiane non siano correlate e abbiano varianza unitaria, il classificatore
  lineare e' **Bayes Ottimale**
  Piu' in generale quando le matrici di covarianza sono uguali (features non
  correlate), il decision boundary e' lineare ed e' perpendicolare al segmento
  $\mu^{\oplus} - \mu^{\ominus}$.

### Connessione 2
* La distribuzione multivariata essenzialmente traduce distanze in probabilita'.
  E questo lo si vede poiche' compare la definizione della distanza di
  Mahalanobis. Conseguentemente, compare la definizione di distanza Euclidea in
  quella univariata.
* Se consideriamo il logaritmo negativo della likelihood Gaussiana, possiamo
  interpretarlo come la distanza al quadrato tra $x$ e la media
* Un'altro esempio di connessione tra prospettive geometriche e probabilistiche
  lo si vede quando si vogliono stimare i parametridi di una Gaussiana.

### Connessione 3
* Ipotizziamo che si voglia stimare il parametro $\mu$ di una distribuzione con
  matrice di coviarianza $\Sigma$ da un set di istanze $X$. Per far cio'
  utilizzeremo il principio di **MLE**
* Facciamo anche l'ipotesi che le istanze del dataset siano state "*generate*"
  in maniera indipendente l'una dall'altra. Cioe' se prendessimo un campione
  preso della popolazione, e scegliessimo a caso un'altro campione: la scelta di
  uno non determina il risultato di quello seguente
* Utilizzando questa ipotesi di indipendenza, possiamo formulare la likelihood
  di *tutto il dataset* come la produttoria della likelihood delle singole
  istanze
  $$
  \prod_{X_i \in D} P(X_i | Y = y), \quad y \in \{ \oplus, \ominus \}
  $$
* Per stimare $\mu$ data la matrice $\Sigma$, il principio di **maximum
  likelihood estimation** ci dice che $\mu$ deve coincidere con il valore che
  massimizza la likelihood di $X$ (assumendo che le istanze che compongono $X$
  siano state campionate indipendentemente)
  $$
  \begin{aligned}
  \hat{\mu} &= \arg \max_{\mu} P(x \;|\; \mu, \Sigma) \\
          & \vdots \\
          &= \arg \min_{\mu} \sum_{x \in X} (Dis_M(x, \mu \;|\; \Sigma))^2
  \end{aligned}
  $$
  Troviamo quindi che la stima di massimo likelihood corrisponde al punto che
  minimizza la somma delle distanze di Mahalanobis al quadrato di tutti i punti
  in $X$. $\mu$ e' il vettore piu' vicino rispetto a tutti, cioe' il
  *centroide*, ma questo corrisponde proprio al significato intuitivo e
  geometrico dell'apprendimento.

## Modelli Probabilistici per Dati Categorici
* Sappiamo che una variabile aleatoria $X$ e' una variabile che puo' assumere i
  valori $\{ x_i \}, i=1, \dots, d$ dove ogni valore $x_i$ ha una certa
  probabilita' $\theta_i$ di valorizzare la variabile.
* Vogliamo classificare dei documenti come **spam** o **ham**, data l'occorrenza
  di diverse parole all'interno di un vocabolario prefissato di $d$ parole.
* Rappresentiamo le occorrenze di ogni parola $i$ in un documento con una
  *variabile aleatoria discreta* $X_i$, in quanto, preso un documento non
  sappiamo quante occorrenze delle parole contenga a priori.
* Quando abbiamo classi di documenti (ad esempio *spam* o *ham* nel caso dello
  spam filter) differenti, e' ragionevole pensare che diverse classi abbiano
  distribuzione diversa dell'occorrenza di parole, per cui ipotizzando di avere
  due classi $\oplus, \ominus$, avremo $\theta_i^{\oplus}$ e
  $\theta_i^{\ominus}$
* Abbiamo principalmente due modi differenti per modellare i documenti dal punto
  di vista probabilistico

### Modello Bernoulliano Multivariato

> Un test bernoulliano e' una domanda "*binaria*" che puo' avere solo due
  outcomes (T/F)

* In questo tipo di approccio, la singola variabile $X_i$ corrisponente alla
  *i-esima* parola rappresenta la presenza/assenza della stessa in un dato
  documento. Tale variabile ha una distribuzione di due valori: successo
  ($P(X=1)=\theta$) o fallimento ($P(X=0)=1-\theta$).

* Ogni documento e' quindi equivalente ad un vettore di variabili aleatorie
  Bernoulliane $X = (X_1, \dots, X_d)$.
* La distribuzione di probabilita' dell'intero vettore $X$ e' chiamata
  ***distribuzione di Bernoulli multivariata***.

> *La distribuzione di Bernoulli e' un caso speciale della distribuzione
binomiale, in cui $k$ (il numero di trials) e' 1*

* Il modello in memoria si salva una matrice $M^{n \times d}$, dove $n$ e' il
  numero di documenti e $d$ sono le parole nel vocabolario. Tale matrice
  booleana, vale $1$ in corrispondenza della parola $j$ nel documento $i$, e
  indica la presenza di quella data parola in quel dato documento.
* Facendo cio' e' possibile quindi stimare le singole $P(X_j=1) = \theta_j$:
  $$
  \theta_j = \frac{\sum_{i=0}^{n} M(i, j)}{n}
  $$
  cioe' il rapporto del numero di documenti che contengono la parola *j-esima*
  sul numero dei documenti totali.

### Modello Bernoulliano Multinomiale
* Il modello Bernoulliano Multinomiale e' una generalizzazione di quello
  Multivariato, in cui non ci si limita a rappresentare se una parola e'
  presente o meno ma conta la **frequenza** delle occorrenze di una parola
  all'interno del documento
* Il modello usa una variabile aleatoria $X_i$ che rappresenta il numero di
  occorrenze della parola $i$ nel documento. La probabilita' $\theta_i$ indica
  la probabilita' di trovare quel numero di occorrenze della parola $i$ nel
  testo.
* La distribuzione **binomiale** modella il numero di eventi di successo $S$ (in
  questo caso il numero di occorrenze della parola) in $n$ prove che sono
  indipendenti l'una dall'altra. Le prove consistono nel vedere se nella
  posizione di un documento composto da $n$ parole c'e' quella parola. La
  singola prova corrisponde ad un Bernoulli trial
  $$
  P(S = k) = \binom{n}{k} \theta^k (1 - \theta)^{(n-k)}
  $$
* Se prima nel modello multivariato un Bernoulli trial era il singolo
  *documento*, in questo caso il singolo trial e' una *singola posizione* di una
  parola nel documento.
* Il modello rappresenta il singolo documento con un vettore $X = (X_1, \dots,
  X_d)$, che rappresenta le *frequenze* (cioe' quante volte compaiono) delle
  parole all'interno del documento, in altri termini lo rappresenta con un
  istogramma
* Come gia' detto, il modello vede il documento come un processo di Bernoulli di
  $n$ prove. La singola probabilita' della parola $i$ di comparire in una
  qualsiasi prova e' $P(X_i = 0) = \theta_i$ e $P(X_i = 1) = 1 - \theta_i$.
* Utilizziamo una distribuzione **multinomiale** per modellare la stima della
  probabilita' tenendo conto delle $d$ variabili in tutte le posizioni del
  documento composto da $n$ parole:
  $$
  P(X=(x_1, \dots, x_d)) = n! \frac{\theta_1^{x_1}}{x_1!} \dots \frac{\theta_d^{x_d}}{x_d!}
  $$
  In sostanza non e' altro che la **generalizzazione** della distribuzione
  binomiale vista poch'anzi. Ongi singola parola ha la sua probabilita' di
  comparsa $\theta_i$, elevata al numero di volte che compare $x_i$. I
  fattoriali al denominatore servono a tener conto delle posizioni di comparsa
  delle parole nel testo.

## Naive Bayes
* Entrambi i modelli visti in precedenza funzionano grazie all'ipotesi di
  ***naive Bayes***: utilizzano il teorema di Bayes per stimare la probabilita'
  della classe, le osservazioni date dalle frequenze per stimare la probabilita'
  di comparsa delle parole nei documenti di una certa classe, facendo
  l'assunzione che la comparsa delle parole sia indipendente dalla comparsa
  delle altre
* In questo modo possiamo evitare di rappresentare la likelihood condizionata
  alla classe ma in maniera *congiunta* rispetto a tutte le parole del
  vocabolario. (si pensi ad esempio che il vocabolario Inglese ha 8000 parole)
* In generale, l'ipotesi di indipendenza non rispecchia la realta'. Si pensi ad
  esempio di osservare la parola `Viagra` in un documento, per cui sara' molto
  piu' probabile che compaia `pills` come parola successiva. Nonostante questo,
  anche con l'ipotesi di indipendenza il modello da una stima particolarmente
  accurata delle distribuzioni
* Riassumiamo infine formalmente cio' che viene fatto con le ipotesi di Naive
  Bayes:
    1. Assumiamo che le istanze siano rappresentate su $d$ attributi
    2. Applicando il teorema di Bayes, facciamo una stima di massimizzazione a
       posteriori. Cio' corrisponde a trovare il valore di $Y$ tale che
       massimizzi
       $$
       P(Y | X_1, \dots, X_d)=
       \frac{P(X_1, \dots, X_d | Y) P(Y)}{\cancel{P(X_1, \dots, X_d)}}
       $$
    3. Stimare $P(X_1, \dots, X_d | Y)$ e' difficile
    4. Facendo l'ipotesi di indipendenza tra attributi $X_i$ otteniamo
       $$
       P(X_1, \dots, X_d | Y) = P(X_1 | Y)P(X_2|Y) \dots P(X_d | Y)
       $$
       che e' piu' semplice da stimare

### Regole di Decisione Probabilistiche
* Con Naive Bayes calcoliamo la probabilita' di ottenere un esempio supponendo
  di essere in una data classe (*likelihood*). Piu' le likelihood sono
  differenti tra loro, piu' saranno utili le features di $X$ nella
  classificazione.
* Dopo aver scelto una delle distribuzioni per modellare i nostri dati, per un
  singolo esempio $x$ calcoliamo le likelihood della classe positiva $P(X |
  Y=\oplus)$ e negativa $P(X | Y=\ominus)$, per poi applicare una delle
  possibili regole di decisione:

    1. `maximum likelihood (ML)` - $\arg \max_y P(X = x | Y = y)$
    2. `maximum a posteriori (MAP)` - $\arg \max_y P(X = x | Y = y)P(Y= y)$
    3. `recalibrated likelihood` - $\arg \max_y w_y P(X = x | Y = y)$

* Le regole di decisione 1. e 2. sono equivalenti quando la distribuzione delle
  classi e' **uniforme**. La terza generalizza le prime due sostituendo la
  distribuzione delle classi ($P(Y = y)$) con dei pesi appresi dai dati tali che
  minimizzino la perdita.
* La regola del recalibrated likelihood si utilizza in caso le distribuioni
  siano scalibrate.

### Apprendimento di un modello Naive Bayes
* L'apprendimento dei modelli consiste anche nella stima dei parametri delle
  distribuzioni $\theta$. Ad esempio, nel caso di un modello multivariato
  possiamo stimarlo come $\hat{\theta}=d/n$, cioe' contando il numero di
  documenti in cui esce la parola in questione ($d$) sul numero dei documenti
  totali ($n$)
* E' possibile pero' che alcune parole non compaiano mai all'interno del
  training set. Anche se poco probabili devono essere considerate
  comunque, per cui si applica uno smoothing alla stima $\hat{\theta}$,
  andando ad aggiungere degli ***pseudo counts*** nel training set. Essi sono
  essenzialmente 2 documenti: uno contenente tutte le parole e uno che non ne
  contiene nessuna. L'aggiunta di questi due documenti corrisponde ad effettuare
  una ***Laplace Smoothing*** rendendo la stima $\hat{\theta}=d+1/n+2$.
* Applicare questo smoothing permette di dare una chance anche quelle parole che
  sono presenti nel vocabolario ma che non appaiono neanche una volta nel
  dataset

![Inserimento di outliers (*pseudocounts*) per applicare uno
smoothing](img/correction_naive_bayes.png){ width=70% }

* Guardare Esempio 9.5

> Il main takeaway dell'esempio e' che cambia in generale il conteggio in base
al tipo di distribuzione che si sceglie.

## Regressione Logistica
* Fino ad ora abbiamo visto modelli generativi di Naive Bayes, vedremo ora
  un modello discriminativo: la **Regressione Logistica**
* Nella regressione lineare le variabili sono connesse tra loro tramite una
  relazione di tipo lineare, in cui il goal e' quello di predirre l'output
  $y_i$, che e' un valore **reale**
  $$
  y_i = \beta_0 + \beta_1 x_{i1} + \dots + \beta_d x_{id}
  $$
* Nella regressione logistica, invece, vogliamo predirre il valore di una
  variabile binaria (ad esempio il valore di una classe *positiva/negativa*)
  In questo caso si vuole predirre il valore di una variabile casuale $Y_i$ che
  vale $1$/$0$ in caso la classe sia positiva/negativa per l'esempio $i$
* Piu' precisamente, vogliamo stimare $P(Y_i|X_i)$. Sappiamo che $Y_i$ e' una
  variabile con una distribuzione di Bernoulli.
* L'intuizione principale, e' quella che la regressione logistica utilizza la
  regressione lineare per stimare i parametri della distribuzione (cioe' la
  probabilita' di successo $\hat{\theta}$) che sono poi ***logisticamente
  ricalibrati***
* Siccome i parametri della distribuzione sono delle stime di probabilita',
  bisogna rendere il valore di output della regressione lineare tra 0 e 1.
  Per far cio' si utilizza una funzione sigmoide (da qui il nome logistica), che
  trasforma il range del valore in output della regressione da $[- \infty;
  +\infty]$ a $[0,1]$. Inserendo quindi della regressione lineare all'interno
  della sigmoide otteniamo:
  $$
  P(Y_i | x_i) = \frac{exp^{\beta_0 + \beta_1 x_{i1} + \dots + \beta_d x_{id}}}
                    {1+ exp^{\beta_0 + \beta_1 x_{i1} + \dots + \beta_d x_{id}}}
  $$
* Nella realta' per semplificare i calcoli si passa attraverso il logaritmo
  degli odds (probabilita' della classe positiva sulla probabilita' della classe
  negativa)
  $$
  \begin{aligned}
  Odds(x_i) &= \frac{P(y_i | x_i)}{1 - P(y_i | x_i)} = exp^{\beta_0 + \beta_1
  x_{i1} + \dots + \beta_d x_{id}} \\[2ex]
  ln(Odds(x_{i0})) &= \beta_0 + \beta_1 x_{i1} + \dots + \beta_d x_{id}
  \end{aligned}
  $$
  L'interpretazione del logaritmo ci dice che se qualora sia $<0$, allora la
  probabilita' di predirre una classe positiva e' piu' piccola di quella
  negativa. Viceversa quando e' $>0$. Cosi' come nella likelihood, il decision
  boundary e' al valore $0$, per cui non si riesce a prendere una decisione tra
  le due classi.

> La regressione logistica e' uno dei modelli piu' utilizzati dagli statistici

* La regressione logistica puo' anche funzionare quando le **variabili sono
  categoriche**. Per far cio', prendiamo per esempio il caso in cui la feature
  categorica $X$ possa valere $A$ oppure $B$, per cui si puo' costruire la
  seguente tabella di contingenza:

![Tabella di contingenza in cui sono segnate le frequenze in cui compare il
valore $A$ e $B$ negli esempi all'interno delle classi positive e
negative](img/contingency_table_logreg.png){ width=30% }

* L'$Odds$ dei valori della feature sono facilmente calcolabili:
  $$
  \begin{aligned}
      Odds(A) = \frac{P(Y=1 | X=A)}{P(Y=0 | X=A)} &=
      \frac{n_{A1}}{n_{A0}}\\[2ex]
      Odds(B) = \frac{P(Y=1 | X=B)}{P(Y=0 | X=B)} &= \frac{n_{B1}}{n_{B0}}
  \end{aligned}
  $$
  Per ottenere la regressione logistica, si sostituisce nella formula di
  regressione
  $$
  ln(Odds(x_i)) = \beta_0 + \beta_1 x_{i1} + \dots + \beta_d x_{id}
  $$
  il valore di $Odds(x_{ij})$ al posto del valore della feature categorica
  $x_{ij}$
* L'odds intuitivamente mi dice quanto e' piu' possibile che un esempio
  osservato con quel valore della feature specifico sia assegnato alla classe
  positiva piuttosto che alla classe negativa
* Nel libro viene trattato in modo leggermente differente:
    * Supponiamo di avere un regressore $p(x) = w \cdot x - t$ (che corrisponde
      a $w_1, \dots, w_d = \beta_1, \dots, \beta_d$ e $-t = \beta_0$)
    * Applichiamo una normalizzazione logistica
      $$
      \hat{p}(x) = \frac{exp(w \cdot x - t)}{1 + exp(w \cdot x - t)}
                 = \frac{1}{1 + exp(-(w \cdot x - t))}
      $$
   * Se assumiamo che la distribuzione sia di Bernoulli e le classi siano
     $y=0/1$ per negativa/positiva, per ottenere $P(y_i | x_i)$ basta sostituire
     il valore del regressore normalizzato $\hat{p}(x)$ al valore $\theta$
     all'interno della distribuzione di Bernoulli:
     $$
     P(y_i | x_i) = \hat{p}(x_i)^{y_i} (1 -  \hat{p}(x_i))^{(1 - y_i)}
     $$
* Il processo di conversione di un valore arbitrario a una probabilta' e'
  chiamato ***calibrazione***
* La regressione logistica differisce dalla regressione lineare perche' tende a
  modellare piu' accuratamente gli esempi piu' vicini al decision boundary (nei
  punti in cui le due classi si sovrappongono di piu').

#### Apprendimento di regressori logistici
* L'apprendimento di un Logistic Regressor concerne il trovare i parametri del
  regressore lineare che massimizzino la likelihood (che corrisponde quindi ad
  un *Maximum Likelihood Estimation*).
* Possiamo ottenere la ***conditional likelihood*** nel modo seguente:
  $$
  CL(w, t) = \prod_i P(y_i | x_i) = \prod_i \hat{p}(x_i)^{y_i} (1 -
  \hat{p}(x_i))^{(1 - y_i)}
  $$
* Per massimizzare $CL$ ne consideriamo il logaritmo $LCL$ e se ne fa la
  derivata parziale rispetto a $w$ e $t$, ponendole a $0$.
* Omessi i calcoli, si ottiene che
  $$
  \frac{\partial}{\partial t} LCL(w, t) = \sum_{x_i \in Tr} (\hat{p}(x_i) - y_i)
  = 0
  $$
  otteniamo che per rendere il piu' possibile la quantita' precedente a 0 e'
  necessario che la probabilita' predetta debba essere uguale alla proporzione
  dei positivi $pos$. In altri termini ci dice bisogna trovare una stima
  $\hat{p}$ che minimizzi gli errori ($\hat{p}(x_i) - y_i$)
* Si noti che i ranking trees hanno questa proprieta' dal momento che assegnano
  come probabilita' predette le probabilita' empiriche di un segmento
* L'apprendimento di un modello a regressione logistica puo' essere ridotto
  quindi al seguente problema di ottimizzazione:
  $$
  w*, t* = \arg \max_{w, t} CL(w, t) = \arg \max_{w, t} LCL(w, t)
  $$
  (`LCL` e' il logaritmo della conditional likelihood `CL`)
* Tale problema di ottimizzazione e' ***convesso*** (esiste una e una sola
  soluzione), per cui esistono diversi metodi combinatori per ottimizzarlo
* Uno degli approcci piu' semplici che vengono applicati e' quello dato dalla
  seguente regola di update:
  $$
  \textbf{w}' = \textbf{w} + \eta (y_i - \hat{p}_i) \textbf{x}_i
  $$
  in cui $\eta$ e' il *learning rate*. Tale metodo e' utilizzato inoltre per
  l'apprendimento dei *percettroni* nelle Reti Neurali Profonde.
* In questa regola di update, notiamo come l'errore $(y_i - \hat{p}_i)$ indichi
  la **direzione** da prendere per il possimo valore: se l'errore e' positivo,
  il prossimo valore di $\textbf{w}$ sara' piu' grande del precedente, se
  negativo sara' piu' piccolo.
*
