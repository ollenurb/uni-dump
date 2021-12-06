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

## Distribuzione Normale e significato geometrico
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

* Vediamo ora come possiamo utilizzare le distribuzioni normali per ottenere un
  modello probabilistico, chiamato a **mistura di Gaussiane***
* Consideriamo inizialmente il caso di due classi univariato $x\in \mathbb{R}$
  (cioe' le istanze possono essere solo positive o negative, e sono descritte da
  una sola feature reale)
* Per ottenere un modello a mistura di Gaussiane, ipotizziamo inoltre che
  ciascuna classe sia stata "generata" da una legge di tipo probabilistico.
  Cio' significa che ogni classe ha la propria *distribuzione di probabilita'*,
  che puo' essere diversa dall'altra. Assumeremo inoltre che entrambe siano
  delle distribuzioni *Gaussiane* (o normali)
  $$
  P(x | \oplus) = \frac{1}{\sqrt{2 \pi} \sigma^{\oplus}} exp\left(-\frac{1}{2}
  \left[ \frac{x - \mu^{\oplus}}{\sigma^{\oplus}} \right]^{2} \right), \quad
  P(x | \ominus) = \frac{1}{\sqrt{2 \pi} \sigma^{\ominus}} exp\left(-\frac{1}{2}
  \left[ \frac{x - \mu^{\ominus}}{\sigma^{\ominus}} \right]^{2} \right)
  $$
* In realta', stiamo parlando di Likelihood, poiche' il valore della classe e'
  fissato. In altri termini le funzioni ci descrivono la **probabilita' di
  ottenere uno specifico esempio in una classe fissata**.
* Per poter definire il decision boundary del modello, sfruttiamo le proprieta'
  degli esponenti e definiramo il ***Likelihood Ratio*** come:
  $$
  LR(x) = \frac{P(x | \oplus)}{P(x | \ominus)} =
  \frac{\sigma^{\oplus}}{\sigma^{\ominus}} exp\left(-\frac{1}{2} \left[
  \left(\frac{x - \mu^{\oplus}}{\sigma^{\oplus}}\right)^{2} - \left( \frac{x -
  \mu^{\ominus}}{\sigma^{\ominus}}\right)^{2} \right] \right)
  $$

> Si noti che il decision boundary coincidera' con tutti quei punti in cui **LR
  = 1**, per cui quando le probabilita' delle due classi sono uguali.

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
  valore di $x = \mu$ (cioe' il punto medio tra le due classi!), poiche' rende
  $LR(x) = 1$.
* Possiamo quindi ottenere un classificatore lineare di base scegliendo come
  decision boundary come la linea bisettrice perpendicolare al segmento che
  connette $\mu^{\oplus}$ e $\mu^{\ominus}$. Tale decision boundary e' inoltre
  ***Bayes ottimale***.

* In generale, quando $\Sigma^{\oplus} = \Sigma^{\ominus}$ il decision
  boundary interseca il segmento $\mu^{\oplus} - \mu^{\ominus}$ nel mezzo,
  **ma non con un angolo retto se le features sono correlate**
* Alternativamente, quando $\Sigma^{\oplus} \neq \Sigma^{\ominus}$ **il decision
  boundary e' iperbolico** (cioe' coincide con un intervallo delimitato dai punti
  n cui le pdf si intersecano)

## Principio di Maximum Likelihood Estimation
* Fino ad ora abbiamo visto la **likelyhood** come un fattore del teorema di
  Bayes $P(X | Y = y)$, che esprime la probabilita' di osservare una specifica
  istanza $X$ all'interno di una classe fissata
* Facciamo l'ipotesi che le istanze del dataset siano state "*generate*" in
  maniera indipendente l'una dall'altra. Cioe' se prendessimo un campione preso
  della popolazione, e scegliessimo a caso un'altro campione: la scelta di uno
  non determina il risultato di quello seguente
* Utilizzando questa ipotesi di indipendenza, possiamo formulare la likelihood
  di *tutto il dataset* come la produttoria della likelihood delle singole
  istanze
  $$
  \prod_{X_i \in D} P(X_i | Y = y), \quad y \in \{ \oplus, \ominus \}
  $$
