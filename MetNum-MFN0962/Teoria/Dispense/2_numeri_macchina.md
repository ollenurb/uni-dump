# Numeri di macchina
>**Definizione**:
>Definiamo come **insieme dei numeri macchina** in base $\beta$, con $t$ cifre significative ed esponente
>nell'intervallo $\left [ L,U \right ]$ l'insieme
>$$\mathbb{F}(\beta, t, L, U)= \{ 0 \} \cup \{ x \in \mathbb{R} : x=sign(x) \cdot m \cdot \beta^{p}  \} $$
>dove
>
> * $t$ e $\beta$ sono interi positivi, con $\beta \geq 2$
> * $sign(x)=\pm 1$ a seconda del segno di $x$
> * la quantita' $m$ e' la **mantissa**
> * $p$ e' un intero compreso tra $L$ e $U$, detto esponente o caratteristica

## Normalizzazione
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
discreto e finito non puo' contenere tutti i numeri reali.

La funzione:
$$
\begin{aligned}
fl: & \mathbb{R} \rightarrow \mathbb{F} \\
    & x \rightarrow fl(x)
\end{aligned}
$$

Dato un qualsiasi $x \in \mathbb{R}$, ci possono essere 3 casi possibili:

* $x \in \mathbb{F}$, il che significa che $fl(x) = x$  
* $|x| < \beta^{L-1}$, il che significa che $p$ e' minore del suo limite inferiore $L$, si genera 
quindi un **underflow**
* $|x| \geq \beta^{U}$, $p  U$, si verifica un **overflow**
* $|x| \in [ \beta^{L-1} , \beta^{U} )$ ma $x \notin \mathbb{F}$, cioe' il numero di cifre significative di
$x$ e' superiore a $t$. In questo caso si puo' decidere se **troncare** il valore oppure **arrotondarlo**.

**Troncamento**: Operazione che elimina le cifre in eccesso tramite un troncamento.
Il problema di questo approccio e' che gli errori sono tutti positivi, il che, se si effettuasse una somma
degli errori, questi si sommerebbero tra loro, mentre se il segno potesse variare questi errori potrebbero
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
\epsilon_M := min  \varepsilon \in \mathbb{R} : trunc(1 + \varepsilon) > 1 
$$

## Standard IEEE754
* **Precisione Singola**: $\mathbb{F}(2,24,-126,128)$
* **Doppia Precisione**: $\mathbb{F}(2,53,-1022,1024)$

### Propagazione
In luogo delle normali operazioni aritmetiche un calcolatore utilizza le cosiddette operazioni di macchina.
In generale, data una operazione di macchina $\oplus$ vale la seguente ipotesi:
$$
x \oplus y = fl(x \oplus y) = (x + y)(1 + \varepsilon), | \varepsilon | < u. x,y \in \mathbb{F}
$$
Secondo questa ipotesi, l'errore relativo dell'operazione di somma, puo' essere calcolato come:

$$
\varepsilon_{x+y} =
\frac{ | (x + y) - fl(x + y) | }{|x + y|} =
\frac{|- \varepsilon_{x} x - \varepsilon_{y} y |}{x + y} =
\frac{|x|}{|x + y|} | \varepsilon_y | + \frac{|y|}{|x + y|} | \varepsilon_{y} |
$$

Si nota che quando $x+y \rightarrow 0$ l'errore cresce tendendo a $\infty$. La somma puo' diventare quindi
una operazione pericolosa.
Il numero di condizionamento $K$ dell'operazione somma diventa quindi molto grande quando sommo due numeri
all'*incirca uguali in modulo ma con segno differente* ($x \sim -y$).
Quando $x \sim -y$ si dice che si ha una *cancellazione numerica*.

Come visto in precedenza, invece, la *moltiplicazione* non fa crescere in modo incontrollato, con
coeffieciente $K = 1$
