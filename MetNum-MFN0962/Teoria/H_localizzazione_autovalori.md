\newpage
# Localizzazione degli Autovalori
## Funzioni lineari
In algebra lineare, una funzione lineare e' una funzione che associa ad un vettore $x \in
\mathbb{R}^n$ il vettore $f(x) \in \mathbb{R}^m$ che gode della proprieta' di linearita'
$$
\forall x, y \in \mathbb{R}^n \text{ e } \forall \alpha, \beta \in \mathbb{R} 
\qquad f(\alpha x + \beta y) = \alpha f(x) + \beta f(y)
$$
In altre parole, e' una funzione che preserva le operazioni di somma tra vettori e prodotto per uno
scalare. Per esempio, la funzione $f: \mathbb{R}^3 \rightarrow \mathbb{R}$, che associa al vettore
$x \in mathbb{R}^3$ il numero reale:
$$
f(x) = 2 x_1 - 4 x_2 + 7 x_3
$$
e' lineare, in quanto soddisfa la proprieta' di linearita' precedente. Infatti, $\forall x, y \in
\mathbb{R}^3$ e $\forall \alpha \in \mathbb{R}$ si ha:
$$
\begin{split}
    f(x+y) &= 2(x_1 + y_1) - 4(x_2 + y_2) + 7(x_3 + y_3)
           = 2x_1 - 4x_2 + 7x_3 + 2y_1 - 4y_1 + 7y_3 
           = f(x) + f(y)\\
    f(\alpha x) &= 2(\alpha x_1) - 4(\alpha x_2) + 7(\alpha x_3) 
           = \alpha(2x_1 - 4x_2 + 7x_3)
           = \alpha f(x)
\end{split}
$$

Dal momento che moltiplicando una matrice $A \in \mathbb{R}^{(m,n)}$ per un vettore $x \in
\mathbb{R}^n$ si ottiene un vettore $y \in \mathbb{R}^m$, possiamo rappresentare una qualsiasi
applicazione lineare semplicemente mediante una matrice $A$. Data quindi una matrice $A$ e'
possibile costruire un'applicazione lineare $f$ equivalente 
$$
f(x) = A \cdot x
$$
Sappiamo inoltre che e' lineare poiche' segue dalla proprieta' del prodotto fra matrici.

>***Teorema**: Una funzione $f: \mathbb{R}^n \rightarrow \mathbb{R}^m$ e' lineare se e solo se esiste
>una matrice $A$ di tipo $m \times n$ tale che:*
>$$
f(x) = A \cdot x
>$$
>*inoltre la matrice $A$ e' unica una volta fissate le basi $\mathbb{R}^n$ e $\mathbb{R}^m$.*

Per il teorema precedente possiamo quindi ragionare sulle trasformazioni lineari in modo puramente
algebrico, senza dover utilizzare strumenti tipici dell'analisi matematica.

## Autovalori e autovettori
Ragioniamo ora sempre in termini di matrici come trasformazioni lineari, e diamo la definizione di
autovalore e autovettore in questi termini

>***Definizione:** Sia $f: \mathbb{R}^n \rightarrow \mathbb{R}^n$ una trasformazione lineare. Se $v
>\in \mathbb{R}^n, v \neq 0$, e $\lambda \in \mathbb{R}$, sono tali che*
>$$
f(x) = \lambda v
>$$
>*Allora $v$ e' autovettore della **trasformazione** $f$ e $\lambda$ e' il suo **autovalore***

Dalla proprieta' di linearita' della trasformazione $f$, abbiamo che se $v$ e' un autovettore di
$f$ con autovalore $\lambda$, allora qualsiasi altro multiplo di $v \neq 0$ sara' anch'esso un
autovettore con lo stesso autovalore $\lambda$. 
Si dice infatti che gli autovettori aventi lo stesso autovalore fissato $\lambda$, generano un
sottospazio vettoriale chiamato *autospazio* relativo all'autovettore $\lambda$.

In generale, possiamo parlare di autovettori e autovalori anche in termini della matrice di
trasformazione $A$ associata a $f$, per cui abbiamo che $\lambda$ e $v$ sono rispettivamente
autovalori e autovettori della matrice $A$ se
$$
Av = \lambda v
$$

