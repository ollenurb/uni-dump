\newpage
# Approssimazione di funzioni

In alcuni casi l'espressione di una funzione non e' nota a priori o e' in una forma molto complicata
e difficile da trattare. Per questa ragione, in questi casi si preferisce darne un'approssimazione
mediante un insieme di punti di coordinate $(x_i,y_i), i=0,...,n$ tali che $y_i=f(x_i)$.
Approssimare una funzione significa quindi trovare la regola generica che descrive una funzione dato
un suo sottoinsieme di punti.
I due approcci al problema che verranno trattati sono rispettivamente l'**interpolazione** e
**l'approssimazione ai minimi quadrati**.

## Interpolazione 
L'interpolazione e' un metodo che consiste nell'individuare delle funzioni $f(x)$ passanti per tutti
i punti appartententi all'insieme noto.  Piu' precisamente, dato l'insieme di punti $(x_i,y_i),
i=0,...,n$, si dice che una funzione $\phi(x)$ **interpola** i punti se $\phi(x_i) =y_i, \text{ }
i=0,...,n$.  
L'obiettivo e' quello di ottenere la funzione interpolante $\phi$ come combinazione
lineare di $n+1$ funzioni $\varphi_j$ con $j = 0,...,n$.  
$$ 
\phi(x) = \sum^{n}_{j=0} a_j \varphi_i (x)
$$

Per ottenere i coefficienti $a_j$ della funzione e' sufficiente imporre la condizione di
interpolazione ($a_j \varphi_i (x_i)= y_i$) ottenendo cosi' la formalizzazione del problema: 
$$
\sum^n_{j=0} a_j \varphi_i (x_i) = y_i
$$

La cui soluzione e' il vettore dei coefficienti $a$. 

### Interpolazione Polinomiale
L'interpolazione polinomiale e' un caso specifico del metodo dell'interpolazione che utilizza come
funzioni $\varphi_i$ dei polinomi. Questo metodo si appoggia direttamente sui risultati del seguente
teorema: 

>***Teorema (Weierstrass)**
>Sia $f \in C[a,b]$. Per ogni $\varepsilon > 0$ esiste un intero $n$ e un 
>polinomio $P_n$ di grado $n$ tale che*
>$$
>\left \|  f-P_n  \right \|_{\infty} < \varepsilon
>$$
>(*o alternativamente*)
>$$
>\abs{f(x) - P_n(x)} < \varepsilon
>$$

Esso afferma che tramite un polinomio qualsiasi e' possibile approssimare *bene quanto si vuole* una
funzione continua.

>***Teorema**: Il polinomio interpolante esiste ed e' unico se e solo se $x_i \neq x_j$ per $i
\neq j$.*

**Dimostrazione**: Sia $P_n = \sum^n_{k=0} a_k x^k$ un polinomio qualsiasi. Applicando la condizione
di interpolazione si ottiene che $P_n(x_i) = y_i$ con $i=0,...,n$, da cui si ottiene il sistema
lineare 
$$
\sum^n_{k=0} a_k x_i^k = y_i \text{ con } i=0,1,..,n
$$
Questo sistema puo' essere visto in forma matriciale ($Va = y$) come: 

$$
\begin{pmatrix}
 1   & x_0 & x_0^2 & ... & x_0^n \\ 
 1   & x_1 & x_1^2 & ... & x_1^n \\ 
 ... & ... &  ...  & ... & ... \\
 1   & x_n & x_n^2 & ... & x_n^n      
\end{pmatrix}
\begin{pmatrix}
a_0 \\ 
a_1 \\
...\\ 
a_n
\end{pmatrix}
=
\begin{pmatrix}
y_0 \\ 
y_1 \\
... \\ 
y_n
\end{pmatrix}
$$

