\newpage
# Ripasso di nozioni di algebra lineare
In questo capitolo si vuole brevemente ripassare ed eventualmente introdurre concetti fondamentali
dell'algebra lineare, fondamentali per capire i prossimi capitoli.  
Nel sottocapitolo dei vettori ci limiteremo a dare qualche definizione senza soffermarci troppo sul 
significato geometrico delle stesse.

## Vettori
**Definizione**: Una ***combinazione lineare*** dei vettori $\{x_1, \dots, x_k\}$ con coefficienti $a_i \in
\mathbb{R}$, $i=1,\dots,k$ e' il vettore $x \in V$ dato da
$$ x = \sum^k_{i=1} \alpha_i x_i $$

**Definizione**: $span(x_1, \dots, x_k)$ e' il sottospazio generato da tutte le possibili combinazioni
lineari dei suoi vettori 

**Definizione:** Si dice che i vettori $\{x_1, \dots, x_k\}$ sono linearmente indipendenti se e
nessun vettore e' esprimibile mediante combinazione lineare di altri. 
In altri termini se vale che
$$ \sum^k_{i=1} \alpha_i x_i = 0 \; \rightarrow \; \alpha_i = 0, i= 1, \dots, k$$

**Definizione**: Una ***base*** e' un insieme di vettori linearmente indipendenti che genera l'intero
spazio vettoriale. La cardinalita' di una base ne determina anche la ***dimensione*** dello spazio
vettoriale.

**Definizione**: Uno **spazio normato** e' uno spazio vettoriale su cui e' definita una funzione
$$ || \cdot || : V \rightarrow \mathbb{R} $$
detta ***norma*** che soddisfa le seguenti proprieta':

