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

