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
