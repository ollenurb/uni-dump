\newpage
# Metodi iterativi per la soluzione di sistemi lineari
## Introduzione
Nel capitolo 7 abbiamo visto i metodi diretti per la soluzione di sistemi lineari. Come gia' detto,
pero', questa tipologia di metodi non e' particolarmente indicata per sistemi lineari con matrici
dei coefficienti *sparse*, dal momento che soffrono principalmente del cosiddetti problema di
*fill-in* (e una conseguente saturazione della memoria). I metodi iterativi, lasciano invece la
matrice dei coefficienti invariata, evitando cosi' il fill-in in casi di matrici sparse.
Come detto gia' in precedenza, un metodo iterativo consiste nel generare una successione di vettori
$x_k, k \geq 0$ tale che *converga* alla soluzione esatta $x$ del sistema $Ax=b$.

Un approccio iniziale per derivare un metodo iterativo potrebbe essere analogo a quello adottato nel
metodo di punto fisso. Il ragionamento lo stesso, ma si applica a sistemi lineari. Sia quindi $A$
una matrice dei coefficienti non singolare, allora possiamo fare il seguente ragionamento
$$
Ax = b \quad \leftrightarrow \quad b - Ax = 0 \quad \leftrightarrow \quad 
\underbrace{x + b -Ax}_{\psi(x)} = x
$$
per un'opportuna funzione di iterazione $\psi(x) = (I-A)x + b$ (raccolti $x$ da $A$ e $x$). Nel
metodo di punto fisso, la convergenza del metodo era garantita se la derivata prima della funzione
di iterazione in valore assoluto era minore di 1. In questo caso, l'analogo della derivata e' il
raggio spettrale, per cui per la convergenza deve valere che $\rho(I - A) < 1$.  Possiamo quindi
definire la successione degli $x_k$ nel modo seguente (porto a destra $x$ e sommo $x$ in entrambe le
parti)
$$
\begin{cases}
    x^{(0)} \; \rightarrow \; \emph{approssimazione iniziale}\\
    x^{(k+1)} = \psi(x^{(k)}) \rightarrow  \underbrace{x^{(k)} + b - Ax^{(k)}}_{r^{(k)}}\\
\end{cases}
$$
Abbiamo quindi ottenuto un metodo di punto fisso per sistemi lineari, in cui $r^{(k)}$ e' il residuo
della soluzione al passo *k-esimo*. E' possibile pero' precondizionare ulteriormente il metodo,
cioe' aggiungere delle accortezze per rendere piu' veloce la sua convergenza.

Sia $P$ una matrice invertibile "semplice", cioe' che sia triangolare (s/i) oppure diagonale. Per
il momento ci limiteremo a dare solamente queste informazioni riguardo a $P$. E' possibile quindi
moltiplicare ambo i membri del sistema per $P^{-1}$, ottenendo
$$
P^{-1} Ax = P^{-1} b \; \rightarrow \; 0 = P^{-1}b - p^{-1}Ax \; \rightarrow \; 
x=\underbrace{x + P^{-1}b-P^{-1}Ax}_{\psi(x)}
$$
Notiamo che questa volta possiamo ottenere due funzioni $\psi(x)$ di iterazione differenti, a
seconda che si voglia raccogliere $P^{-1}$ oppure $x$
$$
\begin{split}
    \psi_1(x) &= (I - P^{-1}A)x + P^{-1}b\\  
    \psi_2(x) &= x + P^{-1}(b - Ax)\\  
\end{split}
$$
Scegliamo la seconda, e come prima costruiamo la successione risultante
$$
\begin{cases}
    x^{(0)} \; \rightarrow \; \emph{approssimazione iniziale}\\
    x^{(k+1)} = \psi(x^{(k)}) \rightarrow  x^{(k)} + P^{-1}(\underbrace{b - Ax^{(k)}}_{r^{(k)}})\\
\end{cases}
$$
Ma quindi, la seconda equazione puo' essere scritta come
$$
x^{(k+1)} = x^{(k)} + P^{-1}r^{(k)}
$$
Siccome il calcolo della matrice inversa e' molto oneroso in termini computazionali ed e'
generalmente instabile numericamente, e' possibile evitare di calcolarla riscrivendo la relazione
come sistema lineare
$$
x^{(k+1)} = x^{(k)} + P^{-1}r^{(k)} \; \rightarrow \;
Px^{(k+1)} = Px^{(k)} +r^{(k)} \; \rightarrow \;
P(\underbrace{x^{(k+1)} - x^{(k)}}_{y}) = r^{(k)}
$$
Si ottiene quindi un sistema lineare con matrice dei coefficienti $P$, per cui calcolarne la
soluzione e' facile dal momento che l'ipotesi e' che sia triangolare. Una volta risolto il sistema e
trovata la soluzione $y$ e' possibile ottenere $x^{(k+1)}$, poiche' 
$$
x^{(k+1)} = x^{(k)} + y
$$
Per cui e' possibile costruire il metodo iterativo seguente

