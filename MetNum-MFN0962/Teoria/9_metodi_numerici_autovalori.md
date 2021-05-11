\newpage
# Metodi numerici per il calcolo degli autovalori
## Condizionamento
Fino ad ora abbiamo studiato la teoria concernente gli autovalori di matrici. In particolare abbiamo
trattato diversi importanti teoremi che ci permettono di localizzarli all'interno del piano
complesso. In questo capitolo si vogliono studiare invece dei metodi numerici per il calcolo degli
autovalori. Prima di introdurre direttamente dei metodi, pero', e' importante prima valutare e
studiare il condizionamento del problema.
In particolare, il seguente teorema ci da' delle informazioni dirette sul condizionamento del
problema del calcolo degli autovalori in modo numerico

>***Teorema (Bauer-Fike)**: Sia $|| \cdot ||$ una norma **assoluta**, e sia $A \in
>M_{n,n}(\mathbb{R})$ una matrice diagonalizzabile con $X$ matrice che ha per colonne gli autovettori
>di $A$. Se $\delta A$ e' la matrice delle perturbazioni indotte su $A$ e $\mu$ e' un autovalore di
>$A + \delta A$, allora esiste almeno un autovalore $\lambda$ di $A$ tale che*
>$$
| \lambda - \mu| \leq k(X) \; ||\lambda A||
>$$
>*dove $k(X) = ||X|| \; ||X^{-1}||$ e' l'indice di condizionamento di $X$.*

**Nota:** Una norma matriciale indotta $|| \cdot ||$ si dice **assoluta** quando
$$
||D|| = \max_{i=0, \dots, n} |d_{ii}|
$$
per ogni matrice diagonale $D \in M_{n,n}(\mathbb{R})$. Le norme 1, 2, $\infty$ sono norme assolute.

**Dimostrazione**: Escludiamo per prima cosa il caso banale, in cui se $\mu$ fosse un autovalore di
$A$, allora l'errore sara' nullo, per cui vale $0 \leq k(X) ||\delta A||$. 
Consideriamo ora il caso in cui $\mu$ non sia un autovalore di $A$. In questo caso, $A - \mu I$ e'
non singolare, per cui con $y$ autovettore corrispondente all'autovalore $\mu$ e per la definizione
di autovalore e autovettore otteniamo
$$
(A + \delta A)y = \mu y \; \leftrightarrow \; 
(A - \mu I) y = -\delta A y \; \leftrightarrow \;  
y = -(A - \mu I)^{-1} \delta A y
$$
Applicando la consistenza delle norme ($||Ax|| \leq ||A|| \cdot ||x||$) ed essendo $||y|| \neq 0$,
e' possibile dividere tutto per $||y||$, ottenendo
$$
||y|| \leq ||(A - \mu I)^{-1} \delta A y|| \leq
||(A - \mu I)^{-1} \delta A || \; ||y|| \; \rightarrow \;
1 \leq ||(A - \mu I)^{-1} \delta A ||.
$$
Sfruttiamo ora la submoltiplicativita' della norma matriciale ($||AB|| \leq ||A|| \cdot ||B||$$) e
l'ipotesi che $A$ sia diagonalizzabile ($A = XDX^{-1}$), ottenendo che
$$
(A - \mu I)^{-1} = (XDX^{-1} - \mu XDX^{-1})^{-1} =
X(D- \mu I)^{-1} X^{-1}
$$
Sostituiamo ora la relazione trovata, per cui
$$
1 \leq ||X(D- \mu I)^{-1} X^{-1} \delta A || \neq 
||X|| \; ||(D- \mu I)^{-1}|| \; ||X^{-1}|| \; ||\delta A||.
$$
Essendo la norma assoluta, vale quindi che
$$
||(D- \mu I)^{-1}|| = \max_i |\frac{1}{\lambda_i - \mu}| = \frac{1}{\min_i |\lambda_i - \mu|}
$$
e quindi, infine
$$
\min_i | \lambda_i - \mu | \leq ||X|| \; ||X^{-1}|| \; ||\delta A|| = k(X) ||\delta A||
$$
$\blacksquare$

>***Corollario**: Se $A \in M_{n,n}$ e' **normale** ($A^T \cdot A = A \cdot A^T$), allora*
>$$
| \lambda - \mu \leq ||\delta A||_2
>$$
**Dimostrazione**: Se $A$ e' normale, allora $X$ sara' per forza ortogonale, per cui $X \cdot X^T =
I = X^T \cdot X$, di conseguenza
$$
||X||_2 = ||X^T||_2 = \sqrt{\rho(X^T X)} = \sqrt{\rho (I)} = 1
$$
e quindi, siccome $||X||_2 = 1$, la stima del fattore di condizionamento $k(X)$ sara'
$$
k_2(X) = ||X||_2 \; ||X^T||_2 = 1
$$
Sostituendo la stima $k_2(X)$ all'interno della stima data dal teorema di Bauer-Fike si ottiene la
tesi.  $\blacksquare$

