\newpage
# Modelli basati sulla distanza
* I modelli per la classificazione sfruttano le similarita' tra i dati di
  training per generalizzare a dati mai visti. Ad esempio, gli alberi di
  decisione segmentano lo spazio degli esempi in segmenti simili in qualche modo
  tra di loro.
* I modelli che vedremo utilizzano una forma piu' graduata di similarita'

* Notiamo che in uno spazio degli esempi, la scelta piu' banale come misura di
  dissimilarita' potrebbe essere la **distanza** tra due esempi
* In generale esistono pero' molte funzioni di distanza che si basano su altri
  principi rispetto a quelli di "*senso comune*"

## Distanze di Minkowski
> Se $\mathscr{X} = \mathbb{R}^d$ e' lo spazio degli esempi, la ***distanza di
  Minkowski*** di ordine $p > 0$ e' definita come
  $$
  Dis_p(x, y) = \left(  \sum^d_{j=1} | x_j - y_j |^p \right)^{1/p} = \|x - y \|_p
  $$
  dove $x, y \in \mathscr{X}$. In altri termini, e' semplicemente la norma
  *p-esima* della differenza tra gli esempi.

* $Dis_0$ misura la distanza contando quanti elementi sono diversi da 0
  all'interno di un vettore. Possiamo vederla come $Dis_0(x, y) = \sum^d_{j=1}
  I[x_j \neq y_i]$.
    * Se tutte le features di $x$ e $y$ sono binarie, allora si parla di
      ***distanza di Hamming***
    * Se tutte le features di $x$ e $y$ non sono binarie e non hanno la stessa
      lunghezza, si parla invece di ***distanza di Levenshtein***
* $Dis_2$ misura la ***distanza euclidea***, che indica la distanza piu' corta tra due
  punti connessi da una linea retta (*a volo d'uccello*)
* $Dis_1$ e' detta ***distanza di Manhattan*** (*cityblock distance*), che
  determina la distanza tra due punti se fossero permessi solo movimenti lungo
  gli assi delle coordinate
* Mano a mano che si fa crescere $p$, la misura della distanza sara' sempre piu'
  dominata dalla componente piu' grande in valore assoluto. All'estremo troviamo
  $Dis_{\infty} = \max_j |x_j - y_j|$, chiamata anche ***distanza di
  Chebyshev***.
* In alcuni casi in cui le features sono sparse (cioe' se alcune features sono
  assenti su alcune istanze) si utilizza di solito la ***distanza di Jaccard***,
  che tiene conto solo delle istanze che sono entrambe presenti (entrambe 1)

> Una ***metrica di distanza*** e' una funzione $Dis: \mathscr{X} \times
> \mathscr{X} \rightarrow \mathbb{R}$ tale che per ogni $x, y, x \in \mathscr{X}$
> valgono le seguenti proprieta':
>
>    * La distanza tra un punto e se stesso e' 0: $Dis(x, x) = 0$
>    * Tutte le altre distanze sono maggiori di zero: se $x \neq y$ allora
>      $Dis(x, x) > 0$
>    * La distanza e' simmetrica: $Dis(x, y) = Dis(y, x)$
>    * Percorsi alternativi non possono diminuire la distanza: $Dis(x, z) \leq
>      Dis(x, y) + Dis(y, z)$

## Distanze di tipo ellittico
* La distanza ellittica e' un modo differente di calcolare la distanza che tiene
  conto anche della direzione nello spazio in cui rappresentiamo le istanze
* Un tipo di distanza ellittico e' la distanza di Mahalanobis
    * Sia $M = \Sigma^{-1}$ la *matrice della covarianza*, allora la distanza di
      Mahalanobis e' calcolabile come
      $$
      Dis_M (x, y \;|\; \Sigma) = \sqrt{(x - y)^T \Sigma^{-1} (x - y)}
      $$
    * Utilizzare la matrice della covarianza ha l'effetto di *eliminare la
      correlazione e normalizzare* le features
    * La distanza Euclidea e' un caso specifico della distanza di Mahalanobis,
      in particolare $Dis_2(x, y) = Dis_M(x, y, \;|\; I)$

* Spieghiamo ora come si calcola la matrice delle covarianze $\Sigma$
    * Abbiamo che $X$ e' una matrice ($n \times d$) composta da $n$ oggetti
      rappresentati mediante $d$ features
    * Allora la matrice delle covarianze e' una matrice $d \times d \Sigma$, in
      cui la singola entrata $\sigma_{lj}$ e' la *covarianza* tra le feature $l$
      e $j$ su tutte le istanze nel dataset $X$
      $$
      \sigma_{lj} = \frac{1}{n} \sigma^n_{k=1} (x_{kl} - \bar{x_{*l}})(x_{kj} - \bar{x_{*j}})
      $$
    * $\sigma_{lj}$ e' una misura di quanto le features $l$ e $j$ variano
      **insieme** (da qui il nome *co-varianza*)

![Effetto della distanza di Mahalanobis](img/mahalanobis_distance.png)

* In questa immagine, si puo' notare come la distanza di Mahalanobis sia in
  disaccordo con la distanza Euclidea. Si puo' notare come sia piu' piccola tra
  $A$ e $C$ rispetto a $A$ e $B$. Questo accade principalmente perche' la
  direzione del vettore differenza $C - A$ segue la direzione dei dati.

## Centroidi e Medoidi
* Gli esemplari sono delle istanze nello spazio degli esempi che rappresentano
  (sono rappresentative) delle classi

> **Teorema**: La media aritmetica $\mu$ di un set di esemplari $D$ e' il punto
> univoco che *minimizza la somma totale* delle distanze Euclidee al quadrato
> tra tutte le istanze del set $D$ e $\mu$
>
> **Dimostrazione**: Bisogna dimostrare che $\arg \min \sum \|x-y\|^2_2 = \mu$,
> imponendo che il *gradiente* della somma rispetto a $y$ ($\nabla_y$) sia 0
> $$
  \nabla_y \sum_{x \in D} \| x - y\|^2_2 = \\
  -2 \sum_{x \in D} (x - y) =
  -2 \sum_{x \in D} x +2 |D| y = \\
  y = \frac{1}{|D|} \sum_{x \in D} x = \mu
> $$

* In alcune situazioni non si vuole avere un *baricentro* ideale (in questo caso
  rappresentato da $\mu$, che pero' non e' descritto in termini di features) ma
  si vuole un'istanza che renda minime le distanze tra tutti gli altri. In
  questo caso parliamo di ***medoide*** se l'esempio e' ristretto a far parte
  esclusivamente del dataset, mentre ***centroide*** quando puo' anche non
  appartenere per forza al dataset.
* **Centroide**: Centro della massa ideale di una classe (puo' anche non
  appartenere al dataset)
* **Medoide**: Istanza localizzato piu' al centro della classe (piu' vicina al
  centroide)
