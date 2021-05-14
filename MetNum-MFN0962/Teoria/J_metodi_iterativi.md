\newpage
# Metodi iterativi per la soluzione di sistemi lineari
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
per un'opportuna funzione di iterazione $\psi(x) = (I-A)x + b$. Nel metodo di punto fisso, la
convergenza del metodo era garantita se la derivata prima della funzione di iterazione in valore
assoluto era minore di 1. In questo caso, l'analogo della derivata e' il raggio spettrale, per cui
per la convergenza deve valere che $\rho(I - A) < 1$.  
Possiamo quindi definire la successione degli $x_k$ nel modo seguente
$$
\begin{cases}
    x^{(0)} = \text{ e' l'approssimazione iniziale}\\
    x^{(k+1)} = \psi(x^{(k)}) \rightarrow  \underbrace{x^{(k)} + b - Ax^{(k)}}_{r^{(k)}}\\
\end{cases}
$$
In cui $r^{(k)}$ e' il residuo della soluzione al passo *k-esimo*. 
