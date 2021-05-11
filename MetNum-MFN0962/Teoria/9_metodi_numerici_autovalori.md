\newpage
# Metodi numerici per il calcolo degli autovalori
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

$$
