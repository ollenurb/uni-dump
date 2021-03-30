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
* Diversi metodi, abbiamo visto l'interpolazione polinomiale e l'approssimazione ai minimi quadrati.
* Precondizioni: Il polinomio esiste ed e' unico se e solo se $x_i \neq x_j$ per $i \neq j$. Tale
  precondizione previene il fatto che il denominatore si possa annullare nel calcolo del polinomio
  interpolante di Lagrange

### Interpolazione Polinomiale Lagrangiana
* Puo' risultare instabile quando due o piu' nodi sono prossimi tra loro poiche' almeno uno dei due
  fattori del denominatore risulta prossimo allo 0 
* Errore: $E(x) = \frac{f^{(n+1)}(\xi_x)}{(n - 1)!}$. Non sempre converge a zero per $n \rightarrow
  \infty$, proprio per il teorema di **Faber**. Esiste pero' almeno una distribuzione di nodi per
  cui l'errore tende a 0 al tendere a infinito di $n$.
*  