1. $r^{(k)} = b - Ax^{(k)}$
2. Risolvo il sistema lineare $Py = r^{(k)}$
4. Calcolo la $k+1$*-esima* soluzione $x^{(k+1)} = y + x^{(k)}$

con $k = 1, 2, \dots$

### Convergenza
Studiamo ora la convergenza di tale metodo ottenuto. Per definizione, l'errore al passo *k-esimo* e'
$e^{(k)} = x^{(k)} - x$, quindi

$$
\begin{alignedat}{2}
    e^{(k+1)} &= x^{(k+1)} - x                & & \qquad (\emph{definizione errore})\\
           &= x^{(k)} + P^{-1}(b - Ax^{(k)}) - x & & \qquad (\emph{definizione } x^{(k+1)})\\
           &= x^{(k)} - x + P^{-1}A(x - x^{(k)}) & & \qquad (\emph{esplicito } A)\\
           &= I(x^{(k)} - x) - P^{-1}A(x - x^{(k)}) & & \qquad (\emph{esplicito } I)\\
           &= (I-P^{-1}A)(x^{(k)} - x) & & \qquad (\emph{esplicito } (x^{(k)} - x))\\
           &= (I-P^{-1}A)e^{(k)} & & \qquad (\emph{definizione errore})
\end{alignedat}
$$
Procedendo nello stesso modo, possiamo ri-espandere $e^{(k)}$ iterativamente, ottenendo in
definitiva
$$
= (I - P^{-1}A)^{k+1} e^{(0)}
$$
E' possibile dimostrare che se $\rho(I - P^{-1}A) < 1$, allora si ha che $e^{(k)} \rightarrow 0$ per
$k \rightarrow \infty$. La condizione seguente e' la condizione necessaria e sufficiente per la
convergenza del metodo.  Una condizione di piu' facile verifica ma piu' *"debole"* (e quindi solo
sufficiente) e' che la convergenza si ha se $||I - P^{-1}A||_{1,\infty} < 1$. 

Stabilite le condizioni di convergenza, vediamo ora come scegliere la matrice di condizionamento $P$
scelta in precedenza. In generale, tale matrice dovra' esser scelta in modo tale che:

* $\rho(I - P^{-1}A)$ deve essere il piu' piccolo possibile
* $Py = r^{(k)}$ deve essere un sistema molto semplice da risolvere

Osserviamo pero' che le due scelte sono in qualche modo contrastanti. Supponiamo di scegliere $P =
A$, in quanto ne risulterebbe un raggio spettrale piu' piccolo, per cui $\rho(I - A^{-1}A)
\rightarrow \rho(I - I) \rightarrow \rho(0)=0$. Il problema e' che tale scelta porta alla soluzione
del sistema $Py = Ay$, per cui si sarebbe di nuovo da capo. Questo caso limite, pero', ci da un
indizio sulla direzione da prendere per la scelta di P: deve essere "simile" ad A ma piu'
*"semplice"*.

## Metodo di Jacobi
Il metodo di Jacobi e' un metodo iterativo in cui la matrice di preceondizionamento $P$ e' la
matrice formata dalla diagonale principale di $A$.
$$
P = \begin{bmatrix}
a_{11} & 0   & 0 & 0\\
0   & a_{22} & 0 & 0\\
0   & 0   & \ddots & 0\\
0   & 0   & 0 & a_{nn}\\
\end{bmatrix}
$$
Dal momento che la matrice e' non singolare per ipotesi, e' sempre possibile ottenere la sua matrice
diagonale scambiando le righe che diversamente conducerebbero ad avere un elemento nullo sulla
diagonale principale. Se questo non fosse vero ci sarebbe qualche riga o qualche colonna interamente
composta da 0, e questo rendrebbe $A$ singolare e quindi di conseguenza il sistema non sarebbe
risolvibile.

