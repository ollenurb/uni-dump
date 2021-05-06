\newpage
# Metodi per la soluzione di sistemi lineari
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
Avendo trovato come le due perturbazioni sui termini noti $b$ e sulla matrice di coefficienti $A$
influenzano le soluzioni, possiamo quindi dare la definizione del seguente teorema

>***Teorema**: Siano $\delta A$ e $\delta b$, rispettivamente, le perturbazioni della matrice dei
>coefficienti e dei termini noti di un sistema lineare $Ax = b$, e sia*
>$$ 
>(A+\delta A)(x + \delta x) = (b + \delta b)
>$$
>*il sistema perturbato risultante, se $|| \delta A|| \; || A^{-1} || < 1$, allora l'errore 
>relativo della soluzione del sistema soddisfa la disuguaglianza seguente*
>$$
\frac{|| \delta x ||}{|| x ||} \leq \frac{\kappa(A)}{1 - \kappa(A) \frac{||\delta A||}{||A||}} (\frac{|| \delta A ||}{|| A ||} + \frac{|| \delta b ||}{|| b ||}) 
>$$
>*dove $\kappa(A) = ||A|| \; ||A^{-1}||$ e' l'indice di condizionamento di $A$.*

Da cui segue anche il seguente corollario

>***Corollario**: Sotto le ipotesi del teorema precedente, se $||\delta A|| \; ||A^{-1}|| <
>\frac{1}{2}$, allora la stima dell'errore relativo della soluzione sara'*
>$$
\frac{|| \delta x ||}{|| x ||} \leq 2\kappa(A) (\frac{|| \delta A ||}{|| A ||} + \frac{|| \delta b ||}{|| b ||}) 
>$$

Dalla stima del corollario precedente e' possibile inoltre ricavare quante cifre sono da ritenersi
corrette. Sia $\varepsilon$ l'epsilon di macchina si ha
$$
\frac{|| \delta x ||}{|| x ||} \leq 4\kappa(A) \varepsilon \leq \frac{1}{2} 10^{-p+1}
$$
per cui $p$ cifre significative sono da ritenersi corrette nella soluzione perturbata.

## Metodi diretti
Dopo aver introdotto alcune nozioni sull'errore e il condizionamento dei sistemi lineari, possiamo
passare ad introdurre i metodi per la soluzione dei sistemi lineari, in particolare quelli diretti.
Consideriamo inizialmente alcuni casi di sistemi lineari detti "*facili*" perche' di quasi immediata
soluzione.
Come detto in precedenza, un sistema lineare $Ax=b$ ammette soluzioni se e solo se $A$ e' non
singolare (invertibile) e tale soluzione e' data dalla relazione seguente
$$
x = A^{-1} \cdot b
$$
Se sotto le ipotesi precedenti un sistema ha matrice dei coefficienti diagonale $D$, il sistema
avra' un'unica soluzione
$$
x_i = \frac{b_i}{d_i}, \qquad i=1,\dots,n
$$
Questo caso rappresenta il caso piu' semplice possibile in quanto il costo computazionale e' di $n$
divisioni ($O(n)$), e' ben posto se la matrice e' non singolare ed e' stabile dal momento che ogni
divisione e' indipendente l'una dall'altra.
Ricordiamo che *ben posto* significa che un problema possiede in un prefissato campo di definizione
una e una sola soluzione e che questa *dipende con continuita' dai dati*.

