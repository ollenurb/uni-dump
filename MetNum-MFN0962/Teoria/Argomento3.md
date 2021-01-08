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

Cio' dimostra che il polinomio di grado $n$ che meglio approssima una funzione $f$ la interpola su $n+1$ 
punti. 

Il problema dell'interpolazione polinomiale puoo' essere formulato nel modo seguente: dato un insieme di 
punti 
$\{(x_i, y_i),..., (x_n, y_n)\}, determinare un polinomio $p_n$ tale che
$$
p_n(x_i) = y_i, \text{   } i=0,..,n
$$

#### Teorema 
>Il polinomio interpolante esiste se e solo se $x_i \neq x_j$ per $i \neq j$. 

Per la dimostrazione e' sufficiente dimostrare che il determinante di Haar e' diverso da zero. 
Imponendo le condizioni di interpolazione, si ottiene il sistema lineare 
$$
\sum_{j=0}^{n} x_{i}^{j} a_j = y_i, \text{   } i=0,...,n
$$

La cui matrice di coefficienti $X$ e' detta **matrice di Vandermonde** e si puo' dimostrare che: 
$$
det(X) = \prod_{i,j=0_{i>j}}^{n} (x_i - x_j).
$$

#### Polinomio interpolante di Lagrange 
E' una forma di rappresentazione di polinomi diversa da quella canonica. 
**I polinomi caratteristici di Lagrange** sono definiti come:  
Assegnati di dati $(x_i, y_i), i=0,...,n$ 
$$
L_j(x) = \prod^{n}_{k=0, k \neq j} \frac{x-x_k}{x_j-x_k}
$$
(*Si veda libro per eventuale espansione della produttoria a pagina 204*)   

**Il polinomio interpolante di Lagrange** asuume la forma: 
$$
p_n(x) = \sum^{n}_{j=0} y_j L_j (x)
$$

**Errore di interpolazione**: Per valori di $x \neq x_i$ si puo' valutare lo scarto (errore) che si 
calcola come: 
$$
E_n(x) = f(x) - p_n(x) 
$$
Dove $f$ e' la funzione da interpolare e $p_n$ e' il polinomio che la interpola. 
Questo errore $E$ e' esprimibile nella forma: 
$$
E_n(x) = \frac{f^{n+1}(\xi_x)}{(n+1)!} \omega_n(x)
$$
dove $\omega_n(x)=(x-x_0)(x-x_1)...(x-x_n)$

Informazioni qualitative sull'errore: 

* Il valore assoluto del numeratore $| f^{(n+1)}(\xi_x) |$ puo' essere maggiorato con una costante. 
Cio' significa che il rapporto puo' essere reso piccolo a piacere se $n$ e' sufficientemente grande.
* Il secondo fattore $\omega_n(x)$ e' un polinomio di grado $n+1$ che dipende dalla posizione dei 
punti $\{ x_i \}$, cio' significa che la scelta delle ascisse dei punti di interpolazione influenza 
l'andamento dell'errore. 

**Nota:**L'errire di interpolazione non necessariamente tende a zero quando $n$ tende a infinito.  
**Distribuzione dei nodi**: Criterio con la quale si scelgono $n+1$ ascisse di interpolazione da un 
intervallo $[a,b]$ su cui $f$ e' definita.  

#### Teorema
>Per ogni funzione continua esiste almeno una distribuzione dei nodi tale che l'errore di interpolazione 
>converga a zero per $n \rightarrow \infty$ 

La convergenza a zero dell'errore e' assicurata solo se la funzione da interpolare e' derivabile e se 
i nodi sono scelti secondo una regola particolare.  

#### Teorema 
>Se $f \in C^1[a, b]$ e se le ascisse di interpolazione $\{ x_i \}^{n}_{i=0}$ sono gli zeri del polinomio
>di Chebychev di grado $n+1$ alllora l'errore di interpolazione tende a zero per $n \rightarrow \infty$

**Polinomio di Chebychev**: Un polinomio di Chebychev di grado $n+1$ in $[-1;1]$ e' definito come: 
$$
T_{n+1} = cos((n+1) \theta) = 0 
$$

Per ottenere quindi i cosiddetti **nodi di Chebycheff** e' necessario trovare le soluzioni di 
$$
T_{n+1}(x) = 0 \rightarrow cos((n+1) \theta) = 0 \rightarrow x_k = cos(\frac{2k+1}{2n+2} \pi), \text{  }
k= \{ 0,1,..n\}
$$
oppure tramite la formula di ricorrenza 
$$
T_{n+1}(x)=2x T_n(x) - T_{n-1}(x)
$$