Consideriamo ora la funzione di iterazione $\psi(x) = (I - D^{-1}A)x^{(k)}+D^{-1}b$ e verifichiamo
l'ipotesi di convergenza:
$$
\begin{bmatrix}
1 & 0   & 0 & 0\\
0   & 1 & 0 & 0\\
\vdots  & \vdots   & \ddots & \vdots\\
0   & 0   & 0 & 1\\
\end{bmatrix}
-
\begin{bmatrix}
1/a_{11} & 0   & 0 & 0\\
0   & 1/a_{22} & 0 & 0\\
\vdots  & \vdots   & \ddots & \vdots\\
0   & 0   & 0 & 1/a_{nn}\\
\end{bmatrix}
\begin{bmatrix}
a_{11} & a_{12}  & \cdots & a_{1n}\\
a_{21} & a_{22}  & \cdots & a_{2n}\\
\vdots  & \vdots   & \ddots & \vdots\\
a_{n1} & a_{n2}  & \cdots & a_{nn}\\
\end{bmatrix}
$$
Ricordando che moltiplicare la matrice diagonale per un'altra matrice a sinistra equivale a
moltiplicare l'elemento della diagonale per le righe, e sottraendo infine il risultato per la
matrice identita', si ottiene la matrice seguente 
$$
\begin{bmatrix}
0 & -a_{12}/a_{11}  & \cdots & -a_{1n}/a_{11}\\
-a_{21}/a_{22} & 0 & \cdots & -a_{1n}/a_{22}\\
\vdots  & \vdots   & \ddots & \vdots\\
-a_{n1}/a_{nn} & -a_{n2}/a_{nn} & \cdots & 0\\
\end{bmatrix}
$$
Avendo quindi la forma della matrice di iterazione nota, possiamo procedere a vedere se il metodo
possa convergere o meno:
$$
\begin{alignedat}{2}
   || I - D^{-1}A ||_{\infty} &\leftrightarrow \max_{1 \leq i \leq n} \sum^n_{j=1, j \neq i} \bigg|
   \frac{a_{ij}}{a_{ii}} \bigg| < 1 & & \qquad (\emph{definizione norma }\infty)\\
           &\leftrightarrow  |a_{ii}|> \sum^n_{j=1, j \neq i} |a_{ij}| \quad i= 1, \dots, n & & \qquad
           (\emph{esplicito }a_{ii})\\
\end{alignedat}
$$
Ma questo succede se e solo se la matrice e' diagonalmente dominante stretta per righe, per cui
possiamo concludere che il metodo convergera' per tutte le matrici dei coefficienti diagonalmente
dominanti strette.

Una volta stabilito che la scelta di $P=D$ e' sensata (dal momento che e' convergente), consideriamo
ora la successione
$$
\begin{cases}
    x^{(0)} \; \rightarrow \; \emph{approssimazione iniziale}\\
    x^{(k+1)} = (I - D^{-1}A)x^{(k)}+D^{-1}b\\
\end{cases}
$$
estendendo la somma e il prodotto tra matrici/vettori otteniamo che il generico elemento $i$ del
vettore $x^{(k+1)}$ e' dato dalla formula
$$
x^{(k+1)}_i = - \sum^n_{j=1, j \neq i} \frac{a_{ij}}{a_{ii}} x_j^{(k)} + \frac{1}{a_{ii}} b_i
$$

Possiamo osservare che ad ogni iterazione il metodo dovra' mantenere in memoria due variabili: il
vettore $x^{(k)}$ e il vettore $x^{(k+1)}$.

