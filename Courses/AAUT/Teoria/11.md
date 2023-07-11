\newpage
# Esperimenti nel Machine Learning
* Nei capitoli precedenti abbiamo visto che esistono diverse condizioni o
  distribuzioni di dati in cui alcuni modelli sono ottimali (per esempio
  per Naive Bayes o per il classificatore lineare di base)
* In applicazioni reali, pero', vorremmo sapere se la convergenza dell'algoritmo
  di apprendimento al modello ottimale possa avvenire in un tempo praticabile,
  per cui abbiamo bisogno di dati provenienti da tali domini applicativi per
  poter **testare le performance degli algoritmi di apprendimento e dei modelli
  appresi**.
* L'idea e' quella di valutare diversi modelli anche su datasets differenti,
  ottenendo diverse misure che serviranno a rispondere a determinate domande sui
  modelli utilizzati.
* La scelta delle metriche di performanca da utilizzare, e' guidata dalle
  **assunzioni** che vengono fatte sulle condizioni operative del modello:
  * ***Accuratezza***: buona quando la distribuzione delle classi nel test set
    e' *rappresentativa delle condizioni operative del modello*
    $$
    accuracy = \frac{TP+TN}{TP+TN+FP+FN}
    $$
  * ***Average Recall***: buona quando la distribuzione delle classi nel test
    set e' *ugualmente bilanciata* $(50%/50%)$
    $$
    avg-recall = \frac{tpr}{2} + \frac{tnr}{2}
    $$
  * ***Precision and recall***: media tra *precision* (abilita' del modello di
    classificare la classe positiva correttamente) e *recall*. Il
    problema e' che questa stima ignora i *true negatives* dal momento che
    considera solo la classe positiva.
    $$
    precision = \frac{TP}{TP+FP} \; recall = \frac{TP}{TP+FN}
    $$
  * **AUC** (*Area Under The Curve*): buona per i ranker classifiers
* All'interno delle misurazioni, e' quasi impossibile non trovare dell'errore.
  Pensiamo ad esempio di misurare piu' volte l'altezza di una persona.
  Sicuramente tra una misura e l'altra ci aspettiamo delle variazioni.
* Questa variazione puo' essere moodellata trattando le misure come una
  variabile casuale. Siccome la media e la varianza di tale variabile non sono
  note, si possono stimare attraverso un trucco molto noto.
* Si considera la media di $k$ misurazioni, in modo da diminuire la varianza
  totale della stima fino a $\frac{\sigma^2}{k}$, ma funziona solo se le
  misurazioni sono *indipendenti* l'una dall'altra.
  *Dim*.
  $$
  Var(\overline{X_k}) = Var(\frac{1}{k} (X_1 + \dots + X_k)) = \frac{1}{k} Var(X_1
  + \dots + X_k) = \frac{k \sigma^2}{k^2} = \frac{\sigma^2}{k}
  $$
  Questo segue dalla proprieta' della varianza. supponendo l'indipendenza degli
  eventi ($Var(\alpha \cdot X) = \alpha^2 \cdot Var(X), \; Var(\sum_i X_i) =
  \sum_i Var(X_i)$).
* Supponiamo ora di non voler stimare l'altezza ma di voler stimare
  l'accuratezza di un classificatore. Un modo naturale per modellare la
  situazione e' trattando ogni istanza del test set passata al classificatore
  come un test di Bernoulli (classificazione corretta/non corretta).
* Poniamo con $a$ (aka $\theta$) la probabilita' di una classificazione corretta
  di un singolo test
* Noi vogliamo stimare $\hat{a}$, che effettivamente corrisponde all'accuratezza
  complessiva del modello (cioe' la capacita', dato un esempio qualsiasi, di
  classificarlo correttamente)
* Possiamo stimare l'accuratezza utilizzando il valor medio $\hat{a} = A/n$ in
  cui $A$ e' il numero di esempi correttamente classificati nel *test set* dal
  modello
* Dal momento che ci sono piu' istanze nel test set, per modellare diversi lanci
  si utilizza una *variabile Binomiale*.
  La funzione di distribuzione di probabilita' della variabile e' una funzione
  con due parametri:
    * $a$ = probabilita' di successo di un singolo esperimento
    * $n$ = numero di esperimenti eseguiti
    * $f(a, n) = a(1-a)n$
* La varianza di un *singolo* esperimento Bernoulliano e' pari a $a(1 - a)$.
  Possiamo quindi usare il trucco precedente e dividere la quantita' per il
  numero di lanci in caso gli esperimenti siano indipendenti, per cui $a(1-a)/n$
  e' la stima della varianza di $A$.
* Ovviamente utilizziamo la ***stima*** di $a$, p er cui parliamo di ***stima
  della varianza*** $\hat{a}(1-\hat{a})/n$.

## Cross-Validation
* Se volessimo migliorare ulteriormente la stima, possiamo dividere il dataset
  in porzioni indipendenti e fare la stima dell'accuratezza in ciascuna di
  queste porzioni indipendenti.
