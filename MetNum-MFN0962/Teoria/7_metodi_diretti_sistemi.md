\newpage
# Metodi diretti per la soluzione di sistemi lineari
Un sistema lineare a $m$ equazioni e $n$ incognite e' un insieme di equazioni che devono essere
soddisfatte simultaneamente. Una sua soluzione e' una $n$-upla (tanti elementi quante le incognite)
che contiene i numeri reali $\{k_1, \dots, k_n \}$ tali che soddisfino le equazioni se sostituiti al
posto delle incognite.

I sistemi lineari si incontrano molto spesso nella matematica e presentano i seguenti vantaggi:

* E' sempre possibile stabilire a priori se ammettano soluzioni
* In caso ammettano soluzioni e' possibile calcolarle utilizzando un metodo *algebrico* o *numerico*
* Le soluzioni dipendono *esplicitamente dai dati* del problema (coefficienti e termini noti)

Un sistema lineare si presta bene ad essere rappresentato anche in forma matriciale nel modo
seguente
$$
Ax = b
$$
Dove $A$ e' la matrice dei coefficienti, $x$ e' il vettore colonna delle incognite e $b$ e' il
vettore colonna dei termini noti.
Quando il vettore $b$ e' il vettore nullo $0$, si dice che il sistema $Ax = 0$ e' ***omogeneo***.
Tali sistemi hanno la particolare caratteristica di avere sempre una soluzione detta *banale* che e'
$x = 0$ (vettore con tutte le componenti nulle). I sistemi omogenei possono avere anche altre
soluzioni non banali, ma l'esistenza della soluzione nulla e' garantita.

Possiamo anche vedere le soluzioni di un sistema lineare da un punto di vista geometrico

>***Teorema**: L'insieme delle soluzioni di un sistema omogeneo $Ax=0$ e' un sottospazio vettoriale
>$W \subseteq \mathbb{R}^n$, di dimensione $dim(W)=n-r$ in cui $r=rank(A)$.*

L'interpretazione geometrica di un sistema lineare equivale quindi a trovare un vettore $x$ tale che
dopo aver applicato la trasformazione $A$ allo spazio diventa uguale a $b$.  Questa relazione deriva
dal fatto che il rango di una matrice indica la dimensione del piano dopo aver applicato la
trasformazione lineare. (es r=1, allora e' una linea. r=2, e' un piano ecc.). Se abbiamo che $dim(W)
= 0$ (perche' la trasformazione non altera il piano in modo significativo riducendone le dimensioni,
per cui $rank(A) = n$) abbiamo un solo vettore soluzione, il che e' il caso migliore.

Nella soluzione di sistemi lineari, e' spesso utile poter valutare se tale sistema ammetta o non
ammetta soluzioni a priori, prima ancora di effettuare i calcoli effettivi per la risoluzione. 
In generale e' possibile mediante il seguente teorema

