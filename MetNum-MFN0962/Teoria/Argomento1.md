% Introduzione al corso di metodi numerici

# Introduzione al corso di metodi numerici

**Analisi Numerica**: Riguarda lo sviluppo e l'analisi di algoritmi per risolvere problemi dove vengono coinvolte variabili reali o complesse.   
Le variabili reali o complesse coinvolte sono dati affetti da errori (e quindi delle approssimazioni dei dati reali), i quali possono essere categorizzati in due categorie: 

* **Errori sperimentali**: derivanti dagli strumenti di misurazione e da fattori riguardanti le circostanze in cui sista misurando la grandezza 
* **Errori di arrotondamento**: derivanti da rappresentazioni di numeri infiniti in numeri finiti (es. quando si rappresenta un numero reale in un calcolatore, si introduce implicitamente un errore, proprio per la natura finita della variabile in cui si vuole rappresentare il valore) 

Siccome la natura di certi errori e' ineliminabile, l'algoritmo risultante sara' un'approssimazione del modello.  
Si puo' quindi parlare di:  

* **Algoritmo finito**: quando l'algoritmo termina in una serie di passaggi finita (risultato = numero finito).
* **Algoritmo infinito**: quando l'algoritmo approssima alla soluzione man mano che crescono le iterazioni ma non finisce (risultato = limite di una successione).   

Nei casi in cui l'algoritmo sia finito e' possibile studiare la propagazione degli errori che sono stati introdotti (errori sperimentali e di arrotondamento) nell'approssimazione del modello 
Lo studio in casi di algoritmi infiniti riguarda gli errori di troncamento (cioe' troncamento di una soluzione infinita) e gli errori di discretizzazione (dovuti al passaggio da un modello infinito a un modello discreto). 

### Buona posizione e condizionamento 

**Modello Matematico**: Complesso di formule che descrivono un comportamento.  
**Modello Numerico**: Modello matematico in cui sono state introdotte delle semplificazioni e/o approssimazioni. (non 
necessariamente significa che tale modello sia stato discretizzato)   
**Problema ben posto**: Indica un problema che ottiene *1 e 1 sola* soluzione che dipende con continuita' dai dati. In caso 
contrario (le condizioni non sono soddisfatte) si dice che il problema e' **mal posto**.  
Con *"dipende con continuita' dai dati"* si intende che la soluzione del problema varia in modo diretto al variare dei dati del 
problema. 
Se i dati cambiano con un determinato passo, anche la soluzione cambiera' con un passo simile.   
**Problema instabile**: Piccole variazioni nei dati in input iniziali introducono delle grosse variazioni nella soluzione. 
In caso contrario si dice che il problema e' **stabile**. 
  
Alcuni esempi di problemi ben posti e mal posti possono essere: 

* $x^2 + 1 = 0$ $\rightarrow$ Non esiste la soluzione (*mal posto*) 
* $x+y = 1$ $\rightarrow$ Infinite soluzioni (*mal posto*) 
* $\begin{cases} x_{1} = 1, \ 10^{-8} x_{2} = 10^{-8} \end{cases}$ $\rightarrow$ Una soluzione $x_{1} = x_{2} = 1$, apparentemente 
ben posto ma instabile poiche' introducendo un errore dovuto alla discretizzazione del problema, la soluzione cambia con un passo 
piu' grande. Si nota che quindi la soluzione non dipende con continuita' dai dati iniziali. 

Per avere delle indicazioni su come la soluzione vari rispetto ai dati in ingresso in seguito ad una perturbazione, si possono 
definire 2 indici: il numero di condizionamento **assoluto** e quello **relativo**.

#### Definizione
>*Sia $\delta d$ una perturbazione dei dati $d$ di un problema e sia $\delta x$ la corrispondente perturbazione 
>sulla sua soluzione $x$. Sia inoltre $\left \| \cdot \right \|$ una qualsiasi norma vettoriale. Il **numero di
>condizionamento assoluto** $K=K(d)$ e' definito dalla relazione
>$$ \left \| \delta x \right \| \leq K \left \| \delta d \right \|, $$ 
>mentre il **numero di condizionamento relativo** (o semplicemente numero di condizionamento) $k=k(d)$ verifica
>la diseguaglianza
>$$ \frac{\left \| \delta x \right \|}{\left \| x \right \|} \leq k  \frac{\left \| \delta d \right \|}{\left \| d \right \|}.$$*

#### Esempio 1 
Consideriamo il problema numero 3 visto in precedenza 
$$
\begin{cases} x_{1} = 1, \\ 10^{-8} x_{2} = 10^{-8} \end{cases}
$$

Questo problema puo' essere rappresentato in forma matriciale ($Ax=b$) nel modo seguente: 
$$
\begin{pmatrix}
 1 & 0\\ 
 0 & 10^{-8}
\end{pmatrix}
\begin{pmatrix}
 x_1 \\ 
 x_2
\end{pmatrix}=
\begin{pmatrix}
 1 \\ 
 10^{-8}
\end{pmatrix} 
$$


Un problema con l'introduzione di perturbazioni e' detto **problema perturbato** ed e' rappresentato
come $(A + \delta A)\widetilde{x}=b + \delta b$. 
Pensiamo quindi di ottenere l'equivalente perturbato del problema preso in considerazione introducendo
delle perturbazioni:  

* $\delta b = \begin{pmatrix} 10^{-8} \\ 10^{-8} \end{pmatrix}$
* $\delta A = \begin{pmatrix} 0 & 0 \\ 0 & 0 \end{pmatrix}$

Il sistema perturbato risultante da tali perturbazioni sara' quindi: 
$$
\begin{cases} x_{1} = 1 + 10^{-8} \\ 10^{-8} x_{2} = 10^{-8} + 10^{-8} \end{cases}
$$

La pertubazione sui dati di uscita e' $\delta x = x - \widetilde{x}$ (i calcoli son stati omessi, basta 
sostituire a $x$ il vettore soluzione del problema non perturbato e a $\widetilde{x}$ il vettore soluzione 
del problema perturbato).

