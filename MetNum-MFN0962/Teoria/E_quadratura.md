\newpage
# Quadratura Numerica 
Un problema di quadratura consiste nel trovare una formula di quadratura che approssimi un integrale
definito del tipo 
$$
I(f) = \int_{a}^{b} f(x) dx
$$
e' possibile rappresentare tale formula come combinazione lineare dei valori assunti dalla funzione
integranda in $n+1$ punti 
$$
I_n(f) = \sum^{n}_{j=0} \alpha_j f(x_j), 
$$
In cui:

* I coefficienti $a_i$ sono detti **pesi**
* I punti $x_j$ sono detti **nodi** 

Ogni formula di quadratura ha inoltre un determinato grado di precisione, detta *precisione
algebrica*. Si dice che una formula di quadratura $I_n(f)$ ha grado di precisione *almeno* $r$ se e'
esatta per un polinomio $p \in \Pi_r$. Cioe' se vale la relazione (con $p$ polinomio di grado $r$):
$$
I_n(p) = I(p)
$$

Abbiamo ora tutti gli ingredienti necessari per introdurre due nozioni, che rappresentano di fatto i
metodi principali con cui costruire una formula di quadratura. Il primo, detto *metodo dei
coefficienti indeterminati*, consiste nel fissare arbitrariamente i nodi e determinare i pesi in
modo che la formula abbia precisione algebrica $n$. Quindi, se si usa la base canonica per
rappresentare un polinomio di grano $n$, deve valere la seguente relazione
$$
I_n(x^i) = I(x^i) \qquad i=0,\dots,n
$$
Espandendo le definizioni si ottiene
$$
\sum^n_{j=0} x^i_j \alpha_j = \frac{b^{i+1}-a^{i+1}}{i+1}, \qquad i=0,\dots,n
$$
E quindi e' un sistema lineare del tipo $X^T\alpha = b$, dove $X$ e' la matrice di Vandermonde. E'
gia' stato visto che tale matrice e' non singolare solo quando i nodi sono tutti diversi tra loro,
per cui sappiamo che per ogni precisione algebrica e' possibile costruire una formula di quadratura,
posto che le condizioni di non singolarita' siano soddisfatte. 

Il secondo metodo per costruire le formule di quadratura, sfrutta in modo diretto il teorema di
Weiestrass e quindi i polinomi interpolanti. L'idea e' quella di utilizzare al posto della funzione
integranda un polinomio $P_n(x)$ che la interpola nei nodi scelti. Per cui, sostituendo il polinomio
al posto della funzione nell'integrale si ottiene
$$
I(f) = \int^b_a \sum^n_{j=0} f(x_j) L_j(x) dx
$$
Dove per rappresentare $p_n$ e' stata scelta la forma del polinomio interpolante di Lagrange.
Per la linearita' dell'integrale, si ottiene quindi che
$$
I_n(x) = \sum^{n}_{j=0} f(x_j) \int^b_a L_j(x) dx, 
$$
Abbiamo quindi trovato che il singolo peso della formula $\alpha_j$ equivale a
$$
a_j = \int^b_a L_j(x) dx
$$
In questo caso se i nodi sono pari a $n$ la formula avra' precisione algebrica *almeno* $n$.
Inoltre osserviamo che se $f(x) \in \mathbb{P}_n \rightarrow f(x) = \sum^n_{i=0} f(x_i) L_i(x)$ con
$E_n(f) = 0$ quindi anche l'integrazione e' esatta. 

## Formule di Newton-Cotes
Ora che abbiamo un modo per trovare i pesi e poter cosi' costruire una formula interpolatoria su un
numero arbitrario di nodi, l'unica incognita rimane proprio la distribuzione dei nodi. Le formule di
Newton-Cotes sono formule di quadratura interpolatorie costruite considerando una distribuzione di
*nodi equispaziati*. 
$$
x_j = x_0 + jh, \qquad j = 0,1,...,n.
$$
Possono essere di due tipi: 

* Formule chiuse: L'intervallo di nodi comprende $a$ e $b$, e quindi $h = \frac{b-a}{n}$
* Formule aperte: L'intervallo di nodi non comprende $a$ e $b$, percio' $h = \frac{b-a}{n+2}$

Queste formule dipendono solamente da $n$ oltre che dal passo $h$, e lo si vede impostando un cambio
di variabile ($x = x_0+ht$) nella formula del generico peso $\alpha_j$, ottenendo nel caso delle
formule chiuse
$$
\alpha_j = \int^b_a L_j(x) dx = h \int^n_0 L_j(x_0 + ht) dt
$$
mentre nel caso delle formule aperte
$$
\alpha_j = \int^b_a L_j(x) dx = h \int^{n+1}_{-1} L_j(x_0 + ht) dt
$$
Per le proprieta' di linearita' dell'integrale, la generica formula di quadratura diventa quindi
(raccolgo solo $h$):
$$
I_n(f) = h \sum^n_{j=0} f(x_j) \alpha_j, \qquad \text{ con } \alpha_j = \int^u_l L_j(x_0 + ht) dt
$$
dove

* $l=0$, $u=n$ in caso di formule chiuse 
* $l=-1$, $u=n+1$ in caso di formule aperte 

Tramite l'ultima formula generica, si possono poi derivare le cosiddette formule di Newton-Cotes
elementari:

* **Formula dei trapezi (n=1, chiusa)**:
$$
\int^b_a f(x) dx = \frac{b-a}{2}[f(a) + f(b)]
$$

* **Formula di Simpson (n=2, chiusa)**
$$
\int^b_a f(x) dx = \frac{h}{3} [f(a) + 4 f(\frac{a+b}{2}) + f(b)], \text{ con } h = \frac{b-a}{2}
$$