>***Teorema (Ruche'-Capelli)**: Il sistema*
>$$Ax=b$$
>*dove $A$ e' una matrice di tipo $m \times n$, $x \in \mathbb{R}^n$ e $b \in \mathbb{R}^m$, ammette
>soluzioni se e solo se*
>$$rg(A) = rg(A \; | \; b)$$
>*dove $[A|b] = [a_1 \; a_2 \dots a_n \; b]$ con $a_i$ colonna $i$-esima di $A$*

Secondo il seguente teorema si possono presentare quindi 3 casi possibili:

* $rank(A) = rank(A  \; | \; b) = n$ *(soluzione unica)* 
* $rank(A) = rank(A  \; | \; b) = r < n$ *(infinite soluzioni, sottospazio $\infty^{n-r}$)* 
* $rank(A) = rank(A  \; | \; b) \neq n$ *(nessuna soluzione)*

Nei casi dei sistemi omogenei solo la prima o la seconda possono verificarsi. La soluzione unica e'
sempre la soluzione banale $x=0$.

Come detto in precedenza, in presenza di un sistema lineare che ammette soluzioni, e' sempre
possibile calcolare la soluzione mediante un opportuno metodo. I metodi numerici per la soluzione di
sistemi lineari si suddividono in due categorie principali

* Metodi diretti: In assenza di errori di arrotondamento la soluzione viene calcolata in un numero
  finito di passi.
* Metodi iterativi: Attraverso un processo iterativo viene generata una successione infinita di
  vettori che sotto opportune condizioni di convergenza convergono alla soluzione cercata.

La scelta di un algoritmo che si basa su un metodo oppure sull'altro avviene sotto opportuni criteri
considerando diversi fattori quali stabilita', complessita' spaziale e computazionale.  Tipicamente
la scelta viene fatta in funzione delle caratteristiche della matrice dei coefficienti $A$. Ad
esempio, se $A$ e' una matrice *densa*, un algoritmo che sfrutta un metodo diretto potrebbe essere
piu' efficiente. Al contrario, in caso $A$ fosse *sparsa*, un metodo diretto potrebbe riempire gli
elementi nulli della matrice causando il cosiddetto *"fill-in"*, con un conseguente saturamento
della memoria. In questi casi e' spesso utile se non indispensabile impiegare metodi iterativi, che
al contrario lasciano inalterata la matrice dei coefficienti.

Prima di introdurre i metodi numerici sono necessarie alcune definizioni fondamentali.
In primo luogo definiamo l'errore assoluto e relativo per i vettori.

>***Definizione (Errore assoluto):** Dato un vettore $x$ non **nullo**, ed un suo vettore*
>*approssimante $\tilde{x}$, si dice che $\tilde{x}$ approssima $x$ con $n$ cifre decimali corrette se*
>$$
|| x - \tilde{x} ||_{\infty} \leq \frac{1}{2} \cdot 10^{-n}
>$$

>***Definizione (Errore relativo):** Dato un vettore $x$ non **nullo**, ed un suo vettore*
>*approssimante $\tilde{x}$, si dice che $\tilde{x}$ approssima $x$ con $p$ cifre globali*
>*significative corrette se*
>$$
\frac{|| x - \tilde{x} ||_{\infty}}{|| x ||_{\infty}} \leq \frac{1}{2} \cdot 10^{-p+1}
>$$

### Condizionamento del problema
Oltre che allo studio dell'errore e' fondamentale anche lo studio del condizionamento dei sistemi
lineari. In altre parole ci si chiede come un sistema lineare "risponda" ad eventuali perturbazioni
nei dati in ingresso (nel caso dei sistemi lineari nei coefficienti e nei termini noti). 
Supponiamo di avere il sistema lineare $Ax = b$. Per semplicita' ci limitiamo a considerare solo il
caso in cui ci sia una perturbazione $\delta b \in \mathbb{R}^n$ sul vettore dei termini noti $b$.
La soluzione del sistema $Ax=(b + \delta b)$ sara' perturbata anch'essa, per cui
$$
A (x + \delta x) = (b + \delta b)
$$
Di conseguenza, per ottenere $\delta x$, sfruttiamo il fatto che $Ax = b$
$$
Ax + A \delta x = b + \delta b \; \rightarrow  \; A \delta x = \delta b \; \rightarrow \;\delta x = A^{-1} \delta b
$$
e, usando $||b||=||Ax|| \leq ||A|| \; ||x||$ per la compatibilita' della norma si ottiene
$$
\frac{|| \delta x ||}{|| x ||} \leq ||A|| \; ||A^{-1}|| \frac{|| \delta b ||}{|| b ||}
$$

Notiamo per ora come il fattore $||A|| \; ||A^{-1}||$ sia determinante nel condizionamento del
sistema perturbato, poiche' amplifica l'errore relativo commesso sul termine noto rispetto
all'errore relativo nel calcolo della soluzione. 

Prendiamo ora per esempio il caso in cui sia inserita una perturbazione $\delta A \in
M_{n,n}(\mathbb{R})$ sulla matrice dei coefficienti $A$, sempre con i termini noti $b$ perturbati.
Secondo le ipotesi si ottiene quindi il seguente sistema perturbato
$$
(A + \delta A)(x + \delta x) = (b + \delta b)
$$
Se supponiamo che $(A + \delta A)$ e' non singolare e che $||A^{-1}|| \; ||\delta A|| < \frac{1}{2}$
si ottiene la seguente maggiorazione dell'errore relativo
$$
\frac{|| \delta x ||}{|| x ||} \leq 2||A|| \; ||A^{-1}|| (\frac{|| \delta A ||}{|| A ||} + \frac{|| \delta b ||}{|| b ||}) 
$$

Anche qui compare la quantita' $||A|| \; ||A^{-1}||$, detta ***indice o numero di condizionamento***
di $A$
$$
\kappa(A) = ||A|| \; ||A^{-1}||
$$
E' importante notare come la norma non sia specificata e come tale numero cambi proprio in base alla
norma con cui viene valutata.








