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
      rispetto al numero delle features
    * E' possibile che l'accuratezza di $P(X)$ potrebbe essere non bilanciata
      rispetto all'accuratezza di $P(Y | X)$. Nonostante cio', se $P(X)$ e'
      piccola, sappiamo che sara' molto poco probabile che arrivino esempi di
      quel tipo, per cui il tasso di missclassificazione rimane molto basso.
    * L'apprendimento puo' essere visto come un processo di riduzione
      dell'incertezza (cioe' dell'entropia)

## Apprendimento come riduzione dell'incertezza
* Supponiamo di voler stimare la probabilita' $\theta$ che una email sia spam
    * La cosa naturale da fare e' stimare $\hat{\theta} = d/n$ dove $d$ e' il
      numero di istanze che sono spam
    * Ovviamente questa e' una stima di massimizzazione della propbabilita' a
      posteriori, per cui non significa che altri valori di $\theta$ siano
      completamente esclusi. Per includerli, e' piu' appropriato modellare il
      valore $\theta$ come una distribuzione di probabilita' binomiale
      ($\beta$-*distribution*).
    * Ogni volta che si ispeziona una email, si riduce l'incertezza riguardo la
      probabilita' di spam $\theta$. In questo modo la distribuzione si
      "*schiaccia*" aumentando in altezza e diminuendo in larghezza verso uno
      specifico valore di likelihood di classe.
    * 

* Un classificatore e' detto *Bayes-ottimo* se e' sempre capace di assegnare il
  valore della classe da predire che rende massima la probabilita' a posteriori
  della classe una volta che sono state osservate le features dell'esempio $x$