Richiamiamo brevemente le definizioni viste in precedenza. Abbiamo che per calcolare gli autovalori
si ricorre al polinomio caratteristico $P_n(\lambda) = det(A - \lambda I_n)$, mentre per calcolare
gli autovettori si risolve il sistema omogeneo $(A - \lambda I_n)x = 0$ rispetto a $x$.
In caso siano gia' noti gli autovalori $\lambda$ e' possibile ottenere gli autovettori tramite il
quoziente di Rayleigh.

## Localizzazione degli autovalori
Tramite alcuni teoremi e' possibile localizzare gli autovalori di una matrice all'interno del piano
complesso. Il primo di questi teoremi (e anche il piu' generico) e' il seguente

>***Teorema (Hirsch)**: Sia $A$ una matrice di ordine $n$ e sia $|| \cdot ||$ una qualsiasi delle
>tre norme di matrici tra $\{1, 2, \infty \}$. Allora il cerchio definito come*
>$$
\{ z \in \mathbb{C} \; : \; |z| \leq ||A|| \}
>$$
>*contiene tutti gli autovalori di $A$.*

Vediamo ora pero' un teorema piu' raffinato rispetto al teorema precedente, in quanto ci da
informazioni piu' precise per la localizzazione degli autovalori nel piano complesso. Il teorema e'
il seguente:

>***Primo Teorema di Gerschgorin**: Gli autovalori di una matrice $A$ di ordine $n$ sono contenuti
>nell'insieme*
>$$
S_R = \bigcup^n_{i=1} R_i
>$$
>*dove*
>$$
R_i = \bigg\{ z \in \mathbb{C} \; : \; |z-a_{ii}| \leq \sum^n_{j=1, j \neq i} |a_{ij}| \bigg\}
>$$
>*con $i=1, \dots, n$ sono detti **cerchi riga di Gerschgorin***.

Cioe' un cerchio riga corrisponde ad un cerchio di centro $a_{ii}$ e raggio corrispondente alla
somma di tutti gli elementi sulla riga corrente, eccetto l'elemento $a_{ii}$.

**Dimostrazione**: Sia $\lambda$ un autovalore di $A$ e $x$ un autovettore corrispondente.
Nella definizione di autovalore e autovettore, e' possibile riscrivere la relazione esplicitando il
prodotto riga per colonna nel modo seguente
$$
Ax = \lambda x \quad \leftrightarrow \quad \sum^n_{j=1} a_{ij} x_j = \lambda x_i \qquad i=1, \dots, n
$$
Sia $x_p$ tale che $|x_p| = \max_{j=1, \dots, n} |x_j|$, allora possiamo *"portare fuori"* dalla
somma il termine $x_p$, e considero la relazione precedente per $i=p$
$$
\sum^n_{j \neq p} a_{pj} x_j + (a_{pp} x_p) = \lambda x_p \quad \leftrightarrow \quad 
(\lambda - a_{pp}) x_p = \sum^n_{j \neq p} a_{pj} x_j
$$
e quindi, per la proprieta' del modulo e per il fatto che $x_p$ e' l'elemento di modulo massimo,
possiamo riscrivere la relazione precedente come
$$
| \lambda - a_{pp}| \; |x_p| \leq
\sum^n_{j \neq p} |a_{pj}| \; |x_j| \leq
\sum^n_{j \neq p} |a_{pj}| \; |x_p|
$$
Dividendo infine per $|x_p| \neq 0$, dal momento che $x$ e' un autovalore, per la definizione non
puo' essere un vettore nullo, per cui esistera' per forza un elemento $\neq 0$. Dividendo per questa
quantita' otteniamo
$$
| \lambda - a_{pp}|  \leq \sum^n_{j \neq p} |a_{pj}|.
$$
Poiche' a priori non e' noto il valore di $p$, possiamo dedurre solo che $\lambda \in \bigcup
^n_{i=1} R_i$. Naturalmente questo discorso possiamo estenderlo a tutti gli autovalori della matrice
$A$, ottenedo quindi la tesi $\blacksquare$. 

Dal momento che il teorema puo' essere applicato anche ad $A^T$, possiamo anche definire i **cerchi
colonna di Gerschgorin** $C_i$.
Quindi, per avere una localizzazione piu' precisa possiamo combinare sia i cerchi riga che i cerchi
colonna e affermare che gli autovalori di $A$ sono contenuti nell'insieme
$$
S_R \cap S_C
$$
dove
$$
S_R = \bigcup^n_{i=1} R_i \quad \text{e} \quad S_C = \bigcup^n_{i=1} C_i 
$$

Vediamo ora il secondo e terzo teorema di Gerschgorin

>***Secondo Teorema di Gerschgorin**: Se l'unione $S_1$ dei $k$ cerchi di Gerschgorin e' disgiunta
>dall'unione $S_2$ dei rimanenti $n - k$, cioe'*
$$
S_1 = \bigcup^k_{i=1} R_i, \qquad S_2 = \bigcup^{n}_{i=k+1} R_i, \qquad S_1 \cap S_2 = \emptyset
$$
>*allora $S_1$ contiene $k$ autovalori di $A$ e $S_2$ i restanti $n-k$, contati con la loro
>molteplicita'*.

Per esempio, se un cerchio e' disgiunto da tutti gli altri, allora contiene un solo autovalore
($k=1$).
Inoltre sappiamo che tale valore e' reale (altrimenti anche il suo coniugato dovrebbe appartenere
al cerchio).
Se invece ad esempio tutti i cerchi sono disgiunti, vuol dire che tutti gli autovalori di $A$ sono
reali con molteplicita' 1.