Per espandere l'intervallo da $[-1;1]$ ad un generico intervallo $[a,b]$ e' necessario applicare la 
trasformazione
$$
t_k = \frac{b-a}{2} x_k + \frac{a + b}{2}.
$$

#### Riassumendo
Siccome utilizzare dei nodi equispaziati potrebbe far tendere l'errore a infinito col tendere del grado
del polinomio $n$ a infinito, grazie al teorema discusso e' sufficiente scegliere i punti che sono i 
nodi di Chebychev. (cioe' gli zeri dei polinomi di Chebychev) 

### Le costanti di Lebesgue

**Migliore approssimazione uniforme**: E' il polinomio $p_{n}^{*}$ che minimizza l'errore fissato $n$

**Matrice di interpolazione**: Serve per rappresentare la distribuzione dei nodi in cui la n-esima 
riga contiene gli $n+1$ nodi da utilizzare per costruire il polinomio interpolante di grado $n$. 
Questa matrice e' infinita. 

#### Definizione 
>Sia $P_n l'operatore lineare che a ciascuna funzione $f$ associa il polinomio $P_n f$ che la interpola
>sui nodi assegnati e sia 
>$$
>E_n(f,X) = \left || f - P_nf \right ||_{\infty}
>$$
>il corrispondente errore di interpolazione. 

#### Teorema 
>Sia $f \in C[a,b]$ e sia $X$ una matrice di interpolazione. Allora 
>$$ E_n(f, X) \leq (1 + \Lambda_n (X)) E^{*}_n(f), $$
>dove 
>$$ \Lambda_n (X) = \left || \lambda_n(x) \right ||_{\infty} $$
>sono le **costanti di Lebesgue** e 
>$$ \lambda_n (x) = \sum^{n}_{j=0} \left | L_{n}^{(n)} (x) \right |$$
>sono le **funzioni di Lebesgue**. 

Con la scelta dei nodi di Chebichev si ha che $\Lambda_n \approx \frac{2}{\pi} logn$, mentre con la 
scelta di nodi equidistanti si ha che $\Lambda_n \geq e{n/2}$

Le **costanti di Lebesgue** sono importanti nello studio della stabilita' della valutazione del 
polinomio di interpolazione 
$$
p_n(x) = \sum^{n}_{k=0} y_k L_k(x)
$$

#### Polinomio interpolante di Newton
La notazione $f[x_0, ..., x_n]$ indica il coefficiente del termine di grado massimo di un polinomio che 
interpola una funzione $f(x)$ nei punti di ascisse $[x_0,...,x_n$. 

Per calcolare un coefficiente di grado massimo qualsiasi si utilizza la seguente relazione: 
$$
f[x_0, ..., x_n] = \frac{ f[x_1, ..., x_n] - f[x_0, ..., x_{n-1}] }{x_n - x_0}
$$
Questa formula permette di generare lo **schema delle differenze divise**.  
Mediante queste differenze divise, e' possibile dare una rappresentazione esplicita del polinomio 
interpolante: 
$$
\begin{multiline}
p_n(x) & = p_{n-1}(x) + f[x_0,...,x_n]\omega_{n-1}(x) \\
       & = p_{n-2}(x) + f[x_0,...,x_{n-1}]\omega_{n-2}(x) + f[x_0, ..., x_n]\omega_{n-1}(x) \\
       & = ... \\
       & = f[x_0] + f[x_0, x_1] \omega_{0}(x) + ... +  f[x_0, ..., x_n]\omega_{n-1}(x) \\
\end{multiline}
$$
il quale, espanso nella **foma di Newton** risulta essere: 
$$
\begin{multiline}
p_n(x) = f[x_0] & + f[x_0, x_1](x - x_0) + f[x_0, x_1, x_2](x-x_0)(x-x_1) + ... \\
                & + f[x_0,.., x_{n-1}](x - x_0)...(x-x_{n-2}) \\
                & + f[x_0,.., x_{n}](x - x_0)...(x-x_{n-1}) \\
\end{multiline}
$$

**Complessita' e possibili svantaggi**:

* Calcolo coefficienti $O(n^2)$
* Valutazione polinomio $O(n)$
* Calcolo del polinomio instabile in caso di nodi molto vicini tra di loro

**Vantaggi**: 

* Non vegnono ricacolati i coefficienti ad ogni valutazione se si memorizza la tabella delle differenze 
divise
* E' possibile aggiungere un nuovo nodo di interpolazione, aggiornando la tabella delle diff. div. ed 
aggiungendo un termine al polinomio. 

#### Esercizi
TODO: Presenti sul file **Esercizi.pdf** nella quarta settimana sulla pagina moodle del corso.
(Hint: Per vedere come svolgerli guardare la lezione di teoria della stessa settimana) 