Il condizionamento misura quindi quanto un errore sui dati possa essere amplificato nei risultati. 
E' necessario precisare che questi errori sono dovuti alla natura del modello, perio' tali errori non sono 
riconducibili al metodo di risoluzione scelto per la risoluzione del problema. 

#### Esempio 2 
Calcolare il numero di condizionamento del prodotto tra due numeri $x$ e $y$ con perturbazioni 
$\varepsilon_{x}$ e $\varepsilon_{y}$ con $\left | \varepsilon_{x} \right | \leq \tau$, $\left | 
\varepsilon_{y} \right | \leq \tau$. ($\tau$ indica una **tolleranza massima** d'errore).
 
*Nota: Siccome il valore della grandezza della perturbazione dipende direttamente dalla grandezza di $x$, e'
utile deprecare l'introduzione di perturbazioni come $x + \varepsilon_{x}$ a favore di un altro metodo che tiene
conto del valore di $x$. Per tener conto di questo valore, moltiplichiamo la perturbazione per $x$, ottenendo 
$x + \varepsilon_{x} = x (1 + \varepsilon_{x})$.*

Vogliamo vedere cosa succede quando si introducono le perturbazioni ai dati: 
$$
x(1 + \varepsilon_{x}) \cdot y (1 + \varepsilon_{y}) = xy + xy(\varepsilon_{x} + \varepsilon_{y}) + xy 
\varepsilon_{x} \varepsilon_{y}
$$

Dal momento che $xy \varepsilon_{x} \varepsilon_{y}$ e' una grandezza che tende verso lo zero molto velocemente
si puo' pensare di trascurarla, ottenendo quindi: 
$$
\sim xy(1 + \varepsilon_{x} + \varepsilon_{y}) = xy (1 + \varepsilon_{xy})
$$
dove $\varepsilon_{xy} (= \varepsilon_{x} + \varepsilon_{y})$ rappresenta la perturbazione 
del prodotto calcolato (sui dati in uscita), con: 

$$
\left | \varepsilon_{xy} \right | = \left | \varepsilon_{x} + \varepsilon_{y} \right | \leq 
\left | \varepsilon_{x} \right | + \left | \varepsilon_{y} \right | \leq 2\tau
$$

Il numero di condizionamento assoluto e' 2. 

### Algoritmi numerici
Insieme di istruzioni finito che implementa un metodo numerico per la risoluzione di un modello o problema. 
Un algoritmo (cosi' come il problema che risolve) puo' essere:  

* **Stabile**: L'algoritmo genera una soluzione giusta (tende al valore della soluzione) 
* **Instabile**: Gli errori si propagano man mano che l'algoritmo viene eseguito in modo incontrollato 
producendo un risultato diverso da quello reale

**Complessita' computazionale**: Numero di operazioni in virgola mobile necessarie per risolvere un problema 
mediante l'algoritmo in questione ($\neq$ da definizione classica perche' si tratta di algoritmi numerici)

#### Definizione
>Siano $a$ il valore esatto della soluzione di un problema e $a^*$ il valore perturbato di $a$, **l'errore
>assoluto** di un algoritmo e' definito come 
>$$ \varepsilon = \left | a - a^* \right | $$ 
>mentre **l'errore relativo** e' definito come 
>$$ \rho =\frac{\left | a - a^* \right |}{ \left | a \right | } $$

L'errore relativo fornisce informazioni sul numero di cifre significative esatte in $a^*$ (cioe' quelle a
partire dalla prima cifra diversa da $0$)

