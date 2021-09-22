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