Questo corollario ci dice quindi che per matrici normali il calcolo di tutti gli autovalori e' ben
condizionato. Questo ci dice anche che per matrici dei coefficienti che sono mal condizionate per la
soluzione di sistemi lineari, potrebbero non essere mal condizionate nel calcolo degli autovalori.

Per matrici generiche, sappiamo pero' che l'errore nel calcolo degli autovalori dipende
proporzionalmente dall'entita' delle perturbazioni della matrice $\delta A$. Il teorema di
Bauer-Fike ci dice anche che tale errore e' influenzato direttamente anche dall'indice di
condizionamento della matrice degli autovalori $X$. L'errore sara' quindi tanto piu' basso quanto
piu' basso sra' $k(X)$. 

Siccome il problema del calcolo degli autovalori potrebbe essere ben condizionato o mal condizionato
a seconda della molteplicita' algebrica degli autovalori considerati, e' bene distinguere i casi
differenti tra di loro. Consideriamo inzialmente il condizionamento del calcolo di autovalori di
molteplicita' algebrica pari a 1:

>***Teorema**: Sia $A \in M_{n,n}$ una matrice diagonalizzabile con $X$ matrice che ha per colonne
>gli autovettori di $A$. Se $\delta A \in M_{n,n}$ e' la matrice delle perturbazioni indotte su $A$ e
>$\mu$ un autovalore della matrice perturbata $(A + \delta A)$, allora esiste un autovalore $\lambda$
>di $A$ tale che*
>$$
| \lambda - \mu | \leq \frac{1}{| y^T \cdot x | } \; ||\delta A||_2
>$$
>*dove $x$ e' una colonna di $X$ e $y^T$ e' la corrispondente riga di $X^{-1}$*

Questo teorema ci dice che in sostanza la variazione dell'autovalore $\lambda$ dovuta alla
perturbazione $\delta A$ e' proporzionale a $||\delta A||$ e che il condizionamento dipende
esclusivamente dall'autovettore associato all'autovalore. Tanto piu' $y^T$ tende ad essere
*ortogonale* a $x$, tanto piu' l'errore tende a crescere. 

## Metodi iterativi 
Dal momento che gli autovalori di una matrice sono gli zeri del suo polinomio caratteristico,
una possibile soluzione numerica al problema degli autovalori potrebbe consistere nel trovare le
radici di tale polinomio. In generale, pero', una procedura del genere non e' adeguata poiche':

* Il calcolo degli autovalori della matrice potrebbe essere ben condizionato ma non il calcolo degli
  zeri del suo polinomio caratteristico
* Gli errori di arrotondamento nel calcolo dei coefficienti di $P_n(\lambda)$ possono indurre
  elevate variazioni degli zeri del polinomio

Studieremo quindi dei metodi iterativi per il calcolo degli autovalori. Un metodo iterativo e' un
metodo numerico che consiste nel costruire una successione di approssimazioni $y_1, y_2, \dots,
y_n$, che sotto opportune condizioni converge alla soluzione $\bar{x}$. Un metodo iterativo si dice
*semplice* se ogni approssimazione della successione dipende dall'approssimazione costruita al passo
precedente. Per un metodo iterativo valgono le definizioni di *ordine di convergenza* viste al
capitolo 3. In generale valgono anche le stesse considerazioni fatte per il criterio di arresto che
puo' essere

* Una tolleranza $toll$, quindi il criterio di arresto sara' $||y_k - y_{k+1}||_{\infty} \leq toll$.
* Un numero massimo di iterazioni $maxiter$, quindi il criterio di arresto sara' $k >= maxiter$.

Un metodo iterativo molto conosciuto per il calolo degli autovalori e' proprio il **metodo delle
potenze**.

## Metodo delle potenze
Il metodo delle potenze e' un metodo iterativo che permette di calcolare l'autovalore dominante
(quello il modulo massimo) e un suo autovettore corrispondente. E' possibile poi modificare il
metodo per poter calcolare l'autovettore con modulo minimo. Anche se il metodo calcola un solo
autovalore, risulta utile per alcuni problemi quali

* Determinare l'invertibilita' di una matrice calcolando l'autovalore di minimo modulo (se dierso da
  0 sara' sicuramente ivertibile)$
* Calcolo del raggio spettrale calcolando l'autovalore di massimo modulo
* In caso la matrice sia simmetrica, ottenere il numero di condizionamento in norma 2 (poiche'
  $||A||_2=\sqrt{\rho(A)}$)

Inoltre, il metodo e' alla base dell'algoritmo **PageRank** di Google.