Introduciamo per finire il terzo teorema di Gerschgorin e un lemma importante che ne deriva

>***Terzo Teorema di Gerschgorin**: Sia $A$ una matrice irriducibile. Se un suo autovalore appartiene
alla frontiera $S_R$, esso deve appartenere allla frontiera di ciascun cerchio $R_i$, con $i=1,
\dots, n$*.

Possiamo ora combinare i teoremi precedenti per dimostrare un importante teorema:

>***Teorema della dominanza diagonale:** Se $A$ e' strettamente o irriducibilmente diagonalmente
dominante, allora e' non singolare*.

Da cui ne deriva il seguente 

>***Corollario**: Se e' verificata una delle ipotesi del teorema precedente e se la matrice $A$ e'
hermitiana (nel caso reale simmetrica) con $a_{ii} > 0, i=0, \dots, n$, allora $A$ e' definita
positiva.* 

**Dimostrazione**: Poiche' $A$ e' hermitiana (nel caso reale simmetrica), i suo autovalori sono
reali. Inoltre, le ipotesi che $a_{ii}>0$, la dominanza diagonale e il primo teorema di Gerschgorin
implicano che $\lambda_i \geq 0, i = 0, \dots, n$.   
Infine, essendo la matrice non singolare per il teorema della dominanza diagonale, si ha che
$\lambda_i > 0, i = 1, \dots, n$ $\blacksquare$.

Questo corollario ci chiarisce del perche' il metodo di Gauss senza pivoting sia stabile per matrici
diagonalmente dominanti.

## Esercizi
**Esercizio 1**: Si applichino il teorema di Hirsch e i teoremi di Gerschgorin per localizzare gli
autovalori della matrice
$$
A = \begin{bmatrix}
        15& -2&  2\\
         1& 10& -3\\
        -2&  1&  0\\
    \end{bmatrix}
$$

**Soluzione:**

**Esercizio 2:** Utilizzare i teoremi di Gerschgorin per localizzare gli autovalori e rispondere ai
seguenti quesiti.

* La matrice $A$ e' diagonalizzabile?
* La matrice $B$ ha qualche autovalore non reale?
* La matrice $C$ e' invertibile? Ha un autovalore $>20$?

con
$$
A = \begin{bmatrix}
          1& 0.1& 0.2\\
        0.2&   4& 0.3\\
        0.4& 0.5& 8  \\
    \end{bmatrix},
\quad
B = \begin{bmatrix}
        17&  2& 2\\
         1& 10& 3\\
         1&  2& 0\\
    \end{bmatrix}
\quad
C = \begin{bmatrix}
        3& 0& 1& 0 \\
        0& 11& 1& -1 \\
        1& 1& 10& 2 \\
        0& -1& 2& 20 \\
    \end{bmatrix}
$$


**Soluzione**:



