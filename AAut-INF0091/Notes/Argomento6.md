\newpage
# Modelli Lineari

## Least Squares (Metodo dei minimi quadrati)
* Caso: Problema di regressione in cui si vuole ottenere un'approssimazione
  lineare di $n$ punti
* Si vuole trovare l'approssimazione che minimizzi l'errore
* Formalizzazione del problema con esempio in 2 dimensioni:
    * Dati $n$ punti $(x, y)$ rappresentati in formato matriciale
    * Vogliamo trovare i parametri $(C, D)$ del modello lineare $Cx + D = y$ che
      approssimi meglio i dati
    * Il modello e' semplicemente una combinazione lineare dei coefficienti
      $\sum^n_{i = 0} x_i \cdot w_i = y_i$ dove $w$ e' il vettore delle
      variabili.
* Idealmente quello che si vuole ottenere e' che il modello non abbia errori
  sui dati di train. Formalmente parlando, si vuole per ogni punto dato $(x_i,
  y_i)$ valga la relazione $Cx_i + D = y_i$ (ne risulta un sistema a $n$ righe)
* (*Recall da metodi numerici*) Ogni sistema puo' essere rappresentato in forma
  matriciale $Ax = b$, in questo caso si ottiene $Xw = y$, dove $X$ e' la
  matrice composta da colonne degli $x$ compresa di una  colonna addizionale
  composta da soli $1$, $w$ il vettore colonna composto dalle variabili (in
  questo caso $C$ e $D$) e $y$ il vettore colonna dei valori $y$.
* Il ***caso ideale*** per la soluzione di questa equazione lineare, e' quello in cui
  la matrice $X$ ha rango pieno (tutte le colonne sono linearmente indipendenti
  tra loro), per cui esiste l'inversa $X^{-1}$. La soluzione e' ottenibile
  moltiplicando ambo i membri per l'inversa ottenendo la soluzione $w = X^{-1} \cdot y$
* Ovviamente questo caso e' possibile solo quandoo il numero di osservazioni
  ($n$) coincide con il numero di features. Quasi sempre questo non succede,
  rendendo quindi la matrice *non invertibile*.
* Possiamo pero' riformulare il problema:
    * Ricordati che lo spazio generato da una matrice (*span*) $C(X)$ e'
      generato dalla combinazione lineare dei vettori colonna $x_i$ appartenenti
      alla matrice
    * Variando i valori di $\vec{w}$, si puo' ottenere un qualsiasi vettore
      all'interno di $C(X)$. Questo perche' ogni vettore nello spazio e'
      esprimibile come combinazione lineare delle colonne di $X$ nel modo
      seguente
      $$
      \vec{y} = \sum^m_{j = 0} w_j \vec{x_j}
      $$
    * $Dim[C(X)] = n$ cioe' il numero di esempi
    * Dal punto di vista geometrico, $y$ non giace nello spazio $C(X)$. Dato che
      se no $X$ sarebbe invertibile.
    * $y$ pero' e' sempre un vettore di $n$ componenti, per cui possiamo
      calcolarne la distanza normata tra un qualsiasi vettore $p \in C(X)$.
      $$
      ||e||_2 = ||y - p||_2 = \sqrt{\sum_i (y_i - p_i)^2}
      $$
    * Dato che la norma e' una quantita' sempre positiva per definzione, possiamo
      anche considerarne i quadrati ($||e||_2^2$), che corrisponde a minimizzare la
      quantita' $\sum_i (y_i - p_i)^2$
    * Siccome per definizione $p = X\hat{w}$ (dove $\hat{w}$ e' un vettore a $n$
      componenti), possiamo dare una formalizzazione finale del problema:

> Il metodo dei minimi quadrati consiste nel trovare il vettore $\hat{w}$ che
minimizzzi la norma al quadrato della distanza tra $p$ e $y$
$$
\hat{w} = \arg \min_{w} ||X w - y||_2^2
$$

