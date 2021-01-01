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
