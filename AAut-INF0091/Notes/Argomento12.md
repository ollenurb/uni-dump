\newpage
# Esperimenti nel Machine Learning
* Questo capitolo riguarda come effettuare nella pratica degli esperimenti sui
  dati per confrontare diversi algoritmi di apprendimento
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
  Var(\overline{X_k}) = Var(\frac{1/k} (X_1 + \dots + X_k)) = \frac{1/k} Var(X_1
  + \dots + X_k) = \frac{k\sigma^2}{k^2} = \frac{\sigma^2}{k}
  $$
  Questo segue dalla proprieta' della varianza. supponendo l'indipendenza degli
  eventi ($Var(\alpha \cdot X) = \alpha^2 \cdot Var(X), \; Var(\sum_i X_i) =
  \sum_i Var(X_i)$).
* Supponiamo di voler stimare l'accuratezza di un classificatore. Possiamo
  modellare ogni istanza del test set passata al classificatore come un test di
  Bernoulli (classificazione corretta/non corretta).
* Poniamo con $a$ (aka $\theta$) la probabilita' di una classificazione corretta
  di un singolo test
* Noi vogliamo stimare $\hat{a}$, che effettivamente corrisponde all'accuratezza
  complessiva del modello (cioe' la capacita', dato un esempio qualsiasi, di
  classificarlo correttamente)
* Possiamo stimare l'accuratezza con $\hat{a} = A/n$ in cui $A$ e' il numero di
  esempi correttamente classificati nel *test set* dal modello

* Dal momento che ci sono piu' istanze nel test set, per modellare diversi lanci
  si utilizza una *variabile Binomiale *.
  La funzione di distribuzione di probabilita' della variabile e' una funzione
  con due parametri:
    * $a$ = probabilita' di successo di un singolo esperimento
    * $n$ = numero di esperimenti eseguiti
    * $f(a, n) = a(1-a)n$
* La varianza di un *singolo* esperimento Bernoulliano e' pari a $a(1 - a)$,
  mentre per $n$ esperimenti Bernoulliani e' $a(1-a)/n$
* Se invece di $a$ utilizziamo la ***stima*** di $a$, otteniamo una ***stima
  della varianza*** $\hat{a}(1-\hat{a})/n$.

## Cross-Validation
* L'idea della *cross validation* e' quella di dividere il dataset in $n+1$
  datasets, in cui $n$ sono di training e 1 e' di test
* Ad ogni iterazione si considera il primo set come il test set e i rimanenti
  come training sets, poi il secondo e i rimanenti come test, poi il terzo.. e
  cosi' via fino a considerare l'ultimo come test set.
* In questo caso, quindi, si ripete per ogni iterazione la fase di learning e
  quella di testing, per cui si ottengono $n$ modelli differenti
* :q