## Numeri di macchina 
#### Definizione
>Definiamo come **insieme dei numeri macchina** in base $\beta$, con $t$ cifre significative ed esponente
>nell'intervallo \left [ L,U \right ] l'insieme
>$$\mathbb{F}(\beta, t, L, U)= \{ 0 \} \cup \{ x \in \mathbb{R} : x=sign(x) \cdot m \cdot \beta^{p}  \} $$
>dove  
>
> * $t$ e $\beta$ sono interi positivi, con $\beta \geq 2$
> * $sign(x)=\pm 1$ a seconda del segno di $x$
> * la quantita' $m$ e' la **mantissa**
> * $p$ e' un intero compreso tra $L$ e $U$, detto esponente o caratteristica

#### Normalizzazione
Permette di evitare di memorizzare gli zeri che eventualmente precedono delle cifre significative in modo 
da sfruttare meglio lo spazio di memorizzazione e rendere la rappresentazione univoca. 

**Esempio**: Sia $\beta=10$
$$
\begin{aligned}
123000 &\rightarrow 0.123 \cdot 10^6  \\ 
0.00000123 &\rightarrow 0.123 \cdot 10^{-5}
\end{aligned}
$$

L'insieme di *numeri di macchina* $\mathbb{F}$ e' un sottoinsieme proprio di $\mathbb{R}$ poiche' essendo 
discreto e finito non puo contenere tutti i numeri reali.  
La funzione: 
$$
\begin{aligned}
fl: & \mathbb{R} \rightarrow \mathbb{F} \\
    & x \rightarrow fl(x)
\end{aligned}
$$
Dato un qualsiasi $x \in \mathbb{R}$, ci possono essere 3 casi possibili: 

* $x \in \mathbb{F}$, il che significa che $fl(x) = x$
* $|x| \lt \beta^{L-1}$, il che significa che $p$ e' minore del suo limite inferiore $L$, si genera quindi
un **underflow**
* $|x| \geq \beta^{U}$, $p \gt U$, si verifica un **overflow** 
* $|x| \in [ \beta^{L-1} , \beta^{U} )$ ma $x \notin \mathbb{F}$, cioe' il numero di cifre significative di 
$x$ e' superiore a $t$. In questo caso si puo' decidere se **troncare** il valore oppure **arrotondarlo**.

**Troncamento**: Operazione che elimina le cifre in eccesso tramite un troncamento. 
Il problema di questo approccio e' che gli errori sono tutti positivi, il che, se si effettuasse una somma 
degli errori, questi si sommerebbero tra loto, mentre se il segno potesse variare questi errori potrebbero 
cancellarsi con molta probabilita'. 

**Arrotondamento**: Si arrotonda alla cifra decimale piu' vicina. Genera un errore assoluto dimezzato 
rispetto all'operazione di troncamento. Inoltre gode del beneficio che gli errori possono cambiare segno 
riducendo l'accumulo di errore nella somma. 

**Arrotondamento unitario *(unit roundoff)***: Quantita' che maggiora l'errore relativo di arrotondamento. 
Equivale a $u = \frac{1}{2} \beta^{1-t}$

**Precisione di macchina *(machine epsilon)* **: Quantita' che indica la distanza tra 1 e il successivo 
numero di macchina. Equivale a: $\varepsilon_M = 2u = \beta^{1-t}$, il che equivale alla seguente 
definizione: 
$$
\epsilon_M := min \{ \varepsilon \in \mathbb{R} : trunc(1 + \varepsilon) \gt 1 \}
$$

#### Standard IEEE754
* **Precisione Singola**: $\mathbb{F}(2,24,-126,128)$
* **Doppia Precisione**: $\mathbb{F}(2,53,-1022,1024)$

### Propagazione 
In luogo delle normali operazioni aritmetiche un calcolatore utilizza le cosiddette operazioni di macchina. 
In generale, data una operazione di macchina $\oplus$ vale la seguente ipotesi: 
$$
x \oplus y = fl(x \oplus y) = (x + y)(1 + \varepsilon), | \varepsilon | \lt u. x,y \in \mathbb{F}
$$

Secondo questa ipotesi, l'errore relativo dell'operazione di somma, puo' essere calcolato come: 
$$
\varepsilon_{x+y} = 
\frac{ | (x + y) - fl(x + y) | }{|x + y|} = 
\frac{|- \varepsilon_{x} x - \varepsilon_{y} y |}{x + y} = 
\frac{|x|}{|x + y|} | \varepsilon_y | + \frac{ |y|}{|x + y|} | \varepsilon_{y} |
$$
Si nota che quando $x+y \rightarrow 0$ l'errore cresce tendendo a $\infty$. La somma puo' diventare quindi 
una operazione pericolosa.
Il numero di condizionamento $K$ dell'operazione somma diventa quindi molto grande quando sommo due numeri 
all'*incirca uguali in modulo ma con segno differente* ($x \sim -y$).  
Quando $x \sim -y$ si dice che si ha una *cancellazione numerica*. 

Come visto in precedenza, invece, la *moltiplicazione* non fa crescere in modo incontrollato, con
coeffieciente $K = 1$


