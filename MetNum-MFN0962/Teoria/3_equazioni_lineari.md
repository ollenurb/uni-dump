\newpage
# Equazioni non lineari

Le equazioni non lineari sono tutte quelle funzioni la cui equazione non e' nella forma  $f(x) = ax
+ b$.  Siccome queste funzioni non sono note, per trovarne la soluzione si ricorre ad un algoritmo
numerico iterativo per l'approssimazione numerica. (Di fatto anche le calcolatrici ricorrono a tale
metodo per il calcolo di alcune funzioni).  Formalmente, un problema non lineare si presenta come: 
$$
f(x) = 0
$$
Cioe' trovare il punto $x$ tale che annulli $f$, o in altri termini significa trovare gli zeri della
funzione $f$. Un possibile approccio per la risoluzione di tali problemi consiste nel generare
iterativamente una successione $\{x_{1}, x_{2}, ..., x_{k}, ...\}$ a partire da un punto iniziale
$x_0$, tale che converga ad una radice del problema $\alpha : f(\alpha) = 0$. (gli zeri di una
funzione sono anche chiamati *radici*)

Siccome questi metodi iterativi si avvicinano man mano alla soluzione, ogni passo avra' un
determinato errore, chiamato **errore al passo $k$**. Formalmente possiamo definire l'errore di un
algoritmo iterativo al passo $k$, come 
$$e_k = x_k - \alpha$$
Avendo quindi definito la nozione di errore, possiamo anche formalizzare il concetto di
**convergenza**: Un algoritmo numerico e' convergente quando 
$$\lim_{k \rightarrow \infty} |e_{k}| =0$$ 
Cioe', se faccio tendere i passi ad infinito, il mio errore sara' sempre piu' piccolo e tendente al
valore della radice. 

Si puo' inoltre notare che la convergenza puo' essere piu' o meno veloce. Per quantificare la
velocita' di convergenza verso la soluzione, introduciamo la seguente

>***Definizione**: Un metodo iterativo convergente **ha ordine** $p$ se esiste una costante finita
>$C$ tale che*
>$$
>\lim_{k \rightarrow \infty} \frac{|e_{k+1}|}{|e_{k}|^p} = C
>$$

Maggiore e' l'ordine $p$, maggiore e' la riduzione dell'errore che si verifica ad ogni passo, per
cui e' minore il numero di iterazioni totali necessarie per raggiungere la precisione richiesta.  Il
valore del limite $C$ viene detto **costante asintotica dell'errore**. Vale inoltre la pena pnotare
alcune caratteristiche quali: 

* Quando un metodo ha ordine $p=1$ allora deve verificarsi $C \leq 1$.
* Quando $p = 1$ e $C = 0$ si dice che il metodo e' **superlineare**. 

Siccome d'ora in avanti useremo pesantemente i polinomi interpolanti, vale la pena introdurre un
teorema fondamentale dell'analisi:

>***Teorema (Serie di Taylor)**: Sia $f \in C^{(n+1) [a,b]}$. Allora $\forall x_0 \in [a,b]$ e per
>ogni intero $n$ esiste un polinomio $t_n$ di grado $n$ (detto **polinomio di Taylor**) tale che: *
>$$
>f(x) = t_n(x) + R_{n+1}(x), x \in [a,b]
>$$
>*Il polinomio $t_n$ e' dato da:* 
>$$
>t_n(x) = \sum_{k=0}^{n} \frac{f^{(k)}(x_0)}{k!} (x - x_0)^k
>$$
>*e il resto e' definito come:*
>$$
>R_{n+1}(x) = \frac{f^{n+1} (\xi) }{(n+1)!}(x - x_0)^{n+1}
>$$
>*per un certo $\xi$ (dipendente da $x$) apparenente all'intervallo $I_{(x_0, x)}$ di estremi* $x_0$ 
>e $x$. 

Il teorema afferma che data una funzione che sia continua e derivabile fino all'ordine $n+1$, allora
esiste per forza un polinomio di grado $n$ che assume gli stessi valori di $f$ (approssima $f$)
nell'intervallo $[a,b]$.

Come ben si sa, inoltre, le funzioni possono avere una o molteplici radici. Questo fatto puo' essere
formalizzato dalla seguente