* L'idea principale e' quella di fare la media di $k$ stime indipendenti
  $\hat{a}_i$ e calcolarne la loro varianza campionaria $\frac{1}{k-1}
  \sum^k_{i=1}(\hat{a}_i - \bar{a})^2$ dove $\bar{a}=\frac{1}{k} \sum^k_{i=1}
  \hat{a}_i$.
* Le $k$ stime di $a$ possiamo ottenerle campionando *indipendentemente* dal
  dataset $k$ sottoinsiemi di cardinalita' $n$ e stimare $a$ in ognuno di loro.
  (Viene fatto quando abbiamo molti dati, es *Big Data*)
* Quando non abbiamo molti dati a disposizione, pero', non possiamo fare la
  procedura seguente e utilizziamo la cosiddetta *cross-validation*
* L'idea della cross validation e' quella di partizionare il dataset in $k$
  partizioni chiamate *fold*. Un *fold* viene messo da parte e viene considerato
  come test set, mentre viene fatto l'apprendimento sui rimanenti $k-1$ folds.
  Il procedimento viene reiterato $k$ volte fin quando tutti i folds sono stati
  considerati come test set.
* Per ottenere l'accuratezza basta fare la media delle accuratezze di tutti i
  modelli sui test set. Quando siamo soddisfatti dei risultati possiamo infine
  fare il training sull'intero dataset

## Intervalli di confidenza
* Supponiamo che la stima dell'accuratezza $\hat{a}$ segua una distribuzione
  normale intorno alla *media reale* $a$ con deviazione standard $\sigma$.
  Assumendo per il momento che si sappiano a priori questi parametri, possiamo
  calcolare per ogni intervallo la *likelihood* che la stima *cada in un
  intervallo* calcolando l'area sotto la curva della distribuzione normale in
  quell'intervallo
* Per calcolare l'intervallo di confidenza sono necessarie due cose:
    * Conoscere la distribuzione della stima
    * Conoscere i parametri della distribuzione
* Nel caso dell'accuratezza che abbiamo visto fin'ora, sappiamo che la
  distribuzione e' binomiale, con varianza
  $\sigma^2=[\hat{a}(1-\hat{a})]/n$