* $|| x || \geq 0$ e $|| x || = 0$ (*positivita'*) 
* $|| \alpha x || = | \alpha | || x ||$ (*omogeneita'*) 
* $|| x + y || \geq || x || + || y ||$ (*diseguaglianza triangolare*) 

inoltre, si dice che uno spazio e' **metrico** se la distanza tra due vettori e' misurata mediante
la funzione $$d(x, y) = || x - y ||$$

**Nota:** Le norme che verranno utilizzate piu' frequentemente sono la norma a 1, a 2 e a $\infty$,
definite nel modo seguente:
$$ 
||x||_1 = \sum^n_{i=1} |x_i|, \quad 
||x||_2 = (\sum^n_{i=1} x^2_i)^{\frac{1}{2}}, \quad
||x||_{\infty} = \max_{i=1,\dots,n} |x_i|
$$

**Definizione**: Una successione si dice di ***Cauchy*** se
$$
\lim_{m,n \rightarrow \infty} || x_m - x_n || = 0
$$


## Matrici
**Definizione:** Il ***determinante*** di una matrice e' una funzione che associa ad ogni ***matrice
quadrata*** un numero reale. E' possibile calcolarlo mediante la *formula di Laplace*
$$
det(A) = \sum^n_{j=1} (-1)^{i+j} a_{ij} det(A_{ij})
$$
dove $A_{ij}$ e' la sottomatrice quadrata ottenuta eliminando la riga $i$-esima e la colonna
$j$-esima. Il determinante di tale sottomatrice e' detto **minore complementare**. Mentre la
quantita' $(-1)^{i+j} det(A_{ij})$ e' detto ***cofattore*** o ***complemento algebrico***.
In altri termini, il determinante e' la somma dei cofattori moltiplicati per l'elemento nella
entrata $i,j$ della matrice $A$. Il determinante ci dice inoltre se la matrice e' composta
interamente da righe e colonne linearmente indipendenti tra di loro. Come significato algebrico, un
determinante rappresenta l'area (o volume, dipende dalla dimensione) creata dai vettori che
compongono la matrice. Se $=0$ vuol dire che la trasformazione associata alla matrice, riduce lo
spazio di una o piu' dimensioni.

**Definizione**: Una matrice $A$ e' detta ***invertibile*** o ***non singolare*** se esiste una matrice
$A^{-1}$ tale che $AA^{-1} = I = A^{-1}A$. $A$ e' invertibile se e solo se ha $det(A) \neq 0$.  
Per calcolare l'inversa di una matrice si calcola la sua matrice dei ***cofattori*** $cof(A)$ corrispondente
(guardare sotto per definizione di cofattore). Successivamente si applica la seguente relazione
$$
A^{-1} = \frac{1}{det(A)} \cdot cof(A)^T 
$$

**Definizione**: Il ***rango*** di una matrice e' il numero massimo di vettori riga (o colonna)
linearmente indipendenti che compongono la matrice, oppure come l'ordine della sottomatrice piu'
grande con determinante non nullo.

## Autovalori e Autovettori
**Definizione**: Si dice ***autovalore*** e ***autovettore*** di una matrice $A$ lo scalare $\lambda$ e
il vettore $x \neq 0$ tali che verifichino la relazione
$$
Ax = \lambda x
$$

**Definizione**: Il ***polinomio caratteristico*** e' il polinomio $p_A(\lambda)$ costruito come
$$
p_A(\lambda) = det(A - \lambda I)
$$
La derivazione arriva dal porre $(A - \lambda I)x = 0$, ottenendo un sistema lineare che ha
soluzione banale con $x=0$. Dalla definizione di autovalore e autovettore, pero', bisogna imporre
che $x \neq 0$, per cui bisogna rendere a $0$ la quantita' $(A- \lambda I)$. Per rendere a 0 tale
quantita' si calcola per quali valori ha $det=0$. Ne deriva che gli zeri (*o radici*) del polinomio
caratteristico di $A$ sono gli autovalori di $A$ contati con la loro molteplicita' algebrica.
Per il teorema fondamentale dell'algebra, gli zeri del polinomio (e quindi gli autovalori di $A$)
non sono necessarimente reali e distinti tra loro.  
Per determinare l'autovettore, si sostituisce in $(A - \lambda_k I)x = 0$, per ogni $\lambda_k \in
\{ \lambda \; | \; p_A(\lambda) = 0 \}$ autovalore trovato tramite la soluzione del polinomio
caratteristico. Si possono trovare cosi' gli autovettori associati all'autovalore $\lambda_k$.

**Definizione**: Lo ***spettro*** di una matrice e' l'insieme di tutti i suoi autovalori
$$
\sigma(A) = \{\lambda_1, \dots, \lambda_n\}
$$

**Definizione**: Il ***raggio spettrale*** di una matrice e' l'autovalore massimo in modulo
$$
\rho(A) = \max_{1, \dots, n} | \lambda_k |
$$

**Definizione**: La ***molteplicita' geometrica*** di un autovalore e' il numero massimo di
autovettori linearmente indipendenti associati a tale autovalore. Quando la molteplicita' geometrica
e' minore stretta della molteplicita' algebrica la matrice viene detta ***difettiva***.

**Alcune proprieta' note di autovalori e autovettori**:

* $det(A)= \prod^n_{k=1} \lambda_k$
* $\sigma(A^T) = \sigma(A)$, piu' in generale $\sigma(A^p) = \{ \lambda_1^p, \dots, \lambda_k^p\}$
* Ad autovalori distinti corrispondo autovalori linearmente indipendenti
* Il quoziente di ***Rayleigh*** definito come $\frac{x^T A x}{x^T x}$, fornisce il corrispondente
  autovalore se e' noto l'autovettore $x$ a priori.
  
## Matrici di forma particolare

**Definizione**: Una matrice e' detta ***triangolare superiore*** (analogamente ***triangolare
inferiore***) se e' composta da tutti elementi nulli al di sopra (analogamente al di sotto) della
diagonale principale. Quando una matrice e' sia diagonale superiore che inferiore e' detta matrice
***diagonale***.
Alcune proprieta' importanti riguardanti le matrici triangolari (e diagonali) sono:

* $det(D) = \prod^n_{i=1} a_{ii}$ (cioe' il determinante uguale al prodotto degli elementi sulla
  diagonale principale).
* $\sigma(D) = \{d_{11}, \dots, d_{kk}\}$, (lo spettro di una matrice coincide con la diagonale
  principale)

**Definizione**: Sono dette matrici ***sparse*** le matrici che hanno un numero di elementi diversi
da $0$ inferiore al $10\%$ del totale degli elementi. Analogamente, una matrice e' detta ***densa***
se la maggior parte dei suoi elementi e' non nulla.

**Definizione**: Una ***matrice di permutazione*** $P$ e' una matrice che si ottiene permutando le
righe della matrice identita' $I$. L'effetto della matrice di permutazione e' che se viene
moltiplicata a sinistra di una matrice ne permuta le righe, mentre se viene moltiplicata a destra ne
permuta le colonne.

**Definizione**: Una matrice quadrata $A$ si dice ***riducibile*** quando esiste una matrice di
permutazione $P$ tale che
$$
PAP^T = \begin{bmatrix}
B_{11} & B_{12} \\ 
0 & B_{22} 
\end{bmatrix}
$$
con $B_{11}$ e $B_{22}$ matrici di dimensioni $(k \times k)$ e $(n-k) \times (n-k)$ rispettivamente.
Tale proprieta' e' utile per la risoluzione di alcuni sistemi lineari. E' possibile scomporli in
sottosistemi composti dalle matrici dei coefficienti $B_{11}, B_{12}, B_{22}$.
Puo' essere anche utile per il calcolo degli autovalori, poiche' e' possibile calolare gli
autovalori delle matrici piu' piccole, scomponendo di fatto il problema in due problemi piu'
semplici. 

**Teorema**: Sia $G$ il grafo associato alla matrice $A$, i cui nodi sono costruiti con il numero di
righe (o colonne siccome e quadrata), connessi tra loro tramite un arco $(i, j)$, inserito se
$a_{ij} \neq 0$. Allora, se $G$ e' ***fortemente connesso*** (cioe' se esiste un cammino orientato
per ogni coppia di nodi $(i, j)$) $A$ e' riducibile.   

