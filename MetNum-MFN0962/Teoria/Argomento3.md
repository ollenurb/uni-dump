% Approssimazione di funzioni 
# Approssimazione di funzioni 

In alcuni casi una funzione e' nota solo attraverso un insieme di punti di cordinate $x_i,y_i), i=0,...,n$
tali che $y_i=f(x_i)$. Approssimare una funzione significare trovare la regola generica che descrive 
una funzione dato un suo sottoinsieme di punti. 

## Interpolazione 
Sia dato l'insieme di punti $x_i,y_i), i=0,...,n$, una funzione $\phi(x)$ **interpola** i punti se $\phi(x_i)
=y_i, \text{ } i=0,...,n$

Si vuole ottenere una funzione interpolante $\phi$ come combinazione lineare di $n+1$ funzioni 
$\varphi_j$ con $j = 0,...,n$. 

#### Teorema
>La funzione che interpola i dati esiste ed e' unica ssse il determinante della matrice definata da 
>$$
>\Phi_{ij} = \varphi_j(x_i) \text{ con } i,j=0,...,n
>$$
>e' diverso da zero. Tale determinante e' detto **determinante di Haar**

**Sistema di Chebychev**: Insieme di funzioni che verifica la condizione di unisolvenza ($det(\Phi) \neq 0$).

### Interpolazione Polinomiale
Le funzioni piu' frequentemente utilizzate come base per l'interpolazione sono i polinomi. 
Il seguente teorema afferma che un polinomio e' in grado di approssimare *bene quanto si vuole* una funzione
continua: 

#### Teorema (Weistrass) 
>Sia $f \in C[a,b]$. Per ogni $\varepsilon > 0$ esiste un intero $n$ e un polinomio $P_n$ di grado $n$ tale
>che 
>$$
>\left \|  f-P_n  \right \|_{\infty} < \varepsilon
>$$