* Rispetto al calcolo del centroide, il medoide richiede di calcolare le
  distanze tra tutte le coppie di punti, per cui ha complessita' $O(n^2)$

![Esempio di dataset con 10 punti in cui i cerchi sono centroidi e i quadrati
medoidi. Si noti come l'outlier ("*spinga*") i centroidi verso di
se](img/centroids_medoids.png)

## Distance Based Classification
* Sappiamo che un classificatore lineare di base costruisce una linea di
  decisione dividendo i positivi e i negativi
* E' possibile ottenere la stessa cosa ma basandosi sul concetto di distanza:
    * Siano $\mu^{\ominus}, \mu^{\oplus}$ i centroidi delle rispettive classi
      negative e positive
    * Quando una nuova istanza $x$ deve essere classificata, si controlla
        - Se e' piu' vicina a $\mu^{\oplus}$ allora e' un esempio **positivo**
        - Altrimenti e' un esempio **negativo**
    * In altri termini, classifica un'istanza con la classe del piu' vicino
      *esemplare*
* In caso usassimo la distanza Euclidea, allora si otterrebbe lo stesso ed
  identico decision boundary ottenuto dal classificatore lineare

> Creare un classificatore lineare puo' essere interpretato da un punto di vista
di distanza come trovare gli *esemplari* che minimizzino la distanza euclidea al
quadrato di ogni classe, per poi applicare una regola di decisione basata
sull'esemplare piu' vicino.

* Questo cambio di prospettiva permette di estendere la classificazione a piu'
  di due classi molto facilmente.
* All'aumentare di esemplari (conseguentemente ad un aumento delle classi)
  alcune regioni dello spazio degli esempi diventano delle regioni convesse
  chiuse (delimitate dai decision boundaries), dando luogo a quella che si
  chiama ***tassellazione di Voronoi***.

### Nearest Neighbour Classifier
* Nella sua forma originale, il classificatore che si basa sui k-vicini piu'
  prossimi, prende un *voto di classe* per ognuno dei $k$ esemplari piu' vicini
  e ne predice la classe maggioritaria

> Scegliere un $k$ dispari e' preferibile in modo da evitare *pareggi* nei voti

* `kNN` memorizza (infatti si chiamano anche modelli basati sulla memoria) tutti
  gli esempi del dataset e ad ogni esempio di test va a cercare le $k$ istanze
  piu' vicine nel dataset memorizzato, per poi farne la votazione di classe.
* Per questa ragione, sia la *classificazione di una singola istanza* che il
  *training del modello* ha complessita' $O(|D|)$
* Il classificatore 1NN separa perfettamente i positivi e i negativi, per cui ha
  un **basso bias** e un'**elevata varianza** (molto suscettibile a overfitting
  in casi in cui il dataset e' poco significativo o poco grande)
* D'altra parte, all'aumentare di $k$ **diminuiamo la varianza** e **aumentiamo
  il bias** del modello.
* Relazione col *bias-variance dilemma*:
    * Con valori bassi di $k$, abbiamo una varianza alta e un basso bias
    * Con valori alti di $k$, abbiamo una bassa varianza e un alto bias
* **Pro**: Facilmente adattabile a valori di target reali per cui si puo'
  estendere facilmente a task di regressione, o alla stima di probabilita'
  quando $k > 1$
* **Contro**: E' affetto dalla maledizione della dimensionalita', cioe' che in
  spazi con dimensionalita' molto alta gli esempi sono molto distanti tra di
  loro per cui la distanza e' poco informativa (?)

> Non esiste una regola precisa per trovare il valore di $k$ ottimale per un
dato dataset

* Una modifica che si puo' fare a kNN e' quella di **pesare il voto** di un
  certo vicino per il reciproco della distanza tra il vicino e l'istanza di
  test. In questo modo, piu' e' grande la distanza minore sara' il voto, il che
  coincide con l'intuizione dal momento che piu' distante e' l'istanza, meno
  affidabile sara' la sua classe