Dove la matrice **V** dei termini $x_n^k$ e' detta matrice di *Vandermonde*. 
Il sistema ammette una e una sola soluzione se e solo se la matrice dei coeffiecienti ha
determinante diverso da 0. Tale determinante e' facilmente calcolabile e risulta essere 
$$
det(V) = \prod_{i,j=0_{i>j}}^{n} (x_i - x_j).
$$
Per concludere, si ha che il polinomio esiste ed e' unico se e solo se $det(V) \neq 0$.

Questo risultato e' utile soprattutto per stabilire l'esistenza e unicita' del polinomio
interpolante siccome il determinante di $V$ e' facilmente calcolabile.
Per determinare i polinomi pero', si preferisce evitare di risolvere direttamente il sistema lineare
descritto per una serie di ragioni: 
* La matrice *V* e' malcondizionata se alcuni nodi sono vicini
* Esistono algoritmi con un costo computazionale minore
* La rappresentazione canonica dei polinomi e' instabile, poiche' piccole perturbazioni nei
  coefficienti $a_k$ possono produrre grandi variazioni sui valori di $p_n(x)$

### Interpolazione Lagrangiana 
Un approccio possibile per evitare di calcolare direttamente il sistema lineare descritto in
Gprecedenza e' quello di utilizzare i cosiddetti *polinomi interpolanti di Lagrange*, definiti come: 
$$
p_n(x) = \sum^{n}_{j=0} y_j L_j (x)
$$
Dove $L_j$ sono i *polinomi caratteristici di Lagrange*
$$
L_j(x) = \frac{(x-x_0)(x-x_1) \cdots (x-x_{k-1})(x-x_{k+1}) \cdots (x-x_k)}
{(x_k-x_0)(x_k-x1) \cdots (x_K-x_{k-1})(x_k-x_{k+1}) \cdots (x_k-x_k)}
= \prod^{n}_{k=0, k \neq j} \frac{x-x_k}{x_j-x_k}
$$