Consideriamo ora un altro caso relativamente semplice, ipotizzando che la matrice dei coefficienti
$Q$ sia ortogonale ($Q^TQ = QQ^T = I$ la trasposta coincide con l'inversa). Poiche' e' certo che $Q$
sia sia invertibile, la soluzione del sistema sara' data da
$$
x = Q^T \cdot b \; \rightarrow \; x_i=\sum^n_{j=1} q_{ji} b_j, \quad i = 0, \dots, n
$$
Questa volta il costo computazionale coincide con il costo della moltiplicazione di matrici che e'
$O(n^2)$ operazioni. Anche in questo caso l'algoritmo e' ben posto e stabile. 

Passiamo ora a considerare al caso in cui la matrice dei coefficienti e' triangolare. Definiamo le
matrici $L$ e $U$ rispettivamente la matrice triangolare inferiore e superiore.
Per la proprieta' delle matrici triangolari sappiamo che i sistemi con matrici triangolari come
matrice dei coefficienti ammettono soluzione unica se e solo se il prodotto di tutti gli elementi
sulla diagonale principale non e' nullo. 
In generale i metodi per la risoluzione di sistemi triangolari si basano sul concetto di
sostituzione. Prendiamo per esempio un sistema triangolare inferiore $Lx=b$ (il concetto viene esteso
anche al caso di sistemi triangolari superiori), allora possiamo scrivere lo stesso in forma
esplicita come:
$$
\begin{cases}
    l_{1,1} x_1 & =  b_1 \\
    l_{2,1} x_1 + l_{2,2} x_2 & = b_2 \\
    l_{3,1} x_1 + l_{2,2} x_2 + l_{3,3} x_3 & = b_3 \\
    \qquad \vdots & \quad \vdots \\
    l_{3,1} x_1 + l_{2,2} x_2 + l_{3,3} x_3 + \cdots + l_{n,n} x_n & = b_n \\
\end{cases}   
$$
E' evidente dalla forma esplicita come sia possibile ricavare immediatamente la prima incognita
$x_1$ dalla prima equazione, per poi generare cosi' un *"effetto a cascata"* sostituendo il valore
di $x_1$ in tutte le altre equazioni e ripetendo il procedimento nella riga successiva. Cio' che e'
appena stato descritto e' in effetti il ***metodo della sostituzione in avanti*** o ***forward
substitution***.
Posto che $x_1 = \frac{b_1}{l_{1,1}}$, allora possiamo calcolare il generico $x_i$ come
$$
x_i = \frac{b_i - \sum^{i-1}_{k=1} l_{i,k} x_k}{l_{i,i}}, \quad i=2, \dots, n
$$
Siccome abbiamo posto che la matrice non sia singolare e quindi non ci siano elementi nulli sulla
diagonale principale, il termine $l_{i,i}$ non causa problemi di stabilita'.

L'algoritmo puo' essere riassunto nei passi seguenti in codice Matlab:
```{.matlab .numberLines}
x1 = b1/L(1 1);
for i=2:n
    x(i) = b(i);
    for k=1:i-1
        x(i) = x(i) - L(i k) * x(k);
    end
    x(i) = x(i) / L(i i);
end
```
Valutando l'algoritmo si ottiene che la sua complessita' e di 
$$
O(\sum^n_{i=1} i) = O(\frac{n(n+1)}{2}) = O(\frac{n^2}{2})
$$

Come gia' detto possiamo applicare lo stesso procedimento al contrario, ottenendo il cosiddetto
***metodo della sostituzione in indietro*** o ***backward substitution***.
Anche l'algoritmo di backward substitution gode delle stesse caratteristiche della sua controparte
quali stabilita' e costo computazionale.
In generale, dato $x_n = \frac{b_n}{l_{n,n}}$ allora la generica componente $x_i$ del vettore delle
soluzioni puo' essere calcolata mediante sostituzione in indietro per mezzo della seguente relazione
$$
x_i = \frac{b_i - \sum^{n}_{k=i+1} u_{i,k} x_k}{u_{i,i}}, \quad i=(n-2),(n-3), \dots, 1
$$

## Metodo di Gauss
I metodi di risoluzione fin'ora introdotti si limitano ad alcuni casi limite e molto particolari.
Introduciamo ora alcuni metodi per la risoluzione di sistemi lineari di forma generica, con la
matrice dei coefficienti senza nessuna forma particolare. 
Il metodo di Gauss e' un metodo che consiste nell'eliminare progressivamente le incognite da fissate
equazioni. Tale metodo funziona sempre, sia se il sistema non ammette una sola soluzione sia nel
caso ne ammetta infinite. Nel secondo caso l'algoritmo termina segnalandolo. L'idea alla base del
metodo e' quella di ottenere mediante un numero finito di passi una matrice dei coefficienti
triangolare. Dopo aver triangolarizzato la matrice e' poi possibile utilizzare uno dei metodi di
sostituzione descritti in precedenza.

Assumiamo di avere un sistema lineare $Ax=b$, e assumiamo anche che la prima entrata $a_{1,1}$ di
$A$ sia diversa da zero ($a_{1,1} \neq 0$).
Possiamo quindi eliminare la prima incognita $x_1$ dalla $2^{a}, 3^{a}, \dots,$ *n-esima* equazione,
sottraendo dall'*i-esima* equazione ($i=2, \dots, n$) la prima equazione moltiplicata per 
$$
m_{i,1} = \frac{a_{i,1}}{a_{1,1}}, \quad i=2, \dots, n
$$
Cio' che si ottiene e' un sistema equivalente, con la prima equazione inalterata ma con tutti i
coefficienti di $x_1$ uguali a 0 in tutte le equazioni successive. Piu' precisamente, il sistema
lineare equivalente (il cui passo dell'algoritmo e' specificato ad apice, se non specificato e'
passo 1) sara'
$$
\begin{cases}
    a_{i,j}^{(2)} = a_{i,j} - m_{i,1} a_{1,j} \\
    \qquad \qquad \qquad \qquad\qquad i,j=2, \dots, n\\
    b_{i}^{(2)} = b_{i} - m_{i,1} b_{1} \\
\end{cases}
$$

Il metodo viene poi reiterato prendendo $a^{(2)}_{2,2}$ come elemento per l'eliminazione, ottenendo
quindi un sistema in cui le due prime equazioni sono inalterate, ma con i coefficienti di $x_1$ e
$x_2$ uguali a zero. Per cui il sistema risultante sara':
$$
\begin{cases}
    a_{i,j}^{(3)} = a^{(2)}_{i,j} - m_{i,2} a_{2,j}^{(2)} \\
    \qquad \qquad \qquad \qquad\qquad i,j=3, \dots, n\\
    b^{(3)}_{i} = b^{(2)}_{i} - m_{i,2} b^{(2)}_{2} \\
\end{cases}
$$
E' chiaro fin da subito che il metodo possa essere reiterato per il passo *k-esimo*, ottenendo alla
fine un sistema con matrice dei coefficienti triangolare superiore.
Per il caso generale, possiamo riassumere il metodo con un insieme di relazioni. Posto che
$$
a_{i,j} = a^{(1)}_{i,j}, \quad b_{i} = b^{(1)}_{i}, \quad i,j = 1, \dots, n
$$
allora e' possibile calcolare il sistema al passo $k+1$ mediante le seguenti equazioni:
$$
\begin{cases}
    m_{i,k} = \frac{a_{i,k}^{(k)}}{a_{k,k}^{(k)}} \\
    \\
    a_{i,j}^{(k+1)} = a^{(k)}_{i,j} - m_{i,k} a_{k,j}^{(k)} \qquad\qquad i,j=k+1, \dots, n\\
    \\
    b^{(k+1)}_{i} = b^{(k)}_{i} - m_{i,k} b^{(k)}_{k} \\
\end{cases}
$$
L'elemento $a_{k,k}$ e' detto ***elemento pivot***, mentre le quantita' $m_{i,k}$ sono dette
***moltiplicatori***. Dal metodo si evince inoltre che l'algoritmo e' stabile se e solo se tutti gli
elementi pivot sono diversi da 0 (dal momento che compaiono al denominatore).
L'algoritmo termina inoltre in $n-1$ passi, con $n$ dimensione della matrice quadrata dei
coefficienti.

**Algoritmo di Gauss**:
```{.matlab .numberLines}
for k=1:n-1
    for i=k+1:n
        m(i k) = a(i k)/a(k k);
        for j=k+1:n
            a(i j)=a(i j)-m(i k)*a(k j);
        end
        b(i)=b(i)-m(i k)*b(k);1
    end
end
```
Dal codice si evince che la complessita' temporale e' di tipo $O(n^3)$