* Come visto in precedenza, sappiamo che le likelihood sono descritte da delle
  distribuzioni Gaussiane $P(x | \oplus)$ e $P(x | \ominus)$ con media $\mu$ e
  varianza e $\Sigma$. Per stimare $\mu$ data la matrice $\Sigma$, il principio
  di **maximum likelihood estimation** ci dice che $\mu$ deve coincidere con il
  valore che massimizza la likelihood di $X$ (assumendo che le istanze che
  compongono $X$ siano state campionate indipendentemente)
  $$
  \begin{aligned}
  \hat{\mu} &= \arg \max_{\mu} P(x \;|\; \mu, \Sigma) \\
          & \vdots \\
          &= \arg \min_{\mu} \sum_{x \in X} (Dis_M(x, \mu \;|\; \Sigma))^2
  \end{aligned}
  $$
  Troviamo quindi che la stima di massimo likelihood corrisponde al punto che
  minimizza la somma delle distanze di Mahalanobis al quadrato di tutti i punti
  in $X$. ($\mu$ e' il vettore piu' vicino rispetto a tutti, cioe' il
  *centroide*)
* E' possibile inoltre derivare il modello di regressione lineare con questo
  principio. Si applica il principio di maximum likelihood estimation e si trova
  lo stesso modello che abbiamo ottenuto nel capitolo precedente

## Modelli Probabilistici per Dati Categorici
* Sappiamo che una variabile aleatoria $X$ e' una variabile che puo' assumere i
  valori $\{ x_i \}, i=1, \dots, d$ dove ogni valore $x_i$ ha una certa
  probabilita' $\theta_i$ di valorizzare la variabile.
* Rappresentiamo le occorrenze di ogni parola $i$ in un documento con una
  *variabile aleatoria discreta* $X_i$, in quanto, preso un documento non
  sappiamo quante occorrenze delle parole contenga a priori.
* Quando abbiamo classi di documenti (ad esempio *spam* o *ham* nel caso dello
  spam filter) differenti, e' ragionevole pensare che diverse classi abbiano
  distribuzione diversa dell'occorrenza di parole, per cui ipotizzando di avere
  due classi $\oplus, \ominus$, avremo $\theta_i^{\oplus}$ e
  $\theta_i^{\ominus}$
* L'occorrenza *di una parola* all'interno di un documento e' modellata da un
  **test Bernoulliano** (e quindi la v.a. sara' una v.a. Bernoulliana). Piu' in
  particolare, possiamo modellarla in due modi differenti utilizzando un modello
  Bernoulliano

### Modello Bernoulliano Multivariato
* La variabile $X_i$ corrisponente alla *i-esima* parola rappresenta la
  presenza/assenza in un dato documento, per cui corrisponde a modellare $X$
  come una variabile **Bernoulliana Binomiale**. Tale variabile ha una
  distribuzione di due valori: successo ($P(X=1)=\theta$) o fallimento
  ($P(X=0)=1-\theta$). Dal momento che abbiamo diverse parole nel vocabolario,
  il modello corrispondera' ad un vettore di variabili Binomiali Bernoulliane
  *indipendenti*, per cui in questo caso parliamo di **modello Bernoulliano
  multivariato**.
* Rappresentiamo un documento come un vettore di bit $X = (X_1, \dots, X_d)$, in
  cui $X_i \{0, 1\}$ rappresenta la presenza della parola *i-esima* nel
  documento.
  La probabilita' di presenza delle parole in un documento sara' rappresentato
  dal modello multivariato come un vettore di probabilita' $(\theta_1, \dots,
  \theta_d)$ in cui il singolo $\theta_i$ e' la probabilita' che la parola $i$
  sia nel documento
* Il modello in memoria si salva una matrice $M^{n \times d}$, dove $n$ e' il
  numero di documenti e $d$ sono le parole nel vocabolario. Tale matrice
  booleana, vale $1$ in corrispondenza della parola $j$ nel documento $i$, e
  indica la presenza di quella data parola in quel dato documento.
  E' possibile quindi stimare le probabilita' delle singole parole come:
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
* Il modello usa una variabile random $X_i$ che rappresenta il numero di
  occorrenze della parola $i$ nel documento. La probabilita' $\theta_i$ indica
  la probabilita' di trova quel numero di occorrenze della parola $i$ nel testo.
* 
