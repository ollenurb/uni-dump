% Equazioni non lineari 
# Equazioni non lineari

Sono tutte quelle funzioni la cui equazione non e' nella forma  $f(x) = ax + b$.
In generale, per trovare la soluzione di queste equazioni si ricorre ad un algoritmo numerico iterativo per l'approssimazione 
numerica della soluione. (Di fatto anche le calcolatrici ricorrono a tale metodo per il calcolo di alcune funzioni)
Un problema di equazione non lineare e' rappresentato come: 
$$
f(x) = 0
$$
Risolvere questo problema significa trovare gli zeri della funzione $f$. 

**Algoritmo iterativo**: Algoritmo che, a partire da un punto iniziale $x_0$, fornisce una regola per costruire una successione 
$\{x_{1}, x_{2}, ..., x_{k}, ...\}$ che converge ad una radice $\alpha$ tale che $f(\alpha) = 0$

**Errore al passo $k$**: Avviene in corrispondenza di un'approssimazione al passo $k$, definito come $e_k = x_k - \alpha$

**Convergenza**: Un algoritmo e' convergente quando $\lim_{k \rightarrow \infty} |e_{k}| = 0$

#### Definizione 
>Un metodo iterativo convergente **ha ordine** $p$ se esiste una costante finita $C$ tale che 
>$$
>\lim_{k \rightarrow \infty} \frac{|e_{k+1}|}{|e_{k}|^p} = C
>$$

Intuitivamente, maggiore e' l'ordine $p$, maggiore e' la riduzione dell'errore che si verifica ad ogni passo, per cui 
e' minore il numero di iterazioni totali necessarie per raggiungere la precisione richiesta.
In sostanza, indica la velocita' con cui il metodo si avvicina alla soluzione. (Allo stesso modo, indica anche quanto velocemente 
l'errore si avvicina allo $0$) 

**Costante asintotica dell'errore**: $C$ 

* Quando ordine $p=1$ allora $C \leq 1$
* Nessuna limitazione quando $p \gt 1$
* Si dice metodo **superlineare** quando $p = 1$ e $C = 0$

#### Teorema (Serie di Taylor)
>Sia $f \in C^{(n+1) [a,b]}$. Allora $\forall x_0 \in [a,b]$ e per ogni intero $n$ esiste un polinomio 
>$t_n$ di grado $n$ (detto **polinomio di Taylor**) tale che: 
>$$
>f(x) = t_n(x) + R_{n+1}(x), x \in [a,b]
>$$
>Il polinomio $t_n$ e' dato da: 
>$$
>t_n(x) = \sum_{k=0}^{n} \frac{f^{(k)}(x_0)}{k!} (x - x_0)^k
>$$
>e il resto e' definito come: 
>$$
>R_{n+1}(x) = \frac{f^{n+1} (\xi) }{(n+1)!}(x - x_0)^{n+1}
>$$
>per un certo $\xi$ (dipendente da $x$) apparenente all'intervallo $I_{(x_0, x)} di estremi $x_0$ e $x$. 


#### Definizione
>$\alpha$ e' **radice semplice di un'equazione** se si puo' scrivere 
>$$
>f(x) = (x-\alpha)h(x), \text{ con } h(\alpha) \neq 0 
>$$
>$\alpha$ e' invece **radice multipla di un'equazione** con molteplicita' $m \geq 2$ se
>$$
>f(x) = (x-\alpha)^{m}h(x), \text{ con } h(\alpha) \neq 0 
>$$


Per determinare la molteplicita' di una radice si puo' usare il seguente

#### Teorema 
>Una radice $\alpha$ ha molteplicita' $m$ se e solo se
>$$
>\begin{aligned}
>f^{(k)}(\alpha) & = 0, k = 0,1,...,m-1 \\
>f^{(m)}(\alpha) & \neq 0
>\end{aligned}
>$$

**Richiamo ad analisi**: Quando una derivata prima tende tende ad essere tangente all'asse delle $x$ 
significa che si e' in prossimita' di un **minimo** oppure **massimo** relativo della funzione.
Il fatto che ci siano piu' massimi e mnimi indica la presenza di piu' radici. 

### Metodo di bisezione 
Considerata una funzione $f(x)$, continua e contenente un solo zero nell'intervallo $[a,b]$: 
$c=\frac{a+b}{2}$ e' il *punto medio* dell'intervallo. 
Allora si possono verificare le seguenti condizioni: 

1. $f(c) = f(\alpha) = 0$ 
2. $\alpha \in [a, c]$
3. $\alpha \in [c, b]$