>***Teorema**: Una radice $\alpha$ ha molteplicita' $m$ se e solo se*
>$$
>\begin{aligned}
>f^{(k)}(\alpha) & = 0, k = 0,1,...,m-1 \\
>f^{(m)}(\alpha) & \neq 0
>\end{aligned}
>$$
>*Dove $f^{(k)}(\alpha)$ indica la derivata $k$-esima di $f$ calcolata nel punto $\alpha$

Una radice di un polinomio e' detta semplice se ha molteplicita' $m=1$, mentre viene detta multipla
se ha molteplicita' $m \geq 2$, o in termini *algebrici*: 

*$\alpha$ e' **radice semplice di un'equazione** se si puo' scrivere*
$$
f(x) = (x-\alpha)h(x), \text{ con } h(\alpha) \neq 0 
$$
$\alpha$ *e' invece **radice multipla di un'equazione** con molteplicita' $m \geq 2$ se*
$$
f(x) = (x-\alpha)^{m}h(x), \text{ con } h(\alpha) \neq 0 
$$

Per studiare le radici di una funzione possiamo anche utilizzare strumenti analitici quali la
derivata prima. Studiandone l'andamento, quando essa tende ad essere tangente all'asse delle $x$
($f'(x) = 0) significa che si e' in prossimita' di un **minimo** oppure **massimo** relativo della
funzione.  Il fatto che ci siano piu' massimi e minimi indica la presenza di piu' radici. 

Il condizionamento del calcolo delle radici e' dato principalmente dall'andamento della funzione in
prossimita' della radice. Difatti, gli algoritmi numerici forniscono un intervallo $[a,b]$ in cui e'
contenuta la radice $\alpha$. E' facile notare che piu' questo intervallo e' grande maggiore sara'
l'errore. Se quindi la derivata prima della funzione tende a $0$ in prossimita' della radice,
l'ampiezza di questo intervallo tendera' a crescere sempre di piu'. Questo perche' il tendere a $0$
della derivata prima corrisponde al fatto che la funzione tende ad essere tangente all'asse delle
$x$ e quindi ad avere una doppia radice. 

## Metodo di bisezione
Il metodo di bisezione e' il metodo numerico piu' semplice e banale dal punto di vista
dell'implementazione. L'idea che sta alla base del metodo e' semplicemente quella di andare a
dividere progressivamente un intervallo $[a,b]$ che contiene la radice da calcolare. Per dividere
l'intervallo se ne calcola il punto medio $c$. Se il valore della funzione in prossimita' del punto
medio e' uguale a $0$ la radice e' stata trovata e ci si ferma, in caso contrario si sceglie un
intervallo tra $[a, c]$ o $[c, b]$. Per sapere quale dei due intervalli scegliere si determina in
quali dei due intervalli e' presente la radice andando a studiare in quali dei due la funzione
cambia di segno.  

Piu' formalmente, considerata una funzione $f(x)$, continua e contenente un solo zero
nell'intervallo $[a,b]$ : $c=\frac{a+b}{2}$ e' il *punto medio* dell'intervallo.  Allora si possono
verificare le seguenti condizioni: 

1. $f(c) = f(\alpha) = 0$ 
2. $\alpha \in [a, c]$
3. $\alpha \in [c, b]$

Nel primo caso ci si ferma perche' la soluzione e' stata trovata, mentre per determinare se ci si
stia trovando nel caso 2 oppure nel caso 3 basta analizzare in quale intervallo la funzione cambia
di segno calcolando $f(a) \cdot f(c)$, il cui risultato puo' essere

* Negativo, allora $\alpha \in [a, c]$
* Positivo, allora $\alpha \in [c, b]$

Il metodo prevede poi di reiterare il procedimento ponendo come nuovo intervallo quello scelto (che
conterra' sicuramente $\alpha$).

Per poter calcolare il numero di iterazioni necessarie ad ottenere un **errore inferiore** a
$\varepsilon$ poniamo

* $k$: numero dell'iterazione 
* $x_k$: soluzione del passo $k$, per definizione e' $x_k = \frac{a_k + b_k}{2}$

Allora le iterazioni necessarie sono pari a 
$$
| x_k -\alpha | \leq \frac{b-a}{2^k} \leq \varepsilon \rightarrow  
k \geq log_2(b-a) + log_2 \varepsilon^{-1}
$$

Se supponiamo quindi che la funzione sia continua e che abbia una radice ($f(a) \cdot f(b) < 0$),
allora il metodo converge alla soluzione e l'errore si dimezza ad ogni passo poiche' l'ampiezza
stessa dell'intervallo viene dimezzata percio' per $k \rightarrow \infty$ si ha che $\varepsilon
\rightarrow 0$.  Dal momento che l'errore si dimezza ad ogni iterazione $k$, il metodo ha ordine
$p=1$ e costante asintotica $C=\frac{1}{2}$.

## Metodo di Newton 
L'idea che sta alla base del metodo di Newton consiste nel scegliere inizialmente un punto $x_0$ e
di considerarne la sua *retta tangente* rispetto ad $f$. Questa retta tangente avra' un'intersezione
con l'asse $x$ che rappresentera' il nuovo punto da considerare $x_1$. In questo modo, applicando
questi passaggi iterativamente, si puo' ottenere una successione di punti $x_k$ che (sotto oppurtune
condizioni) convergono man mano alla radice $\alpha$. 
E' possibile formalizzare il generico passo del metodo come: 

$$
x_{k+1} = x_k - \frac{f(x_k)}{f'(x_k)}
$$

Questa formalizzazione si ottiene considerando inizialmente un generico fascio di rette con centro
nel punto di coordinate $(x_k, f(x_k))$, e successivamente imponendo che il coefficiente angolare sia
uguale a $f'(x_k)$ e che $y=0$. 

>**Nota**: $f'$ deve essere sempre $\neq 0$, ma questo accade per le ipotesi iniziali (cioe' che $f$
>sia continua e dotata di una sola radice), poiche' in caso contrario, $f$ corrisponderebbe ad una 
>funzione orizzontale che non ha intersezioni con l'asse delle ascisse. 

Si puo' derivare l'errore generico al passso $k+1$ costruendo il metodo tramite lo sviluppo in serie
di Taylor e considerandone il resto. L'errore risulta quindi essere 

$$
|e_{k+1}| \leq \frac{1}{M} |M e_0|^{2k+1} 
$$

Cio' significa che il metodo converge (e quindi $e \rightarrow \infty$) se $\abs{Me_0} < 1$, il che
avviene quando 

$$
x_0 \in (\alpha - \frac{1}{M}; \alpha + \frac{1}{M})
$$

Cioe' quando il punto iniziale $x_0$ viene scelto sufficientemente vicino alla soluzione $\alpha$. 

Per quanto riguarda la velocita' di convergenza del metodo si ha che 

$$
\lim_{k \rightarrow \infty} \frac{|e_{k+1}|}{|e_k|^2} = \frac{1}{2} \frac{|f''(\alpha)|}{|f'(\alpha)|}
$$

Dalla formula emerge quindi che $p = 2$. Il limite converge ssse $\alpha$ e' una radice semplice
(quindi $f(\alpha) \neq 0$). In corrispondenza di radici multiple, la velocita' di convergenza
$C=\frac{1}{2}$, quindi $p=1$ (e quindi estremamente lenta).

Come **criterio di arresto** assegnati una tolleranza $\tau$ e un numero massimo di iterazioni $N$,
possiamo utilizzare la seguente formula 
$$ 
|x_k - x_{k-1}| < \tau|x_k| \text{ or } f(x_k) = 0 \text{ or } k > N. 
$$
Il numero massimo di iterazioni viene utilizzato per evitare che il metodo giri all'infinito in
situazioni in cui non converga alla soluzione. 

Vediamo ora alcuni metodi che si basano sulle idee del metodo di Newton ma che considerano rette con
coefficienti angolari differenti. Tali metodi sono appunti definiti metodi *quasi Newton*. 

## Metodo delle corde 
Alternativamente al metodo di Netwon che considera tutte le rette con tangenti a $f$ (e quindi con
coefficiente angolare che dipende da $f'$), il metodo delle corde considera un valore costante $m_k$
come coefficiente angolare.

In questo modo, al posto di avere una fascio di rette tangenti, si ottiene un fascio di rette
secanti, tutte con lo stesso coefficiente angolare. Questo coefficiente angolare sara' uguale al
coefficiente angolare della prima tangente del punto considerato. ($m=f'(x_0)$)

Tale metodo, seppur semplice dal punto di vista implementativo, presenta delle prestazioni molto
poco soddisfacenti nemmeno se comparate con il metodo di bisezione.

## Metodo delle secanti 
Il ragionamento e' analogo a quello del metodo delle corde, ma si utilizza un coefficiente angolare
*m* differente, definito come

$$
m_k = \frac{f(x_k) - f(x_{k-1})}{x_k - x_{k-1}}
$$

In altri termini, si trova la retta con coefficiente angolare tale che sia secante (passante) per
due punti dati.  Contrariamente ai metodi Newton e delle corde, questo metodo necessita di due punti
iniziali anziche' uno. 

In termini algebrici possiamo definire l criterio per la generazione dei punti come 
$$
x_{k+1} = \frac{x_{k-1} f(x_k) - x_k f(x_{k-1}) } {f(x_k) - f(x_{k-1})}
$$

Un vantaggio di questo metodo e' che approssima molto bene il metodo delle tangenti (man mano che
l'intervallo si rimpicciolisce, i due punti tenderanno a esser molto vicini, rendendo le rette quasi
delle tangenti), ma senza la necessita' di dover computare delle derivate prime in modo diretto, le
quali potrebbero essere non note a priori. 
Inoltre, guardando la formula per la generazione della successione dei punti, si nota che e'
presente $f(x_{k-1})$, cio' significa che tale valore e' stato calcolato in precedenza e tramite
opportune memorizzazioni e' possibile evitare di ricalcolarlo. 

E' possibile dimostrare che l'**ordine di convergenza** e' pari a $p = \frac{1 + \sqrt{5}} {2}
\approx 1.618$ (questa quantita' e' nota come *rapporto aureo*). 
Cio' indica che a parita' di costo computazionale esso produce una riduzione dell'errore maggiore
del metodo di Newton, oltre a non richiedere la computazione della derivata prima. 

## Metodi di punto fisso
Fino ad ora i metodi che sono stati trattati (eccetto quello delle secanti) possono essere
generalizzati nella forma 
$$
x_{k+1} = g(x_k)
$$
Dove $g$ e' un'opportuna funzione d'iterazione che dipende dal metodo. Se questa funzione converge
alla radice si ha quindi che 
$$
\alpha = g(\alpha)
$$
Cioe', la funzione di iterazione come prossimo punto data la radice, ritorna la radice stessa.
In analisi, il valore che una funzione mappa in se stesso e' detto **punto fisso**. 
I metodi di punto fisso quindi non consistono piu' nel trovare un valore $\alpha$ tale che
$f(\alpha) = 0$ ma invece che $\alpha=g(\alpha)$. Ovviamente, la funzione $g$ viene scelta in modo
che il suo punto fisso coincida con la radice di $f$.   
Il metodo consiste nel porre inizialmente che $x=g(x)$ e di dare un punto iniziale inziale $x_0$ che
sia un'approssimazione di $\alpha$. Successivamente si procede per costruzione di una successione
tramite una regola del tipo
$$
x_{k+1} = g(x_k)
$$
Si puo' notare che ponendo $x = g(x)$ (in altri termini esplicitando la $x$ di $f(x)$) possiamo
ottenere diverse funzioni di iterazione $g$ in base al modo in cui si opera algebricamente.  Non
tutte le possibili funzioni di iterazioni pero' garantiscono la convergenza alla soluzione, anzi,
piu' precisamente la nozione di convergenza di un metodo iterativo di punto fisso, e' connessa al
concetto di **contrattivita'**. La contrattivita' esprime la capacita' di una funzione $g$ di
avvicinare tra loro due punti (*contrarre=diminuire le distanze*). 

>***Definizione**: Una funzione $f(x)$ e' contrattiva nell'intervallo $I \subset \mathbb{R}$ se
>esiste una costante $C \in ]0,1[$ tale che* 
>$$
>| g(x) - g(y) | \leq C | x - y |, \text{  } \forall x,y \in I 
>$$

Diciamo quindi che il metodo converge *se e solo se* $g(x)$ e' una funzione contrattiva.  
Una funzione contrattiva e' anche continua, ma non e' necessariamente derivabile. 
Nel caso in cui essa sia derivabile risulta che 
$$
C=max_{x \in I} |g'(x)|
$$
E quindi possiamo dire che la condizione di contrattivita' per una funzione derivabile risulta essere
$$
|g'(x)| < 1 \text{ in } I
$$
In caso non si verificasse questa condizione, il metodo **puo'** non convergere alla soluzione $\alpha$.
Piu' $|g'(x)| \rightarrow 0$ piu' e' veloce la convergenza alla soluzione. 
Questa relazione tra contrattivita' e convergenza del metodo e' chiarita dal seguente teorema

>***Teorema**: Sia $f: [a,b] \rightarrow [a,b]$ una funzione di classe $C^1 [a,b]$ con*
>$$ 
>|g'(x)| \leq C < 1, \forall x \in [a,b]
>$$
>*e si consideri il metodo iterativo $x_{k+1} = g(x_k)$ con punto iniziale $x_0 \in [a,b]$*
>*Allora:*
>
>* La successione degli $x_k$ converge ad un limite $\alpha$ per $k \rightarrow \infty$ 
>* $\alpha \in [a,b]$
>* $\alpha$ e' l'unico punto fisso di $g$
>* La convergenza e' almeno lineare e $\frac{x_{k+1} - \alpha}{x_{k} - \alpha} \rightarrow g'(\alpha)$

Il seguente corollario mostra sotto quali condizioni la convergenza del metodo e' quadratica

>***Corollario:** Sotto le ipotesi del teorema precedente, se $g'(\alpha)=0$ e $g''(x)$ e' continua
>in $[a,b]$, allora il metodo iterativo ha ordine almeno 2.*

## Esercizi proposti
**Esercizio 1:** Applicare il metodo delle tangenti alla funzione: 
$$
f(x) = 
\begin{cases}
    \sqrt{x},   & x\geq 0\\
    -\sqrt{-x}, & x < 0
\end{cases}
$$
la cui radice e' $\alpha = 0$.

**Soluzione**:
Calcoliamo in primo luogo la derivata prima di $f$:
$$
f'(x) = 
\begin{cases}
    \frac{1}{2\sqrt{x}},   & x > 0\\
    \frac{1}{2\sqrt{-x}},  & x < 0
\end{cases}
$$
Costruiamo ora la successione ipotizzando che $x_0 > 0$, ottenendo
$$
x_1 = x_0 - \frac{\sqrt{x}}{\frac{1}{2\sqrt{x}}} = 
x_0 - 2x_0 = 
-x_0 (x_1<0) 
$$
Proseguiamo calcolando il secondo passo dell'iterazione
$$
x_2 = x_1 - \frac{-\sqrt{-x}}{\frac{1}{2\sqrt{-x}}} = x_1 - 2x_1 = -x_1 = x_0 (x_2>0)
$$
Si nota quindi che la successione generata risulta essere $x_0, -x_0, x_0, \dots$ e che quindi il
metodo non converge. 

**Esercizio 2**: Applicare il metodo delle tangenti alla funzione: 
$$
f(x) = 
\begin{cases}
    \sqrt{x^3},   & x \geq 0\\
    -\sqrt{-x^3}, & x < 0
\end{cases}
$$
la cui radice e' $\alpha = 0$.

**Soluzione**: Si opera analogamente all'esercizio precedente. In primo luogo si calcola la derivata
prima di $f$
$$
f(x) = 
\begin{cases}
    \sqrt{x^3},   & x\geq 0\\
    -\sqrt{-x^3}, & x < 0
\end{cases}
$$

**Esercizio 3**: Individuare un intervallo che contiene la soluzione positiva dell'equazione 
$$
e^{-x^2} = x^2
$$
Successivamente, stabilire quante iterazioni del metodo di bisezione sono necessarie per determinare
tale soluzione a meno di $10^{-3}$ a partire dall'intervallo precedentemente determinato.
 
**Soluzione**: *Da fare*

**Esercizio 4**: Applicare 3 passi del metodo di bisezione a 
$$
p(x) = x^2 - cos(x^2) \text{ con intervallo iniziale } [0,2]
$$

**Soluzione**: *Da fare*

**Esercizio 5**: Applicare 3 passi del metodo delle secanti a 
$$
(x-1)^3 = e{-x^2}
$$
utilizzando come valori iniziali $x_0=0$ e $x_1=2$

**Soluzione**: *Da fare*

**Esercizio 6**: Il metodo di Newton e' convergente per l'equazione 
$$
p(x)=x^6+x^4+5x^2-12
$$
se scegliamo $x_0=0$? E con $x_0=2$? Calcolare la terza approssimazione della successione di Newton

**Soluzione**: *Da fare*
