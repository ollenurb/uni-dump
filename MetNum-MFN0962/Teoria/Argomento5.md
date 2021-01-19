# Complementi di Algebra Lineare 

#### Definizione
>Uno **spazio lineare** (o vettoriale) reale e' un insieme V su cui sono definite due operazioni di somma 
>e prodotto per uno scalare 
>$$
>\begin{aligned}
>+ :  V \times V & \rightarrow V \\ 
>     (x, y)     & \rightarrow x + y
>\end{aligned}
>$$
> e 
>$$
>\begin{aligned}
>\cdot :  \mathbb{R} \times V & \rightarrow V \\ 
>                 (\alpha, x) & \rightarrow \alpha x
>\end{aligned}
>$$
>che, per ogni $\alpha, \beta \in \mathbb{R}$ e $x, y z \in V$, godono delle seguenti proprieta' 
>
>1. $x+y \in V$       (Chiusura rispetto alla somma)  
>2. $\alpha x \in V$  (Chiusura rispetto al prodotto)   
>3. $x+y = y+x$       (Proprieta' commutativa)  
>4. $(x+y)+z=x+(y+z)$ (Proprieta' associativa)  
>(Per le rimanenti guardare il libro) 


#### Definizione 
>Si dice **combinazione lineare** dei vettori $\{ x_1,..., x_k \}$ con coefficienti 
>$\alpha_i \in \mathbb{R}, i=1,...,k$, il vettore $x \in V$ dato da: 
>$$
>x=\sum^{k}_{i=1} \alpha_i x_i
>$$
>si dice inoltre che i vettori $\{ x_1,..., x_k \}$ sono **linearmente indipendenti** se: 
>$$ 
>\sum^k_{i=1} \alpha_i x_i = 0 \rightarrow \alpha_i = 0, i= 1,...,k.  
>$$


#### Operazioni su matrici e vettori

**Prodotto scalare vettori**  
Dati due vettori $V,K \in \mathbb{R}^n$ il loro prodotto scalare e' definito come: 
$$
R = \sum^{n}_{i=0} v_i k_i
$$

Le matrici costituiscono uno **spazio lineare** con le operazioni di somma e prodotto per uno scalare 
definite come: 
$$
(A+B)_{ij} = a_{ij} + b_{ij}, \text{    } (\alpha A)_{ij} = \alpha a_{ij}
$$

Se una matrice $A \in \mathbb{R}^{m \times n}$ e una matrice $B \in \mathbb{R}^{n \times n}$ il loro 
prodotto e' la matrice $C=AB \in \mathbb{R}^{m \times p}$ definita da 
$$
c_{ij} = \sum^n_{k=1} a_{ik} b_{kj}, \text{ } i=1,...,m, i=1,...,p
$$
In altri termini, posso calcolare il prodotto matriciale solo in caso il numero di colonne di una coincidano
con il numero di righe dell'altra

Si nota che la proprieta' non e' commutativa, e quindi l'ordine dei termini puo' influenzare il risultato. 
**Nota: Bisogna porre particolare attenzione alla dimensione della matrice risultate quando si fa il 
prodotto.**


**Determinante**: Per calcolarlo guardare lezione su ripassi matrici


#### Autovalore e autovettore

#### Definizione 
>Si dicono **autovalore** ed **autovettore** di una matrice $A$ uno scalare $\lambda$ ed un vettore 
>$x \neq 0$ che verifichino la relazione 
>$$
>Ax = \lambda x
>$$

**Per calcolare gli autovalori**: 
Bisogna calcolare $det(A-\lambda I)=0$ e quindi risolvere: 
$$
A- \lambda I =
A - 
\begin{pmatrix}
    \lambda & 0 & 0 \\ 
    0 & \lambda & 0 \\
    0 & 0 & \lambda \\
\end{pmatrix}
$$
e poi farne il determinante per trovare il polinomio caratteristico per poi porlo $=0$ e risolverlo.


**Per calcolare l'autovettore:** 
Bisogna calcolare $(A - \lambda_1 I) \underline{x} = 0$, dove $\lambda_1$ e' stato calcolato in precedenza 
Gli autovalori sono tutti reali se $A = A^T$ (simmetrica). 


### Diagonalizzazione di matrici 

#### Definizione 
>Le matrici $A$ e $B$ si dicono simili quando esiste una matrice non singolare $S$ tale che: 
>$$
>B = S^{-1} AS 
>$$

#### Teorema
>Le matrici simili hanno gli stessi autovalori. 

#### Definizione 
>Una matrice $A$ si dice **diagonalizzabile** se esiste una matrice $X$ non singolare tale che: 
>$$
>X^{-1} A X = D = diag\{ \labda_1, ..., \lambda_n \}
>$$

**Proprieta matrice diagonale**: Se moltiplico una matrice diagonale $L$ per una matrice $A$

* Se $A L$ i fattori della matrice diagonale moltiplicano le **colonne** di A
* Se $L A$ i fattori della matrice diagonale moltiplicano le **righe** di A