Consideriamo quindi una matrice $A_{n,n}$ che sia diagonalizzabile e che abbia quindi $n$
autovettori $x_1, \dots, x_n$ linearmente indipendenti e autovalori $\lambda_1, \dots, \lambda_n$.
Ordiniamo gli autovalori in modo decrescente nel modo seguente
$$
| \lambda_1 | > | \lambda_2 | \geq \dots \geq | \lambda_n |
$$
Ossia (notare il primo >) l'autovalore con modulo massimo e' $\lambda_1$ e ha molteplicita'
algebrica pari a $1$. Inoltre non esistono altri autovalori con lo stesso modulo.  
Fissando un vettore $t_0 \in \mathbb{R}^n$ iniziale (detto **vettore d'innesto**), sotto l'ipotesi
precedente si puo' definire la successione $\{y_k\}_{k=1,2,\dots}$ nel modo seguente
$$
\begin{cases}
    y_1 = A \cdot t_0,\\
    y_k = A \cdot y_{k-1}, \quad k = 2, 3, \dots
\end{cases} \quad \leftrightarrow \quad
\begin{cases}
    y_1 = A \cdot t_0,\\
    y_k = A^k \cdot t_0, \quad k = 2, 3, \dots
\end{cases}
$$
Spieghiamo ora come sia possibile approssimare l'autovettore $\lambda_1$ e il suo corrispondente
autovettore $x_1$ mediante la successione appena descritta.  
Dal momento che gli autovettori sono tutti linearmente indipendenti, significa che formano una base
ed e' quindi possibile esprimere $t_0$ come combinazione lineare degli stessi, cioe'
$$
t_0 = \sum^n_{i=1} \alpha_i x_i
$$
Supponiamo inoltre che il vettore d'innesto $t_0$ scelto, abbia la prima componente non nulla,
percio' $\alpha_1 \neq 0$. Riscriviamo $t_0$ come combinazione lineare all'interno della definizione
del metodo, ottenendo
$$
y_k = A^k \cdot t_0 = A^k \cdot (\sum^n_{i=1} \alpha_i x_i) = \sum^n_{i=1} \alpha_i A^k \cdot x_i 
$$
Per la seguente proprieta' degli autovalori $A^k \cdot x_i = \lambda^k x_i$, possiamo riscrivere la
relazione e ottenere
$$
= \sum^n_{i=1} \alpha_i \lambda^k \cdot x_i 
$$
Infine, dal momento che si vuole approssimare $\lambda_1$, per la proprieta' della linearita'
mettiamo in evidenza $\lambda_1^k$ e otteniamo infine
$$
= \lambda_1^k \bigg[ \alpha_1 x_1 + \sum^n_{i=2} \alpha_i \bigg( \frac{\lambda_i}{\lambda_1}
\bigg)^{k} x_i \bigg].
$$
Analogamente, otteniamo
$$
y_{k+1} = \lambda_1^{k+1} \bigg[ \alpha_1 x_1 + \sum^n_{i=2} \alpha_i \bigg( \frac{\lambda_i}{\lambda_1}
\bigg)^{k+1} x_i \bigg].
$$

Avendo $y_{k+1}$ e $y_k$, possiamo valutare il seguente rapporto, dove $(y_k)_r$ e' l'*r-esima*
componente del vettore $y_k$ (lo stesso vale per $y_{k+1}$)
$$
\frac{(y_{k+1})_r}{(y_k)_r} =
\lambda_1 \frac{\alpha_1 (x_1)_r + \sum^n_{i=2} \alpha_i \bigg( \frac{\lambda_i}{\lambda_1}\bigg)^{k+1}
(x_i)_r}
{\alpha_1 (x_1)_r + \sum^n_{i=2} \alpha_i \bigg( \frac{\lambda_i}{\lambda_1} \bigg)^{k+1} (x_i)_r}
$$
Siccome abbiamo supposto che per ipotesi $\lambda_1$ e' l'autovalore di modulo massimo, allora
$\bigg| \frac{\lambda_i}{\lambda_1} \bigg| < 1, \; i = 2, \dots, n$, per cui si puo' concludere che
$$
\lim_{k \rightarrow \infty} \frac{(y_{k+1})_r}{(y_k)_r} = \lambda_1
$$
Cioe' che da un certo indice $k$ in poi, l'autovalore $\lambda_1$ di massimo modulo puo' essere
approssimato mediante il rapporto $\frac{(y_{k+1})_r}{(y_k)_r}$.

Analogamente, possiamo ottenere l'autovettore $x_1$ dividendo $y_k$ per $\lambda_1^k$ e passando al
limite 
$$
\lim_{k \rightarrow \infty} \frac{y_k}{\lambda_1^k} = \alpha_1 x_1
$$
La stessa relazione vale anche per qualsiasi componente *r-esima* come nel caso precedente
$$
\lim_{k \rightarrow \infty} \frac{(y_k)_r}{\lambda_1^k} = \alpha_1 (x_1)_r
$$
infine, per tutti gli indici $r$ per cui $(x_1)_r \neq 0$, si ha
$$
\lim_{k \rightarrow \infty} \frac{y_k}{(y_k)_r} = \frac{x_1}{(x_1)_r}
$$
Poiche' da un certo indice $k$ in poi, l'indice $m$ di una componente di massimo modulo di $y_k$
rimane invariato (per le ipotesi iniziali), la successione $\frac{y_k}{(y_k)_m}$ converge
all'autovettore $x_1$ normalizzato in norma $\infty$.

La convergenza delle successioni $\frac{(y_{k+1})_r}{(y_k)_r}$ e $\frac{y_k}{(y_k)_r}$ per $k
\rightarrow \infty$, inoltre, dipende direttamente da quanto dista il secondo autovalore di modulo
massimo $\lambda_2$ da $\lambda_1$, cioe' dal rapporto $\big| \frac{\lambda_2}{\lambda_1} \big|$.
Essa sara' tanto piu' rapida tanto quando il rapporto sara' piccolo.  

## Metodo delle potenze con normalizzazione
Dalla dimostrazione metodo delle potenze fatta in precedenza, e' possibile osservare che per $k
\rightarrow \infty$ si puo' verificare la seguente situazione
$$
\begin{cases}
    \lambda^k_1 \rightarrow 0 \; & \text{se} \; | \lambda_1 | < 1\\
    \lambda^k_1 \rightarrow \infty \; & \text{se} \; | \lambda_1 | > 1
\end{cases}
$$
Dunque se si implementa un algoritmo che lavora con l'aritmetica finita si potrebbero verificare dei
fenomeni di **underflow** o **overflow** rispettivamente. Per poter evitare fenomeni di questo tipo
si utilizza una versione modificata dell'algoritmo che applica ad ogni passo una normalizzazione del
vettore. Vediamo inizialmente la normalizzazione a norma $\infty$ e successivamente quella in norma
$2$.

### Normalizzazione con la norma $\infty$
Consideriamo sempre un vettore $t_0$, questa volta scelto in modo tale che $||t_0||_{\infty} = 1$.
Costruiamo quindi la successione come nel caso precedente:
$$
\begin{cases}
    u_k = A \cdot t_{k-1},\\
    t_k = \frac{u_k}{||u_k||_{\infty}}, \quad k = 1, 2, \dots
\end{cases}
$$
Procedendo in modo simile a prima e denotando con $m$ l'indice di massimo modulo di $u_k$, cioe'
$||u_k||_{\infty} = |(u_k)_m|$, da un certo indice $k$ in poi la successione
$$
\beta_k = \frac{(u_{k+1})_m}{(t_k)_m}
$$
tende a $\lambda_1$ come $\big| \frac{\lambda_2}{\lambda_1} \big|^k$, per cui la convergenza e' piu'
veloce rispetto al metodo senza normalizzazione.
D'altra parte, abbiamo anche la convergenza della successione per l'autovettore
$$
\lim_{k \rightarrow \infty} t_k \frac{x_1}{(x_1)_m}
$$
essendo $(t_k)_m \pm 1$, abbiamo che la successione converge all'autovettore $x_1$ normalizzato in
norma $\infty$.

### Normalizzazione con la norma 2
Anche in questo caso, consideriamo sempre un vettore $t_0$, sempre scelto in modo tale che
$||t_0||_2 = 1$, e consideriamo la successione
$$
\begin{cases}
    u_k = A \cdot t_{k-1},\\
    t_k = \frac{u_k}{||u_k||_2}, \quad k = 0, 1, 2, \dots
\end{cases}
$$
In questo caso si puo' usare come approssimazione dell'autovalore $\lambda_1$ il quoziente di
Rayleigh
$$
\sigma_k = \frac{t_k^T A t_k}{t_k^T t_k} = t_k^T u_{k+1}.
$$
Dunque si ottiene
$$
\lim_{k \rightarrow \infty} \sigma_k = \lambda_1 \quad \text{e} 
\quad \lim_{k \rightarrow \infty} t_k = \frac{x_1}{||x_1||_2}
$$
e anche in questo caso la convergenza dipende dal rapporto $\big| \frac{\lambda_2}{\lambda_1}
\big|^k$.

La normalizzazione in norma 2, pero', risulta piu' conveniente in casi in cui la matrice $A$ e'
normale. E' dimostrabile che in questi casi, $\sigma_k \rightarrow \lambda_1$ con $k \rightarrow
\infty$ come $\big| \frac{\lambda_2}{\lambda_1} \big|^{2k}$.