Nel primo caso ci si ferma perche' la soluzione e' stata trovata, mentre per determinare se ci si stia 
trovando nel caso 2 oppure nel caso 3 basta analizzare in quale intervallo la funzione cambia segno 
calcolando $f(a) \cdot f(c)$

* Se negativo, allora $\alpha \in [a, c]$
* Se positivo, allora $\alpha \in [c, b]$

Il metodo prevede poi di reiterare il procedimento ponendo come nuovo intervallo quello in cui si trova 
$\alpha$. 

Siano quindi:  

* $k$ numero dell'iterazione 
* $x_k$ = soluzione del passo $k$, per definizione e' $x_k = \frac{a_k + b_k}{2}$

E' possibile calcolare il numero di iterazioni $k$ necessarie per ottenere un **errore inferiore** a 
$\varepsilon$: 
$$
| x_k -\alpha | \leq \frac{b-a}{2^k} \leq \varepsilon \rightarrow  
k \geq log_2(b-a) + log_2 \varepsilon^{-1}
$$

Siccome l'errore si dimezza ad ogni iterazione $k$, il metodo ha ordine $p=1$ e costante 
asintotica $C=\frac{1}{2}$

#### Metodo di Newton 
Considerata una funzione $f(x)$, continua e contenente un solo zero nell'intervallo $[a,b]$: 
Dato un punto con ascissa $x_0$, l'approssimazione di $\alpha$ al passo successivo $x_1$ e' data 
dalll'ascissa del punto d'intersezione tra la tangente al punto $x_0$ e l'asse $x$. 
Genericamente, possiamo formalizzare il generico passo come: 
$$
x_{k+1} = x_k - \frac{f(x_k)}{f'(x_k)}
$$

**Nota**: $f'$ deve essere sempre $\neq 0$, ma questo accade per le ipotesi iniziale, poiche' in caso 
contrario, $f$ corrisponderebbe ad una funzione orizzontale che non ha intersezioni con l'asse delle 
ascisse. 

**Errore al passo $k$**: 
$$
|e_{k+1}| \leq \frac{1}{M} |M e_0|^{2k+1} 
$$

**Convergenza del metodo:** Il metodo converge se
$$
x_0 \in (\alpha - \frac{1}{M}; \alpha + \frac{1}{M})
$$
Cioe' se il punto iniziale $x_0$ e' scelto sufficientemente vicino alla soluzione $\alpha$. 
$M$ e' scelto in relazione a $f''$

**Velocita' di convergenza**: Se il metodo converge, allora converge con velocita' $C$ pari a 
$$
\lim_{k \rightarrow \infty} \frac{|e_{k+1}|}{|e_k|^2} = \frac{1}{2} \frac{|f''(\alpha)|}{|f'(\alpha)|}
$$

>Nota: Dalla formula emerge anche che $p = 2$. Il limite converge *ssse* $\alpha$ e' una radice semplice. 
In corrispondenza di radici multiple, la velocita' di convergenza $C=\frac{1}{2}$, quindi $p=1$. 

**Condizione di arresto**: Data una tolleranza $\tau$ e un numero massimo di iterazioni $N$, la condizione
d'arresto e' definita come
$$
|x_k - x_{k-1}| \lt \tau|x_k| \text{ or } f(x_k) = 0 \text{ or } k \gt N.
$$


#### Metodo delle corde
Alternativamente al metodo di Netwon che considera tutte le rette con coefficiente angolare calcolato 
tramite derivata, il metodo delle corde considera un altro fattore come coefficiente angolare: un valore
costante $m_k$. 

In questo modo, al posto di avere una fascio di rette tangenti, si ottiene un fascio di rette secanti, 
tutte con lo stesso coefficiente angolare. Questo coefficiente angolare sara' uguale al coefficiente angolare
della prima tangente del punto considerato. ($m=f'(x_0)$$

#### Metodo delle secanti 
Il ragionamento e' analogo a quello del metodo delle corde, ma si utilizza un coefficiente angolare *m* 
differente, definito come
$$
m_k \frac{f(x_k) - f(x_{k-1})}{x_k - x_{k-1}}
$$

In altri termini, si trova la retta con coefficiente angolare tale che sia secante (passante) per due punti dati. 
Contrariamente agli altri metodi, questo metodo necessita di due punti iniziali anziche' uno. 

Il criterio per la generazione dei punti e': 
$$
x_{k+1} = \frac{x_{k-1} f(x_k) - x_k f(x_{k-1}) } {f(x_k) - f(x_{k-1})}
$$

Questo metodo e' vantaggioso poiche' approssima molto bene il metodo delle tangenti (man mano che l'intervallo 
si rimpicciolisce, i due punti tenderanno a esser molto vicini, rendendo le rette quasi delle tangenti), ma senza 
dovercomputare delle derivate prime in modo diretto. 

**Ordine di convergenza**: Si dimostra che e' pari a $p = \frac{1 + \sqrt{5}} {2} \approx 1.618$

### Metodi di punto fisso
I metodi di punto fisso consistono nel portare le funzioni in forma canonica $f(x) = 0$ nella forma $x=g(x)$.

In questo caso il problema si sposta dal trovate un $\alpha$ tale che $f(\alpha) = 0$ ma di trovare invece
un valore $\alpha$ tale che $\alpha=g(\alpha)$. ($\alpha$ e' detto **punto fisso** di $g(x)$)

Per ottenere questa forma, si pone inizialmente che $x=g(x)$ e un'approssimazione inziale $x_0$ e si procede
per costruzione di una successione tramite una regola del tipo
$$
x_{k+1} = g(x_k)
$$

La nozione di convergenza di un metodo iterativo di punto fisso e' connessa al concetto di **contrattivita'**
La contrattivita' esprime la capacita' di una funzione $g$ di avvicinare tra loro due punti, e si capisce
come questa nozione possa essere collegata a quella di convergenza. 

#### Definizione
>Una funzione $f(x)$ e' contrattiva nell'intervallo $I \subset \mathbb{R}$ se esiste una costante $C \in ]0,1[$
>tale che
>$$
>| g(x) - g(y) | \leq C | x - y |, \text{  } \forall x,y \in I
>$$


Una funzione contrattiva e' anche continua, ma non e' necessariamente derivabile. Nel caso in cui sia derivabile
risulta che 
$$
C=max_{x \in I} |g'(x)|
$$
La condizione di contrattivita' per una funzione derivabile risulta quindi essere
$$
|g'(x)| \lt 1 \text{ in } I
$$
In caso non si verificasse questa condizione, il metodo puo' **NON CONVERGERE** alla soluzione $\alpha$.
Piu' $|g'(x)| \rightarrow 0$ piu' e' veloce la convergenza alla soluzione. 

#### Teorema
>Sia $f: [a,b] \rightarrow [a,b]$ una funzione di classe $C^1 [a,b]$ con 
>$$ 
>|g'(x)| \leq C \lt 1, \forall x \in [a,b]
>$$
>e si consideri il metodo iterativo $x_{k+1} = g(x_k)$ con punto iniziale $x_0 \in [a,b]$
>Allora:
>
>* La successione degli $x_k$ converge ad un limite $\alpha$ per $k \rightarrow \infty$ 
>* $\alpha \in [a,b]$
>* $\alpha$ e' l'unico punto fisso di $g$
>* La convergenza e' almeno lineare e $\frac{x_{k+1} - \alpha}{x_{k} - \alpha} \rightarrow g'(\alpha)$

### Esercizi
#### Esercizio 1
Applicare il metodo delle tangenti alla funzione: 
$$
f(x) = 
\begin{cases}
    \sqrt{x},   & x\geq 0\\
    -\sqrt{-x}, & x < 0
\end{cases}
$$
la cui radice e' $\alpha = 0$.

#### Soluzione
**Da fare**
**Hint: Costruisci la successione $x_k$**

#### Esercizio 2
Applicare il metodo delle tangenti alla funzione: 
$$
f(x) = 
\begin{cases}
    \sqrt{x^3},   & x\geq 0\\
    -\sqrt{-x^3}, & x < 0
\end{cases}
$$
la cui radice e' $\alpha = 0$.

#### Soluzione
**Da fare**


#### Esercizio 3 
Individuare un intervallo che contiene la soluzione positiva dell'equazione 
$$
e^{-x^2} = x^2
$$
Successivamente, stabilire quante iterazioni del metodo di bisezione sono necessarie per determinare tale
soluzione a meno di $10^{-3}$ a partire dall'intervallo precedentemente determinato.
 
#### Soluzione 
**Da fare**

#### Esercizio 4 
Applicare 3 passi del metodo di bisezione a 
$$
p(x) = x^2 - cos(x^2) \text{ con intervallo iniziale } [0,2]
$$

#### Soluzione 
**Da fare**

#### Esercizio 5 
Applicare 3 passi del metodo delle secanti a 
$$
(x-1)^3 = e{-x^2}
$$
utilizzando come valori iniziali $x_0=0$ e $x_1=2$

#### Soluzione
**Da fare**

#### Esercizio 6
Il metodo di Newton e' convergente per l'equazione 
$$
p(x)=x^6+x^4+5x^2-12
$$
se scegliamo $x_0=0$? E con $x_0=2$? Calcolare la terza approssimazione della successione di Newton

#### Soluzione
**Da fare**