* (*Stiamo parlando in termini dell'esempio sulle slides ovviamente*)
  Intuitivamente parlando si vuole trovare un vettore $\hat{w}$ tale che generi
  un vettore $e$ che sia perpendicolare al piano $C(X)$
* La condizione di perprendicolarita' dal punto di vista algebrico e' semplice:
  Siano $a$ e $b$ due vettori. Essi sono considerati perpendicolari quando $a
  \cdot b = 0$. Possiamo utilizzare questa definizione per trovare la soluzione
  nel nostro caso.
* Quello che vogliamo e' che il vettore $e$ sia perpendicolare ad ogni vettore
  colonna $x_i$ della matrice $X$. Per far cio' quindi basta imporre $X^T e =
  \vec{0}$
* L'ultimo passaggio e' esplicitare $e$ e $p$ nella relazione precedente,
  ottenendo:
  $$
  \begin{split}
  X^T e &= 0 \\
  X^T (y - X \hat{w}) &= 0 \\
  X^T X \hat{w} &= X^T y \\
  \hat{w} &= (X^T X)^{-1} X^T y
  \end{split}
  $$
* Risolvere quindi il problema dei minimi quadrati consiste quindi
  essenzialmente nel risolvere l'ultima relazione
* Uno dei problemi dei minimi quadrati, e' che e' molto sensibile agli
  *outliers* causando overfitting. Siccome la misura dell'errore su un singolo
  esempio e' elevata al quadrato, gli *outliers* pesano tantissimo sulla
  quantita' complessiva di errore. Per compensare questa situazione, la curva di
  classificazione cerchera' di avvicinarsi di piu' a questo punto piu' distante,
  sacrificando della precisione negli altri punti.

> Outliers: Punti che sono stati campionati da una distribuzione diversa da
quella originale. Corrispondono a degli errori nella misurazione.

* Attenuare questo problema e' possibile mediante una **regolarizzazione** della
  soluzione. L'idea e' quella di aggiungere dei vincoli sulla soluzione cercata.
  (nel nostro caso, sulla "*forma*" dei pesi $w_i \in \hat{w}$).
* Una versione normalizzata del problema dei minimi quadrati e' detta ***ridge
  regresssion*** e consiste semplicemente nell'aggiungere un termine $\lambda
  ||w||^2$ per far si che il vettore non cresca troppo in dimensioni e che
  rimanga in norma "abbastanza piccolo":
  $$
  \begin{split}
  \hat{w} &= \arg \min_{w} ||y - Xw||^2_2 + \lambda ||w||_2^2 \\
    &= \arg \min_{w} (y - Xw)^T (y - Xw) + \lambda ||w||_2^2 \\
  \end{split}
  $$
  (la seconda formulazione e' solo un modo diverso per scrivere $||y -
  Xw||^2_2$)
* La stessa relazione e' riscrivibile in forma chiusa
  $$
  \hat{w} = (X^T X + \lambda I)^{-1} X^T y
  $$
  (Il fatto di aggiungere la matrice diagonale $\lambda I$ a $X X^T$ e' un
  trucchetto molto noto che serve ad aumentare la stabilita' numerica per
  l'inversione della matrice)
* Un'altra forma di regolarizzazione e' data dal **lasso** (*Least Absolute
  Shrinkage and Selection Operator*). La differenza e' semplicemente quella che
  al posto di considerare $\lambda ||w||_2^2$, si usa $\lambda ||w||_1$.
* Perche' minimizzare la norma di $w$ porta a risultati migliori?
    * Supponiamo che la matrice delle osservazioni $X$ sia affetta da degli
      errori $\delta$, cioe' $(X + \delta)$.
    * Quando si moltiplica per $w$, otteniamo $(X + \delta)w = Xw + \delta w$
    * In questo senso, minimizzare $w$ minimizza anche l'errore su $X$
    * Un'altra ragione e' che dal momento che i $w$ devono essere piccoli,
      corrisponde a scegliere dei pesi piu' semplici. (*rasoio di Occam*)
    * Un'altro modo per vedere questo e' pensare alla regolarizzazione come un
      bias induttivo che viene inserito per ridurre l'errore di varianza del
      least square
* 

