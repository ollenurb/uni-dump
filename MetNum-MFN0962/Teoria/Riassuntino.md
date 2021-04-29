## Metodi per al risoluzione di equazioni lineari
* Un fattore di condizionamento del problema e' dato dal valore della derivata prima della funzione
  in prossimita' della radice, piu' e' piccola piu' il problema sara' mal condizionato. (Ci si
  arriva tramite il polinomio di Taylor oppure per via grafica) se la funzione tende ad essere
  tangente all'asse $x$ tende quindi ad avere piu' di una radice. 
  Algebricamente, lo si vede mostrando il fattore di condizionamento $f_c = \frac{1}{f'(\xi)}$ con
  $\xi \in I(x,\alpha)$

#### Bisezione
* La funzione deve essere continua e avere una radice in $[a,b]$ 
* Si basa sulla divisione progressiva dell'intervallo con $c=\frac{b - a}{2}$
* Siccome ad ogni iterazione l'intervallo si dimezza, anche l'errore si dimezza quindi $p=1$ e
  $C=\frac{1}{2}$

#### Newton
* La formalizzazione deriva dal fatto che si considera un fascio di rette passanti per $(x_k,f(x_k))$ 
  e imponendo successivamente che il coefficiente angolare sia $f'(x_k)$ e che $y=0$. ($y - f(x_k) =
  f'(x_k)(x-x_k)$)
* La funzione deve essere continua e derivabile in $[a,b]$, inoltre il punto iniziale $x_0$ deve
  essere scelto sufficientemente vicino alla soluzione se no il metodo non converge.
* Ha convergenza quadratica
* Fissata una tolleranza $\tau$ e un numero massimo di iterazioni $N$, e' possibile fissare il
  criterio di arresto come $|x_k - x_{k-1}| < \tau|x_k|$ or $f(x_k)=0$ or $k > N$
  
#### Secanti
* Uguale a Newton ma fissa il coefficiente angolare
* Ordine di convergenza $p \approx 1.618$ 

#### Punto Fisso
* Serve a trovare un $\alpha$ tale che $\alpha = g(\alpha)$
* Il punto fisso $\alpha$ viene trovato se la funzione e' contrattiva in un intervallo $I$ che
  contiene $\alpha$
* Se la funzione e' derivabile si puo' dire che sia anche contrattiva se $|g'(x)<1|$ in $I$
* $\alpha$ e' unico 
* Se $g'(\alpha)=0$ e $g''(x)$ continua in $[a,b]$ allora il metodo ha ordine di convergenza $p=2$
* Stima dell'errore: $|\alpha - x_k| \leq \frac{x_{k+1}-x_k}{1-L}$

## Interpolazione
* Diversi metodi, abbiamo visto l'interpolazione polinomiale e l'approssimazione ai minimi quadrati
  (?).
* In generale si vuole ottenere una funzione che interpoli i punti dati, si possono utilizzare
  diverse basi, una di queste sono i polinomi, perche? (Vedi teorema sotto).
* Teorema: Il polinomio esiste ed e' unico se e solo se $x_i \neq x_j$ per $i \neq j$.  Piu' in
  generale deriva dal fatto che il determinante della matrice di Vandermonde
  ($det(V)=\prod^n_{i,j=0}(x_j - x_i)$) deve essere diverso da 0.
* Esistono diverse rappresentazioni rispetto alla base canonica dello stesso polinomio interpolante
  che agevolano il calcolo e sono meno onerose in termini computazionali. Una di queste e' il
  polinomio di Lagrange.

### Polinomio Interpolante di Lagrange 
* Si esprime come combinazione lineare di polinomi caratteristici che hanno la proprieta' di
  interpolazione $L_j = \delta{ij}$ dove $\delta$ e' il delta di *Kronecker*.
* Puo' risultare instabile quando due o piu' nodi sono prossimi tra loro poiche' almeno uno dei due
  fattori del denominatore risulta prossimo allo 0.
* Errore: $E(x) = \frac{f^{(n+1)}(\xi_x)}{(n - 1)!}$. Non sempre converge a zero per $n \rightarrow
  \infty$, proprio per il teorema di **Faber**. Esiste pero' almeno una distribuzione di nodi per
  cui l'errore tende a 0 al tendere a infinito di $n$.

### Costanti di Lebesgue
* Servono a dare una stima di quanto e' buona una funzione interpolante rispetto alla migliore
  approssimazione uniforme, dipendendo direttamente dalla matrice di interpolazione $X$. In altri
  termini, ci danno una stima del comportamento di diverse distribuzioni di nodi 
* In generale, per $n \rightarrow \infty$ e' stato dimostrato che le costanti divergono qualunque
  sia la distribuzione dei nodi e ha crescita almeno logaritmica. Le costanti di lebesgue associate
  alla matrice di interpolazione costituita da nodi di Chebichev risulta quasi ottimale, mentre
  quella costituita da nodi equispaziati e' il caso peggiore con cresita esponenziale.
* Le costanti di Lebesgue sono utili anche a valutare la stabilita' di un determinato polinomio
  interpolante. (Per dimostrazione esprimi due polinomi $p$ e $\tilde{p}$ nella forma di Lagrange e
  fai $| p - \tilde{p} |$)

### Polinomio Interpolante di Newton 
* Rappresenta una forma alternativa del polinomio di Lagrange particolarmente utile quando si ha
  gia' un polinomio $P_n$ interpolante in $n$ punti e si vuole ottenere un'altro polinomio
  interpolante in $n+1$ punti. Risulta meno oneroso in termini compuazionali poiche' ha complessita'
  di $O(\frac{n^2}{2})$.
* Utilizza la formula delle differenze divise per calcolare i coefficienti del polinomio.
* Le differenze divise hanno la proprieta' seguente: $f[x_0, x_0] = f'(x_0)$, piu' in generale si ha
  che ($x_0$ ripetuto $k$ volte) $f[x_0, \dots, x_0] = \frac{f^{(k)}}{k!}$.
* Rappresentazione di Newton: $P_n(x) = f(x_0)+(x-x_0)f[x_0, x_1] + \dots + (x-x_0)\dots(x -
  x_{n-1})f[x_0, x_1, \dots, x_n]$
* Permette inoltre di dare una rappresentazione alternativa dell'errore: $E_n(x) = f(x) - P_n(x) =
  f[x_0, \dots, x_n, x] \omega(x)$. Questa rappresentazione non richiede che la funzione sia
  differenziabile ne' che sia continua, rispetto alla rappresentazione vista in precedenza. 

## Approssimazione ai minimi quadrati
* Si preferisce utilizzarla al posto dell'interpolazione in casi in cui i dati presentano forti
  errori. 
* Consiste nel trovare i $c_k$ tali che $\varepsilon_2 = \sum_{i=0}^m [y_i - \sum_{k=0}^n c_k
  \varphi_k(x_i)]^2$ sia minimo. 
* Abbiamo solo visto il caso dei polinomi, per cui prendiamo come riferimento $\varphi_k(x) = x^k$. 
* Si ottiene un sistema lineare a $(n+1)$ equazioni e a $(n+1)$ incognite (da vedere sul libro o
  appunti). 
* Nota per la risoluzione degli esercizi: con $n=1$ prendi la sottomatrice $(n+1)\times(n+1)$ e
  risolvi il sistema corrispondente.
  