Per valori di $x \neq x_i$ (poiche' si ha che $f(x_i) = P_n(x_i)$) si puo' valutare l'errore
$$
E_n(x) = f(x) - p_n(x) 
$$

Questo errore $E$ e' anche esprimibile nella forma di resto di Lagrange come: 
$$
E_n(x) = \frac{f^{n+1}(\xi_x)}{(n+1)!} \omega_n(x)
$$
dove $\omega_n(x)=(x-x_0)(x-x_1)...(x-x_n)$ ($\omega$ viene chiamato *polinomio modale*)

Possiamo quindi scrivere che il polinomio $P_n$ approssima $f$ con un certo errore $E$
$$
f(x) = P_n(x) + E_n(x)
$$
In cui: 

* Se $f(x) \in P_n(x) \rightarrow f^{(n+1)} (x) = 0 \forall x \rightarrow E_n(x) = 0$
* Se $f(x) = 1$ si ha un polinomio di grado $0$ per cui $E_n(x) = 0$
* $\abs{E_n(x)} \leq \frac{(b-a)^{n+1}}{(n+1)!} \max_{x \in [a,b]} \abs{f^{(n+1)} (x)}$

Seguono ora alcune osservazioni che in merito all'errore:

* Il valore assoluto del numeratore $\abs{f^{(n+1)}(\xi_x)}$ puo' essere maggiorato con una
  costante.  Cio' significa che il rapporto puo' essere reso piccolo a piacere se $n$ e'
  sufficientemente grande.
* Il secondo fattore $\omega_n(x)$ e' un polinomio di grado $n+1$ che dipende dalla posizione dei
  punti (o nodi) $\{ x_i \}$, cio' significa che la scelta delle ascisse dei punti di interpolazione
  influenza l'andamento dell'errore. Se si scelgono nodi equispaziati si ottengono delle
  oscillazioni sempre piu' grandi al crescere di $n$.

>**Nota:** L'errore di interpolazione non necessariamente tende a zero quando $n$ tende a infinito.

Cio' implica che il polinomio interpolante non sempre e' una buona approssimazione per una funzione
continua. Questo fenomeno e' chiarito dal **teorema di Faber**

>***Teorema (Faber)**: Per ogni distribuzione dei nodi esiste almeno una funzione $f \in [a,b]$ tale
>l'errore di interpolazione $\norm{E_n (f)}_{\infty}$ non converga a zero per* $n \rightarrow \infty$ 

Anche se, pero', vale anche il seguente teorema

>***Teorema**: Per ogni funzione continua esiste almeno una distribuzione dei nodi tale che l'errore
>di interpolazione converga a zero per* $n \rightarrow \infty$ 

Abbiamo quindi che la distribuzione di nodi influenza direttamente l'errore di interpolazione.  La
convergenza a zero dell'errore e' assicurata solo se la funzione da interpolare e' derivabile e se i
nodi sono scelti secondo una regola particolare. Questo risultato e' garantito dal seguente 

>***Teorema (Bernstein)**: Se $f \in C^1[a, b]$ e se le ascisse di interpolazione $\{ x_i
\}^{n}_{i=0}$ sono gli zeri del polinomio di Chebychev di grado $n+1$ alllora l'errore di
interpolazione tende a zero per* $n \rightarrow \infty$

Un polinomio di Chebychev di grado $n+1$ in $[-1;1]$ puo' essere definito in molteplici modi, ma in
questo ambito la definizione piu' conveniente e' la seguente 
$$
T_{n+1} = cos((n+1) \theta) = 0 \text{ con } x=cos(\theta) \text{ e } \theta \in [0, \pi] 
$$
Questa rappresentazione del polinomio rende particolarmente agevole calcolarne i suoi zeri,
infatti se imponiamo che $T_{n+1} = 0$ si ottiene:
$$
T_{n+1}(x) = 0 \rightarrow cos((n+1) \theta) = 0 \rightarrow x_k = cos(\frac{2k+1}{2n+2} \pi), \text{  }
k= \{ 0,1,..n\}
$$
oppure tramite la formula di ricorrenza 
$$
T_{n+1}(x)=2x T_n(x) - T_{n-1}(x)
$$
Le cui soluzioni sono i cosiddetti **nodi di Chebychev**. 
E' necessario pero' espandere l'intervallo da $[-1, 1]$ in cui e' definito il polinomio di Chebychev
ad un generico intervallo in cui e' definito il polinomio interpolante $[a, b]$. Per far cio' e'
sufficiente appplicare la seguente trasformazione
$$
t_k = \frac{b-a}{2} x_k + \frac{a + b}{2}.
$$

## Le costanti di Lebesgue
Il teorema di Weiestrass ci dice che una funzione continua in un intervallo puo' essere approssimata
bene quanto si vuole mediante un polinomio di grado sufficientemente elevato. Possiamo dimostrare
che esiste un polinomio $p_{n}^{*}$ detto **migliore approssimazione uniforme** che minimizza
l'errore. Tale polinomio ha l'ulteriore caratteristica di interpolare la funzione su $n+1$ punti
distinti le cui ascisse non sono note a priori.   
Come abbiamo visto in precedenza, la distribuzione di nodi determina direttamente la convergenza
dell'errore di interpolazione. Spesso tale distribuzione viene definita mediante una **matrice di
interpolazione**, definita come la matrice triangolare inferiore infinita
$$
X = 
\begin{bmatrix}
x^{(0)}_0 &  &  & \\ 
x^{(1)}_0 & x^{(1)}_1 &  & \\ 
x^{(2)}_0 & x^{(2)}_1 & x^{(2)}_2 & \\ 
\vdots & \vdots & \vdots  & \ddots 
\end{bmatrix}
$$

In cui la n-esima riga contiene gli $n+1$ nodi da utilizzare per costruire il polinomio interpolante
di grado $n$. 
Per capire meglio in che modo la matrice di interpolazione influenza l'errore di interpolazione
diamo la seguente definizione (e teorema)

>***Definizione**: Sia $P_n$ l'operatore lineare che a ciascuna funzione $f$ associa il polinomio
>$P_n f$ che la interpola sui nodi assegnati e sia*
>$$
E_n(f,X) = \left || f - P_nf \right ||_{\infty}
>$$
>*il corrispondente errore di interpolazione.*

>***Teorema**: Sia $f \in C[a,b]$ e sia $X$ una matrice di interpolazione. Allora*
>$$ E_n(f, X) \leq (1 + \Lambda_n (X)) E^{*}_n(f), $$
>*dove*
>$$ \Lambda_n (X) = \left || \lambda_n(x) \right ||_{\infty} $$
>*sono le **costanti di Lebesgue** e* 
>$$ \lambda_n (x) = \sum^{n}_{j=0} \left | L_{n}^{(n)} (x) \right |$$
>*sono le **funzioni di Lebesgue** e*
>$L_j^{(n)}(x)$ sono i polinomi caratteristici di Lagrange di grado $n$ costruiti sui nodi
>assegnati.

Questo teorema ci da quindi una stima di quanto e' buona l'approssimazione di un polinomio
interpolante (di grado $n$ fissato) comparando tale polinomio con il polinomio di migliore
approssimazione.  

E' stato dimostrato che con la scelta della matrice di interpolazione $T$ costruita con i nodi di
Chebichev si ha che $\Lambda_n(T) < \frac{2}{\pi} logn$, cio' significa che la crescita e' quasi
ottimale, cioe' che le costanti di Lebesgue associate alla matrice hanno crescita al piu'
logaritmica.  
Al contrario, le costanti di Lebesgue per matrici costruite con nodi equispaziati crescono in modo
esponenziale, e rappresentano quindi la peggiore scelta di nodi per l'interpolazione.

Le **costanti di Lebesgue** sono importanti inoltre nello studio della stabilita' della valutazione del 
polinomio di interpolazione poiche' rappresentano il coeffieciente di amplificazione dell'errore
numerico di interpolazione. 
Cio' significa che, per matrici di interpolazione per le quali le costanti di Lebesgue hano un
andamento fortemente crescente, l'errore totale del polinomio di Lagrange diverge.
$$
\norm{p_n - \tilde{p}_n(x)}_{\infty} \leq \Lambda_n (X) \cdot \max_j \abs{\varepsilon_j}
$$
In conclusione, $\Lambda_n$ gioca il ruolo del numero di condizionamento per il problema
dell'interpolazione. 

## Polinomio interpolante di Newton
Supponiamo di disporre gia' del polinomio interpolante $p_{n-1}(x)$ che interpola i punti di ascissa
$\{ x_0, \dots, x_{n-1} \}$ e di voler aggiungere ai precedenti un punto di interpolazione 
$(x_i, y_i)$. Per sfruttare il polinomio di cui si dispone, vogliamo cercare di esprimere il
polinomio $p_n(x)$ che interpola tutti i punti piu' il punto che si vuole aggiungere
$$
p_n (x) = p_{n-1} (x) + g_n (x)
$$
per una opportuna funzione $g_n(x)$. Tale funzione ($g$) deve essere necessariamente un polinomio di
grado $n$. Inoltre vogliamo che interpoli gli stessi punti interpolati da $p_{n-1}$. In altri
termini, questa funzione avra' forma
$$
g_n(x) = a_n \cdot \omega_{n-1} (x) = a_n \prod^{n-1}_{i=0}(x-x_i)
$$
per determinare il coefficiente $a_n$ imponiamo che $p_n$ interpoli anche l'ultimo punto $(x_n,
y_n)$, ottenendo
$$
a_n = \frac{y_n - p_{n-1}}{\omega_{n-1}(x_n)}
$$
Verrebbe da pensare quindi che sia possibile costruire un polinomio interpolante $p_n$ qualsiasi
utilizzando tale procedimento ponendo come polinomio di partenza $o_0(x) = y_0$. Esiste pero' un
algoritmo piu' stabile e con minore complessita'.  
Osserviamo che $a_n$ e' il coefficiente del polinomio con il grado massimo. Possiamo rappresentare
il coefficiente di grado massimo di un polinomio che interpola la funzione $f(x)$ e i punti di
ascisse $x_0, \dots, x_n$ col simbolo
$$
a_n = f[x_0, \dots, x_n]
$$
Tale simbolo denota usualmente le cosiddette **differenze divise** di ordine $n+1$ che si calcolano
mediante la seguente relazione
$$
f[x_0, \dots, x_n] = \frac{f[x_1, \dots, x_n] - f[x_0, \dots, x_n]}{x_n -  x_0}
$$
Tramite le differenze divise di puo' quindi ottenere il polinomio interpolante di Newton
$$
f(x) = P_n(x) + E_n(x)
$$
con
$$
\begin{aligned}
P_n (x) &=  f(x_0) + (x-x_0)f[x_0,x_1] + \dots \\
       & + (x - x_0) \dots (x-x_{n-1}) f[x_0, x_1, \dots, x_n]
