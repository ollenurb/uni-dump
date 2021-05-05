\newpage
# Metodi diretti per la soluzione di sistemi lineari

**Distanza euclidea** tra due vetori $v, w \in \mathbb{R}$ e' definita come 
$$
\left \| v - w  \right \|_2 = \sqrt{\sum^{n}_{i=1}(v_1 - w_i)^2}
$$

### Sistemi lineari facili 
Si vuoile introdurre un metoodo diretto per la risoluzione di un sistema di $n$ equazioni lineari di $n$ 
incognite della forma 
$$
Ax=b 
$$
Tale sistema ammatte un'unica soluzione se e solo se la matrice $A$ e' non singolare, e in questo caso 
$$
x = A^{-1} \cdot b 
$$

#### Sistemi diagonali 
Se la matrice dei coefficienti (rinominata da $A$) $D$ e' **diagonale** con $det(d) \neq 0$ allora il 
sistema 
$$
D \cdot x = b
$$
e' immediato e ammette un'unica soluzione 
$$
x_i = \frac{b_i}{d_i}, i=1,...,n.
$$

**Complessita' computazionale:** $O(n)$

#### Sistemi ortogonali 
Se la matrice dei coefficienti $Q$ e' **ortogonale** (cioe' $Q^T Q = QQ^T = I$) allora il sistema 
$$
A \cdot x = b
$$
ammette un'unica soluzione 
$$
x_i = \sum^{n}_{j=1} q_{ji} b_j, i=1,...,n
$$

**Complessita' computazionale:** $O(n^2)$


#### Sistemi triangolari 
Data una matrice dei coefficienti triangolare inferiore $L$ o superiore $U$, allora e' possibile 
risolvere il sistema tramite un metodo iterativo di sostituzioni in avanti (**forward substitution**). 