## Metodo di Gauss-Seidel
E' una modifica del metodo di Jacobi che utilizza un solo vettore ad ogni iterazione (e non due).
L'idea e' quella di sfruttare le componenti $k+1$*-esime* che sono gia' state calcolate. In altri
termini
$$
x_i^{(k+1)} = \frac{b_i - \sum^{i-1}_{j=1} a_{ij} x_j^{(k+1)} - \sum^{n}_{j=i+1} a_{ij}
x_j^{(k)}}{a_{ii}}
$$
Dall'espressione si nota come sia molto simile a quella del metodo di Jacobi, con la differenza che
si sfruttano le componenti ($k+1$*-esime*)precedenti all'iterazione *i-esima* (prima sommatoria). 
$$
\begin{alignedat}{2}
    a_{ii} x_i^{(k+1)} + \sum^{i-1}_{j=1} a_{ij} x_j^{(k+1)} 
    &= b_i - \sum^{n}_{j=i+1} a_{ij} x_j^{(k)} & & \qquad (\emph{moltiplico per} a_{ii})\\
    \sum^{i}_{j=1} a_{ij} x_j^{(k+1)}
    &= b_i - \sum^{n}_{j=i+1} a_{ij} x_j^{(k)} & & \qquad (\emph{linearita' sommatoria})\\
\end{alignedat}
$$
L'ultima relazione ottenuta in forma matriciale corrisponde al sistema lineare seguente
$$
\underbrace{
\begin{bmatrix}
a_{11} & 0   & \dots & 0\\
a_{21}   & a_{22}  & \dots & 0\\
\vdots  & \vdots   & \ddots & \vdots\\
a_{n1}   & a_{n1}   & \dots & a_{nn}\\
\end{bmatrix}
}_{L}
x^{(k+1)}
=
b-
\underbrace{
\begin{bmatrix}
0 & a_{12} & a_{13} & \dots & a_{1n}\\
0 & 0 & a_{23} & \dots & a_{2n}\\
\vdots & \vdots & \vdots   & \ddots & \vdots\\
0   & 0 & 0 & \dots & a_{nn}\\
\end{bmatrix}
}_{A-L}
x^{(k)}
$$
Il che equivale in forma compatta a
$$
Lx^{(k+1)} = b-(A-L)x^{(k)}
$$
Per ottenere la funzione di iterazione $\psi$, manipoliamo algebricamente quest'ultima relazione
$$
\begin{alignedat}{2}
    Lx^{(k+1)} &= b-(A-L)x^{(k)} & & \\
            &= L^{-1}(L-A)x^{(k)} + L^{-1}b & & \qquad (\emph{moltiplico per }L^{-1})\\
            &= (I - L^{-1}A)x^{(k)} + L^{-1}b & & \qquad (\emph{espando la prima moltiplicazione})\\
\end{alignedat}
$$

Abbiamo quindi trovato la relazione di $\psi$, da cui si nota subito la similarita' rispetto al
metodo di Jacobi. Piu' precisamente, il metodo di Gauss-Seidel differisce dal metodo di Jacobi solo
nella scelta della matrice di precondizionamento, dal momento che in Jacobi e' $D$, mentre in GS e'
$L$.  
Si puo' dimostrare che il metodo di Gauss-Seidel converge:

* Se e solo se $\rho(I - L^{-1}A) < 1$ 
* Se $A$ e' strettamente diagonalmente dominante
* Se $A$ e' simmetrica e definita positiva (se tutti i suoi autovalori sono definiti positivi)

Inoltre, e' importante sottolineare il fatto che la convergenza di Gauss-Seidel e quella di Jacobi
non sono in qualche modo correlazionate. Cio' implica che la convergenza di un metodo non assicura
la convergenza anche dell'altro e viceversa. Generalmente, pero', quando entrambi convergono
Gauss-Seidel ha una convergenza superiore.

Un caso specifico in cui questo non accade e' per matrici tri-diagonali, cioe' matrici in cui gli
elementi sulle 3 diagonali sono diversi da 0, mentre tutti gli altri elementi sono nulli. 
In questo caso e' stato dimostrato che entrambi i metodi sono convergenti o divergenti, e in caso ci
sia la convergenza vale
$$
\rho(I - L^{-1}A) = (\rho(I-D^{-1}A))^2
$$
Cio' significa che asintoticamente sono necessarie meta' iterazioni del metodo di Gauss-Seidel
per ottenere la stessa precisione del metodo di Jacobi. In altri termini, la velocita' di
convergenza del metodo Gauss-Seidel e' doppia rispetto a quella di Jacobi.

## Criterio d'arresto
Come ogni metodo iterativo, Gauss-Seidel e Jacobi dovranno avere un qualche criterio d'arresto che
puo' essere dato da una tolleranza e da un numero massimo di iterazioni.
Nel caso della tolleranza, l'idea e' sempre quella di fermarsi quando l'errore della soluzione
$x^{(k)}$ e' minore di una certa tolleranza $\tau$.
Dal momento che l'errore e' calcolato in termini della soluzione esatta, sono necessari degli
stimatori *"a posteriori"* basati sul:

1. Residuo al passo *k-esimo* $r^{(k)}$ 
    * Errore assoluto: $$||x^{(k)} - x|| \leq ||A^{-1}|| \; ||r^{(k)}||$$
    * Errore relativo: $$\frac{||x^{(k)} - x||}{||x||} \leq \kappa(A) \varepsilon$$
2. Incremento $\delta^{(k)} = x^{(k+1)} - x^{(x)}$
    * Errore assoluto: $$||e^{(k)}||_2 \leq \frac{||\delta^{(k)}||_2}{1 - \rho(B)} \leq \frac{\varepsilon}{1 - \rho(B)}$$
    * Errore relativo: $$\frac{||e^{(k)}||}{||b||} \leq \frac{\varepsilon}{1- \rho(B)} $$
   
Nel secondo caso il controllo dell'incremento e' significativo soltanto se $\rho(B)$ e' molto piu'
piccolo di 1, poiche' in tal caso l'errore sara' dello stesso ordine di grandezza dell'incremento.