\end{aligned}
$$
$$
E_n (x) = (x - x_0)(x - x_1) \dots (x - x_n) f[x, x_0, x_1, \dots, x_n] 
$$

Si e' ottenuta quindi una rappresentazione alternativa del polinomio di Lagrange ma con costo
computazionale minore poiche' richiede solamente $\frac{n}{2}$ divisioni e $n^2$ sottrazioni. 
Inoltre se si volesse aggiungere un punto, il metodo non richiederebbe di calcolare tutti i polinomi
caratteristici come nel metodo di Lagrange. 

#### Approssimazione ai minimi quadrati
Spesso quando si vuole approssimare una funzione non si hanno dei valori necessariamente distinti, inoltre
i dati racconti possono avere dell'errore introdotto. In casi di questo tipo non e' conveniente
ricorrere all'interpolazione, dal momento che e' nota una forte presenza di errori sui dati.   
L'idea e' quella di trovare per tale insieme di punti, una funzione che sia un'approssimazione del fenomeno 
rappresentato dai punti $\{ (x_i,y_i) \} i=0,...,m$ dove $m$ e' il numero di punti.
Questa funzione come detto in precedenza puo' essere rappresentata come una combinazione lineare di funzioni
$\phi_k(x), k=0,...,m$  
Per esempio, e' stato visto che nel caso polinomiale $\phi_k(x)=x^k$ l'approssimazione risultante e' un 
polinomio di grado $n$: $p_n(x) = c_0 + c_1 x + c_2 x^2 + ... + c_n x^n$  
Si vuole pero' considerare il caso piu' generale ed usare quindi $\{ \phi_k(x) \}_{k=0,..,n}$ per trovare 
quindi una funzione della forma: 
$$
f_n (x) = c_0 \varphi_0(x) + c_1 \varphi_1(x) + ... + c_n \varphi_n(x) = \sum^n_{k=0} c_k \varphi_k(x)
$$
con $f_n(x)$ individuato con il criterio dei minimi quadrati, cioe' tutti i $c_k$ tali che: 
$$
\varepsilon_2 = \sum^{m}_{i=0} [ y_i - \sum^{n}_{k=0} c_k \phi_k(x_i) ]^2 = 
\sum^{m}_{i=0} [ y_i - f_n(x_i) ]^2 
$$
Per scegliere a quale tipo di famiglia di funzioni appartiene $\phi_k(x)$ si deve vedere se il fenomeno 
individuato e' un modello esponenziale, periodico o altro. 
Ci limiteremo a considerare il caso polinomiale $\phi_k(x) = x^k$, piu' formalmente, si vuole trovare 
la combinazione lineare $\sum^{n}_{k=0} c_k x_i^k$ tale che
$$
\varepsilon_2 = \sum^{m}_{i=0} [ y_i - \sum^{n}_{k=0} c_k x_i^k ]^2
$$
sia minimo. 
Siccome $\varepsilon_2$ varia al variare dei coefficienti $c_k$, possiamo considerarla come in funzione di tali
coefficienti, quindi si puo' dire che $\varepsilon_2 (c_0, c_1, ...,c_n)$. 
Per trovare il punto di minimo si puo' pensare di derivare $\varepsilon_2$ e porla $=0$ ottenendo quindi il 
seguente sistema lineare:
$$
\sum^m_{i=0} \sum^n_{j=0} c_j x_i^{j+k} = \sum^m_{i=0} y_i x_i^k \text{   con } k=0,...,n
$$
Ne risulta quindi un sistema di $(n+1)$ equazioni in $(n+1)$ incognite: 
$$
\begin{pmatrix}
\sum^m_{i=0} 1     & \sum^m_{i=0} x_i   & \sum^m_{i=0} x_i^2 & ... & \sum^m_{i=0} x_i^n     \\
\sum^m_{i=0} x_i   & \sum^m_{i=0} x_i^2 & \sum^m_{i=0} x_i^3 & ... & \sum^m_{i=0} x_i^{n+1} \\
\vdots             & \vdots             & \vdots             & \vdots & \vdots              \\
\sum^m_{i=0} x_i^n & \sum^m_{i=0} x_i^{n+1} & \sum^m_{i=0} x_i^3 & ... & \sum^m_{i=0} x_i^{2n} \\
\end{pmatrix}
\begin{pmatrix}
c_0 \\
c_1 \\
\vdots \\
c_n
\end{pmatrix}
=
\begin{pmatrix}
\sum^m_{i=0} y_i \\ 
\sum^m_{i=0} y_i x_i \\ 
\vdots    \\
\sum^m_{i=0} y_i x_i^n \\ 
\end{pmatrix}
$$
Quando $n=1$ si dice che il sistema e' una retta ai minimi quadrati oppure retta di regressione. 

