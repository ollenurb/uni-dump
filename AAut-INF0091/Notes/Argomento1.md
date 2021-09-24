Tom Mitchell - Machine Learning Book ~ Rosa Meo
Ensemble Learning e Modelli Lineari sono piu' chiari sulle slides, per cui meglio studiare li sopra.

# Che cos'e' il Machine Learning
I concetti fondamentali che ci servono per capire cos'e' il machine learning sono i seguenti:

* Tasks: i problemi che siamo in grado di affrontare con il ML (classificazione, regressione, stima
  della probabilita', clustering...)
* Modelli: oggetti che vengono costuiti dall'algoritmo di apprendimento che risolvono effettivamente
  il problema (lineari, alberi di decisione, Naive Bayes, Knn...)
* Features: cioe' che ci permette di descrivere il problema. Il problema e' descritto mediante un
  insieme di features

Il Machine Learning e' un campo che si occupa di usare le giuse **features**, per costruire il
giusto **modello** per svolgere il **task** giusto.

* La descrizione del problema e' data mediante un set di features
* I dati invece sono 
* Algoritmo di apprendimento:
    * Input: dati descritti per mezzo delle features
    * Output: un modello che in grado di risolvere il task anche con dati mai visti
    * Viene scelto in base alle ipotesi del bias induttivo che assume
     
* Task $\neq$ Problema di apprendimento
    * Problema di apprendimento: quando risolto ci dice **come** risolvere il task, sono risolti
      dagli **algoritmi di apprendimento** che producono modelli.
    * Task: **descrive** il problema, vengono risolti dai **modelli**.

* Tasks **Predittivi**: l'obiettivo e' quello di fare delle predizioni. Sono i piu' comuni
  all'interno del machine learning. Alcuni esempi sono:
    * Classificazione binaria e multiclasse
    * Regressione
    * Clustering
* Tasks **Descrittivi**: l'obiettivo e' quello di trovare delle regolarita' all'interno di datasets
  apparentemente insensati

## Esempio SpamAssassin
* Si vuole costruire un **classificatore** di email che classifichi le emails tra spam e no. Un
  problema di classificazione consiste nel dover apporre un'etichetta agli oggetti, in questo caso
  *spam* o *ham* alle emails.
* SpamAssassin affronta questo problema utilizzando un insieme di regole, in cui ogni regola $i$ ha un
  determinato peso associato $w_i$
* Un esempio di regola potrebbe essere quello ad esempio della regola `HTML_IMAGE_RATIO_02`, che si
  attiva quando il rateo tra testo e immagine e' maggiore del 20%
* Quello che succede e' che per una determinata email si attivano diverse regole dell'insieme
* La somma di tutti i pesi ($S = \sum_{i} w_i$) delle regole attive determina se la mail e' spam o ham. Nel caso di
  SpamAssassin, se $S > 5$, allora e' molto probabile che sia spam
 
## Modelli
* I modelli di apprendimento automatico possono essere classificati secondo il loro approccio (in
  altri termini, nel modo in cui sono *descritti*):
    * Geometrici: usano intuizioni dalla geometria (ad esempio separando iperpiani, trasformazioni
      lineari ecc..)
    * Probabilistici: in cui il processo di apprendimento e' equivalente a ridurre l'incertezza, ed e'
      modellato attraverso distribuzioni di probabilita'
    * Logici: definiti in termini di expressioni logiche

### Modelli Predittivi
* I modelli predittivi si occupano di inferire della conoscenza su nuovi problemi basandosi
  sull'esperienza passata.
* Un problema dei modelli predittivi e' l'**overfitting**. Esso accade quando l'algoritmo tenta di
  adattarsi con troppa aggressivita' al dataset nella fase di learning.
* Per aiutarci a capire meglio, immaginiamo per esempio di preparare un esame solamente usando esami
  passati. Al primo esame diverso dai facsimile su cui ci si e' preparati non si saprebbe risolvere.
  Questa e' una forma di overfitting.
* Dal punto di vista formale, l'overfitting avviene quando le performance sul training set sono piu'
  alte delle performance sul test set. Se ad esempio ho un accuratezza di un modello del 90% sul
  training set e un'accuratezza del 60% sul test set, si dice che ho un overfitting del 30%.
 
### Modelli Descrittivi
* I modelli descrittivi si occupano di trovare nuova conoscenza all'interno del dataset

# Machine Learning Tasks
* Gli oggetti sono chiamate *istanze* nel machine learning
* L'insieme di tutte le possibili istanze e' chiamato *instance space*, denotato con $\mathscr{X}$.
  Negli esempi precedenti, $\mathscr{X}$ corrisponde a tutte le possibili emails che possono essere
  scritte con l'alfabeto latino. L'input space e' descritto in termini di ***features***, anche
  chiamati attributi. Piu' in generale, denotando $\mathscr{F}_i$ l'insieme di valori di una singola
  feature, abbiamo che $\mathscr{X} = \{ \mathscr{F}_1 \times \mathscr{F}_2 \times \dots \times
  \mathscr{F}_d \}$, per cui ogni istanza e' un vettore *d-dimensionale* contenente i valori delle
  features.
* Il *label space* e' l'insieme delle etichette assegnabili, denotato con $\mathscr{L}$
* Un *modello* e' una mappa $\hat{m}: \mathscr{X} \rightarrow \mathscr{Y}$, dove $\mathscr{Y}$ e'
  l'*output space*.
* Il *training set* ***Tr*** e' definito come l'insieme di istanze chiamti ***esempi*** etichettate
  $(x, l(x))$, dove $l: \mathscr{X} \rightarrow \mathscr{L}$ e' una funzione etichettatrice
* Nella maggior parte dei modelli, $\mathscr{Y} = \mathscr{L}$, per cui quello che si vuole ottenere
  e' un modello $\hat{l}: \mathscr{X} \rightarrow \mathscr{L}$ che sia una buona approssimazione
  della funzione di labelling reale $l$, conosciuta solo tramite le etichette che sono state
  assegnate ai dati di training.
* In casi in cui $\mathscr{Y} \neq \mathscr{L}$, ad esempio se si volesse un modello che dia in
  output uno score di likelyhood per ogni label, allora $\mathscr{Y} = \mathbb{R}^k$, dove $k =
  |\mathscr{L}|$
* Per testare il modello si utilizza il cosiddetto *test set* ***Te***. Spesso il test set viene
  denotato con un apice per indicare le istanze che appartengono ad una determinata classe. Ad
  esempio $Te^{\oplus} = \{ (x, l(x)) \; | \; x \in Te \wedge l(x) = \oplus \}$ e' l'insieme dei
  campioni positivi, mentre Te$^{\ominus}$ dei negativi

## Classificazione
* Un task di classificazione e' il task piu' comune nel machine learning. Un classificatore e' una
  mappa $\hat{c}: \mathscr{X} \rightarrow \mathscr{C}$, dove $\mathscr{C} = \{ C_1, C_2, \dots,C_k
  \}$ e' un insieme (solitamente piccolo) di *labels di classe*.
* Far imparare un classificatore significa costruire la funzione $\hat{c}$ che sia
  un'approssimazione piu' precisa possibile di $c$, non solo sul training set ma idealmente
  sull'intero spazio $\mathscr{X}$
* La classificazione binaria (o *concept learning*) e' quando l'insieme $\mathscr{C}$ e' composto da
  due classi: *positiva* (denotata con $\oplus$) e *negativa* (denotata con $\ominus$)
* Un *feature tree* e' un albero che ha come nodi le features, mentre come foglie il numero
  complessivo di istanze appartenenti alle classi
* Un feature tree puo' essere convertito in un *decision tree* semplicemente assegnando la classe
  maggioritaria in ogni foglia.
* La performance dei classificatori puo' essere riassunta nella ***tabella di contingenza*** o
  ***matrice di confusione***. In questa tabella, ogni riga si riferisce alle classi attuali come
  registrate nel test set, mentre le colonne si riferiscono alle classi che ha predetto il
  classificatore.
* Dalla tabella di contingenza e' possibile calcolare diversi indicatori di performance. Uno di
  questi e' la *precisione* (*accuracy*), calcolabile nel modo seguente:
  $$
  acc = \frac{1}{|Te|} \sum_{x \in Te} I[\hat{c}(x) = c(x)]
  $$
  Dove la funzione $I[\cdot]$ e' l'*indicator function* che vale $1$ se l'argomento e' *true*, $0$
  atrimenti
* Possiamo anche definire un'altro indicatore chiamato *true positive rate* nel modo seguente:
  $$
  tpr = \frac{\sum_{x \in Te} I[\hat{c}(x) = c(x) = \oplus]}{\sum_{x \in Te} I[c(x) = \oplus]} 
  $$
  A parole: E' il rapporto tra tutti i *true positives* (cioe' i positivi che vengono identificati
  correttamente) e tutti i *positivi*.