* **Formula del rettangolo (n=0, aperta)**
$$
\int^b_a f(x) dx = b-a f(\frac{a+b}{2})
$$

In generale, le formule elementari sono utili solo in casi in cui la funzione integranda e' molto
semplice e su intervalli molto piccoli. Per ottenere una precisione maggiore nel calcolo
dell'integrale spesso si ricorre alle cosiddette *formule composte*.

## Formule composte 
Le formule composte sfruttano la proprieta' di linearita' dell'integrale, cioe' che un integrale
definito $a$ a $b$ possa essere rappresentato come la somma di tutti i sotto integrali che lo
compongono 
$$
\int^b_a f(x) dx = \sum^n_{i=1} \int^{x_i}_{x_{i-1}} f(x) dx 
$$
L'idea e' quindi quella di "spezzare" l'intervallo per cui bisogna valutare l'integrale in un numero
arbitratio di singoli integrali la cui ampiezza dell'intervallo e' $h$. Tali integrali piu' semplici
possono poi essere risolti utilizzando una formula semplice come una di quelle derivate in
precedenza di Newton-Cotes.

Il ragionamento puo' essere applicato alle formule di quadratura esposte in precedenza, ottenendo: 

* **Formula composta dei trapezi**: 
$$
I_1^{(c)}(f) = \frac{h}{2} [f(a) + 2 \sum^{n-1}_{i=1} f(x_i) + f(b)]
$$

* **Formula composta di Simpson**:
$$
I_2^{(c)}(f) = \frac{h}{2} [f(a) + 2 \sum^{n-1}_{i=1} f(a + 2ih) + 4 \sum^n_{i=1}
f(a + (2i-1)h) + f(b)]
$$

* **Formula composta del Rettangolo**
$$
I_0^{(c)} = h \sum^{n-1}_{i=0} f(\frac{x_i + x_{i+1}}{2})
$$

Le formule composte di Newton-Cotes hanno inoltre una particolare caratteristica: oltre che ad avere
una precisione algebrica di almeno $n$ (in quanto interpolatorie), ma in caso $n$ sia pari, allora
la precisione algebrica e' di almeno $n+1$. Per cui mentre la formula dei trapezi ($n=1$) ha
precisione algebrica 1, le formule del punto medio ($n=0$) e di Simpson ($n=2$) hanno precisione
algebrica pari a 1 e 3 rispettivamente.

## Errori delle formule 
Per dare una stima dell'errore di quadratura nelle formule di quadratura interpolatoria si puo'
pensare di rappresentare l'errore in termini di errore interpolatorio.
Sia quindi l'errore di interpolazione pari a 
$$
E_n(x) = \frac{f^{(n+1)}(\xi_x)}{(n+1)!} \omega_n(x)
$$
Allora, possiamo rappresentare l'errore di una formula di quadratura interpolatoria come
$$
E_n(f) = \int^b_a \frac{f^{(n+1)}(\xi_x)}{(n+1)!} \omega_n(x)
$$
Applicando il teorema della media si ottengono le seguenti formule per la stima dell'errore

* **Formula dei Trapezi**
    * Elementare: $-f''(\eta) \frac{(b-a)^3}{12}$
    * Composta:   $-f''(\eta) \frac{b-a}{12} h^2$

* **Formula di Simpson**
    * Elementare: $-f^{(4)}(\eta) \frac{[(b-a)/2]^5}{90}$
    * Composta:   $-f^{(4)}(\eta) \frac{(b-a)}{180} h^4$

* **Formula del Rettangolo**
    * Elementare: $f''(\eta) \frac{(b-a)^3}{24}$
    * Composta:   $f''(\eta) \frac{b-a}{24} h^2$

## Esercizi
### Esercizio 1
Si dimostri che la seguente formula di quadratura 
$$
\int^{1}_{-1} f(x) dx \approx \frac{1}{9} [5 f(\sqrt{\frac{3}{5}})+ 8 f(0) + 5 
f(-\sqrt{\frac{3}{5}})] 
$$

* Ha grado di precisione $r=5$
* Si applichi tale formula per valutare 

$$
I = \int^{1}_{0} \frac{sin x}{1+x} dx
$$

**Soluzione:**
Per verificare che abbia grado $r=5$ basta verificare che ponendo $f(x) = x^5$ si ottiene 
$\int^1_{-1} f(x) dx = \frac{1}{9} [5 f(\sqrt{\frac{3}{5}})+ 8 f(0) + 5 f(-\sqrt{\frac{3}{5}})]$.   
Mentre per $f(x) = x^6$ l'uguaglianza non e' verificata. 

Per il punto 2 bisogna cambiare l'intervallo di integrazione da $[0, 1]$ a $[1, -1]$


### Esercizio 2
Determinare i pesi della formula di quadratura
$$
\int^{1}_{0} f(x) dx = \alpha_0 f(0) + \alpha_1 f'(0) + \alpha_2 f(1)
$$
e calcolare il grado di precisione. 

**Soluzione:**
Ci sono 3 $\alpha$, quindi sappiamo che deve essere esatta per $f(x) = 1, x, x^2$
Hint: Poni a sistema le varie sostituzioni nell'uguaglianza ed esplicita gli $\alpha$

### Esercizio 3 
Calcolare con la formula di Simpson semplice e con quella composta su due intervalli l'integrale 
$$
I = \int^2_1 \sqrt{x} dx
$$

e valutare gli errori. 

**Soluzione:**
Applico la formula semplice e ottengo: 
$$
I_1 = \frac{1}{6} [f(1) + f(\frac{3}{2}) + f(2)] \approx 1.2188655
$$

Applico la formula composta su 2 intervalli e ottengo: 
$$

$$