**Definizione**: Due matrici $A$ e $B$ si dicono ***simili*** quando esiste una matrice $S$ non
singolare ($det(S) \neq 0$) tale che 
$$
B = S^{-1}AS
$$
Le matrici simili condividono gli stessi autovalori e autovettori.

**Definizione**: Una matrice $A$ si dice ***diagonalizzabile*** se esiste una matrice $X$ non
singolare tale che
$$
X^{-1}AX = D = diag(\lambda_1, \dots, \lambda_n)
$$
In altri termini, una matrice diagonalizzabile e' una matrice simile ad una matrice diagonale $D$.
Quando $X$ e' unitaria (cioe' $X X^{T} = X^{T} X = I$) allora si dice che $A$ e' ***unitariamente
diagonalizzabile***.  
Non tutte le matrici sono diagonalizzabili, a tal proposito, diciamo che una matrice $A$ e'
diagonalizzabile se e solo se ammette $n$ autovettori linearmente indipendenti.
Questo lo si puo' dimostrare applicando la definizione di autovalore e autovettore, siano
$$
Ax_i = \lambda_i x_i \quad i=0, \dots, n 
$$
i rispettivi autovalori e autovettori di $A$, allora possiamo riscrivere la seguente relazione in
forma matriciale come 
$$
A [x_1 \cdots x_n] = [x_1, \cdots, x_n]
\begin{bmatrix}
\lambda_1 & & \\
 & \ddots & \\
 & & \lambda_n
\end{bmatrix}
$$
Ossia $AX = XD$, dove $X$ e' la matrice avente gli autovettori di $A$ come colonne. Se gli
autovettori sono indipendenti, la matrice $X$ e' invertibile, per cui si puo' trovare $X^{-1}$ per
cui se moltiplicata per la relazione precedente si ottiene
$$
X^{-1}AX = D
$$
Tale diagonalizzazione e' detta ***fattorizzazione spettrale***, perche' utilizza gli autovalori e
gli autovettori di una matrice per ottenere la sua diagonale. 

**Definizione**: Una matrice quadrata $A$ di ordine $n$ e' detta ***diagonalmente dominante*** per
righe [se](se) 
$$
a_{ii} \geq \sum^n_{j=1, j \neq i} | a_{ij} |, \quad i=1, \dots, n
$$
Si dice inoltre che e' ***strettamente diagonalmente dominante*** se vale il minore stretto, mentre
viene detta ***irriducibilmente diagonalmente dominante*** se e' anche irriducibile.