* Calcolare l'intervallo di confidenza nel caso della binomiale non e' semplice
  poiche' non e' simmetrica. Possiamo allora approssimare la distribuzione
  binomiale ad una normale se la condizione seguente e' soddisfatta
  $$
  na(1-a) \geq 5
  $$
  per cui possiamo utilizzare una Gaussiana assumendo che $\sigma =
  \sqrt{\hat{A}(1-\hat{a}/n}$
* Sappiamo che l'intervallo di confidenza per la normale sara' $[a - 2\sigma, a
  + 2\sigma]$
* Gli intervalli di confidenza sono delle affermazioni su quanto e' probabile
  che le stime su un parametro sconosciuto ricada all'interno di un certo
  intervallo, assumendo che questo parametro abbiamo una distribuzione in
  accordo all'**ipotesi nulla**.
* **Esempio**:
    * Supponiamo di fare l'ipotesi nulla che l'accuratezza sia distribuita
      intorno ad una media di $0.5$, per cui si ottiene che $\sigma=0.05$
      (stimandola con la formula precedente) in un test set di 100 istanze
    * Avendo ottenuto dagli esperimenti una stima dell'accuratezza di $0.8$,
      calcoliamo la probabilita' che una stima sia $\geq 0.8$ data l'ipotesi
      nulla. Questa probabililta' e' chiamata **p-value**.
    * Se il *p-value* e' basso, l'ipotesi nulla e' inverosimile siccome il
      valore si discosta dall'ipotesi nulla.
    * Si utilizzano dei thesholds predefiniti per accettare/rifiutare le ipotesi
      nulle, chiamati *livelli di significativita'* $\alpha$
    * Ipotizziamo di utilizzare $\alpha = 5%$, per cui abbiamo che
      $p=1.9732 \cdot 10^{-9}$, il che e' molto piu' piccolo di $\alpha = 0.05$,
      dovendo quindi abbandonare l'ipotesi nulla a favore di una piu'
      verosimile.

## Paired *t-test*
* Utilizziamo gli intervalli di confidenza negli esperimenti effettuati con la
  cross validation. In questi esperimenti utilizzeremo le osservazioni
  accoppiate negli stessi fold.
* Per una coppia di algoritmi calcoliamo la differenza di accuratezza in ogni
  fold
* Utilizziamo l'ipotesi nulla che la media della distribuzione delle differenze
  sia 0. Calcoliamo poi il *p-value* usando la distribuzione di *t-student* e
  rifiutiamo l'ipotesi nulla se il *p-value* sta sotto il nostro livello di
  significativita' $\alpha$. Questo corrisponde a rifiutare l'ipotesi che non ci
  siano delle differenze tra i diversi algoritmi, dovendo riformulare un'ipotesi
  che ci dice che invece gli algoritmi hanno delle differenze.
* La distribuzione *t-student* si utilizza perche' pur assumendo che le
  differenze delle accuratezze siano distribuite in maniera normale non si ha
  comunque accesso alla deviazione standard reale delle differenze.
* *t-student* e' semplicemente una normale ma ha le code piu' *"spesse"*. Il
  *grado di liberta'* indica quanto sono spesse le code. Siccome siamo in
  un'esperimento di cross-validation, i DOF saranno pari a *numero di folds-1*

## Wilcoxon Test
* Il *t-test* non e' appropriato per comparare algoritmi su diversi datasets
  perche' le misure di performance non possono essere comparate tra loro siccome
  sarebbero sicuramente in disaccordo.
* Il *signed-rank test di Wilcoxon* e' un test che ci permette di comparare le
  performance di diversi algoritmi su diversi datasets.
    * L'idea e' quella di fare un ranking dei valori assoluti delle differenze
      delle misure
    * Calcoliamo poi la somma dei ranghi assegnati per differenze positive e
      negative prese separatamente e consideriamo la piu' piccola di queste
      somme come il test statistico.
    * La piu' piccola somma dei ranghi viene confrontata con il valore critico
      (corrispondente nella tabella): se minore o uguale allora l'ipotesi nulla
      (nessuna differenza in performance) viene rifiutata
* Per un numero grande di datasets (piu' di 25) questa statistica potrebbe
  essere approssimata alla distribuzione normale e si potrebbero utilizzare
  quindi gli intervalli di confidenza visti prima. Nel caso contrario si
  utilizza il Wilcoxon test
* Siccome questo test non fa nessuna assunzione sulla distribuzione delle
  differenze e' anche meno sensibile agli outliers
* Questa tipologia di test e' detta *non parametrica* nella terminologia
  statistica, cioe' significa che non assumono nessuna distribuzione. Sono
  l'opposto dei test parametrici come il *t-test* che assumono invece una
  distribuzione particolare.

> In generale i test parametrici sono piu' potenti quando la distribuzione che
  si assume e' appropriata, ma potrebbero essere ingannevoli nel caso non lo sia

## Friedman Test
* Se volessimo comparare $k$ algoritmi su $n$ datasets differenti, utilizzare il
  Wilcoxon's signed rank test porta a far crollare il livello di
  significativita' del test, per cui e' opportuno utilizzare il test di Friedman
* Come nel test di Wilcoxon, anche il test di Friedman e' un test non
  parametrico che utilizza il ranking delle performance
    * Preliminarmente si ordinano le performance dei $k$ algoritmi dalla
      migliore (rank $1$) alla peggiore (rank $k$)
    * Successivamente si costruisce una tabella in cui le singole entrate
      $R_{ij}$ indicano il rango dell'algoritmo $j$ sull'*i-esimo* dataset
    * Denotiamo poi con $R_j = (\sum_i R_{ij})/n$ il rango medio dell'algoritmo
      $j$. Sotto l'ipotesi nulla che tutti gli algoritmi sono uguali questa
      media dovrebbe essere uguale per tutti i $j$
    * Infine, per effettuare il test calcoliamo il rango medio effettivo
      $\bar{R}=\frac{k+1}{2}$ e lo compariamo con due quantita':
        - Varianza rispetto ai modelli: $n\sum_j (R_j - \bar{R})^2$
        - Varianza rispetto a tutte le osservazioni:
          $\frac{1}{n(k-1)} \sum_{ij} (R_{ij} - \bar{R})^2$
      e confrontiamo il rapporto delle due varianze. Se questo rapporto e'
      piccolo, vuol dire che i ranghi assegnati ai vari metodi non sono
      sufficientemente diversi rispetto ai ranghi assegnati in tabella, in
      quanto la varianza complessiva della tabella intera e' piu' o meno
      equiparabile a quando vengono raggruppati per modelli e confrontati
      rispetto al rango medio
    * Tale rapporto e' detto *statistica di Friedman*. Per fare il test la
      confrontiamo con il valore critico. Se minore o guale, allora **NON
      RIFIUTIAMO** l'ipotesi nulla, se no la rifiutiamo.

### Post-Hoc Test
* Siccome il test di Friedman ci da delle informazioni sul rango medio su tutti
  i modelli, un secondo test e' necessario per ottenere un'analisi che consideri
  le coppie di algoritmi. Tale analisi viene effettuata con il ***Post-Hoc
  test***, dopo aver effettuato il test di Friedman.
    * L'idea e' quella di calcolare la *differenza critica (CD)* e di compararla
      rispetto alla differenza dei ranghi medi di due algoritmi
    * Il ***test di Nemenyi*** calcola la differenza critica nel modo seguente:
      $$
      CD = q_{\alpha} \sqrt{\frac{k(k+1)}{6n}}
      $$
      dove $q_{\alpha}$ dipende dal livello di significativita' $\alpha$ cosi'
      come $k$.
    * Se la differenza del rango medio di due algoritmi e' piu' grande di $CD$,
      allora rifiutiamo l'ipotesi nulla.
* Al posto di considerare tutte le coppie di modelli come nel test di Nemenyi,
  possiamo utilizzare una sua variante che confronta tutti i modelli con un solo
  modello di riferimento. Tale variante prende il nome di ***test di
  Bonferroni-Dunn***.