**Esempio**: Calcolare la retta ai minimi quadrati relativa a 

+------:+:--:+:-:+:-:+:-:+:-:+:-:+:-:+
| $x_i$ | -1 | 0 | 1 | 2 | 3 | 4 | 5 |
+-------+----+---+---+---+---+---+---+
| $y_i$ | 10 | 9 | 7 | 5 | 4 | 3 | 0 |
+-------+----+---+---+---+---+---+---+

Abbiamo che $m=7$, per cui bisogna risolvere il sistema lineare 
$$
\begin{pmatrix}
\sum^m_{i=0} 1   & \sum^m_{i=0} x_i   \\ 
\sum^m_{i=0} x_i & \sum^m_{i=0} x_i^2 \\
\end{pmatrix}
\begin{pmatrix}
c_0 \\
c_1 
\end{pmatrix}
= 
\begin{pmatrix}
\sum^m_{i=0} y_i \\
\sum^m_{i=0} y_i x_i 
\end{pmatrix}
$$
Il che, con i dati forniti dal problema equivale a risolvere:
$$
\begin{pmatrix}
7  & 20 \\ 
20 & 92 
\end{pmatrix}
\begin{pmatrix}
c_0 \\
c_1 
\end{pmatrix}
= 
\begin{pmatrix}
37 \\
25 
\end{pmatrix}
$$
Il che risulta che $c_0=8.6429$ e $c_1=-1.6071$. In conclusione la retta di regressione risultate sara'
$$
p_1(x) = c_0 + c_1 x \rightarrow -1.6071x + 8.6429
$$

## Esercizi

TODO: Presenti sul file **Esercizi.pdf** nella quarta settimana sulla pagina moodle del corso.
Altri esercizi sono anche sul file della lezione in pdf sempre. 
(Hint: Per vedere come svolgerli guardare la lezione di teoria della stessa settimana) 