* $tpr$ da una stima della probabilita' che un positivo arbitrario sia classificato correttamente
  dal classificatore, formalmente $P_{\mathscr{X}}(\hat{c}(x) = \oplus | c(x) = \oplus)$
* Analogamente e' definibile il *true negative rate*
* Queste quantita' sono dette anche *sensivity* e *specificy*, e possono essere viste come stime di
  accuratezza **per classe**.
* *Coverage plot*: grafico per valutare le performance dei classificatori. Si costruisce mediante 4
  ingredienti principali: 
    * Numero di positivi totali
    * Numero di negativi totali
    * Numero di veri positivi
    * Numero di falsi positivi
  Gli altri dati possono essere presi facendo il complementare rispetto al totale.
* In un *coverage plot*, i classificatori con la stessa accuratezza stanno sulla stessa retta di
  coefficiente angolare pari a $1$.
* *Normalized plot* (ROC plot) e' un coverage plot ma con gli assi normalizzati (sono divisi per il numero
  totale, in questo caso *Pos* e *Neg*), quindi tutti i punti sono divisi per la scala (pos e neg)
* In un plot normalizzato una retta con equazione $trp=fpr+y_0$ non ha lo stesso significato di una
  stessa linea in un coverage plot. In generale in un plot normalizzato, su una linea con
  coefficiente angolare pari a 1 (e quindi parallela alla diagonale dal momento che si tratta di una
  griglia con dimensioni 1x1) stanno tutti i classificatori con lo stesso ***average recall***.
  Analogamente, tutte le rette con coefficiente angolare pari a $neg/pos$ (cioe' pari a $1/clr$)
  hanno la stessa accuratezza.
* $avg-rec = (tpr + tnr)/2$
* *Coverage plot*: Utile quando si vuole tenere esplicitamente conto della distribuzione di classi,
  per esempio quando si sta lavorando con un singolo dataset
* *ROC plot*: Utile quando si vogliono combinare risultati proveniente di diversi datasets, con
  distribuzioni di classi differenti
* In generale, i classificatori meno efficienti sono quelli che stanno sulla diagonale principale,
  dal momento che fanno un random guess 50/50. Anche se quelli che stanno sotto hanno piu' negativi
  che positivi, basterebbe negare il risultato del classificatore per ottenerne uno comunque
  preciso
  
## Scoring e Ranking

## Stima della probabilita'

