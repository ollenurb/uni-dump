\newpage
# Numeri di macchina
Come gia' detto in precedenza, gli algoritmi studiati dall'analisi numerica operano sistematicamente
su dati affetti da errori. In questa sezione verra' mostrato come vengono memorizzati i numeri reali
su un calcolatore e quali sono le principali fonti di errore di tali numeri. 

## Origine e causa degli errori 
Come gia' detto in precedenza, la presenza di errori e' dovuta a varie cause quali: 

* Errata modellizzazione o presenza di errori sui dati sperimentali 
* Semplificazioni introdotte dalla conversione a modello matematico in modello numerico 
* Memorizzazione dei dati in formato digitale (finito) su calcolatore 

Avere quindi un metodo per misurare un errore e' fondamentale nello studio dei problemi numerici. 
Definiamo quindi due quantita': 

>***Definizione**: Sia $\alpha$ la quantita' da stimare e $\alpha^*$ la quantita' stimata. Definiamo 
>come **errore assoluto**: 
>$$ 
>\varepsilon = \abs{\alpha - \alpha^*}
>$$
>e come **errore relativo***:
>$$
>\rho = \frac{\abs{\alpha - \alpha^*}}{\alpha} 
>$$

In altri termini meno formali, l'*errore relativo* ci da informazioni sul numero di cifre esatte in
$\alpha^{*}$ rispetto ad $\alpha$.

**Nota:** E' importante inoltre specificare che se la quantita' da stimare non e' uno scalare, ma
un elemento di uno spazio lineare da $\mathbb{R}, \text{ o } \mathbb{C}$, allora al posto del 
*valore assoluto* si utilizza una *norma vettoriale*. 

## Numeri di macchina
Diamo ora una definizione formale dei numeri macchina: 

>***Definizione**: Definiamo come **insieme dei numeri macchina** in base $\beta$, con $t$ cifre 
>significative ed esponente nell'intervallo $\left [ L,U \right ]$ l'insieme
>$$\mathbb{F}(\beta, t, L, U)= \{ 0 \} \cup \{ x \in \mathbb{R} : x=sign(x) \cdot m \cdot \beta^{p}  \}$$
>dove*
>
> * $t$ e $\beta$ sono interi positivi, con $\beta \geq 2$
> * $sign(x)=\pm 1$ a seconda del segno di $x$
> * la quantita' $m$ e' la **mantissa**
> * $p$ e' un intero compreso tra $L$ e $U$, detto esponente o caratteristica

I numeri di macchina, spesso vengono memorizzati in una forma chiamata **normalizzata** tramite un
processo di *normalizzazione*. Cioe' consiste nell'evitare di memorizzare gli zeri che eventualmente
precedono delle cifre significative in modo da sfruttare meglio lo spazio di memorizzazione e
rendere la rappresentazione univoca.

**Esempio**: Sia $\beta=10$
$$
\begin{aligned}
123000 &\rightarrow 0.123 \cdot 10^6  \\
0.00000123 &\rightarrow 0.123 \cdot 10^{-5}
\end{aligned}
$$

L'insieme di *numeri di macchina* $\mathbb{F}$ e' un sottoinsieme proprio di $\mathbb{R}$ poiche'
essendo   

$$
\begin{aligned}
fl: & \mathbb{R} \rightarrow \mathbb{F} \\
    & x \rightarrow fl(x)
\end{aligned}
$$
Che associa ad un qualsiasi numero real il suo corrispondente in $\mathbb{F}$
 
Dato un qualsiasi $x \in \mathbb{R}$, ci possono essere 3 casi possibili:

* $x \in \mathbb{F}$, il che significa che $fl(x) = x$
* $|x| < \beta^{L-1}$, il che significa che $p$ e' minore del suo limite inferiore $L$
  (**underflow**)
* $|x| \geq \beta^{U}$, $p  U$, si verifica un **overflow**
* $|x| \in [ \beta^{L-1} , \beta^{U} )$ ma $x \notin \mathbb{F}$, cioe' il numero di cifre
  significative di $x$ e' superiore a $t$. In questo caso si puo' decidere se **troncare** il valore
  oppure **arrotondarlo**.

Il **troncamento** e' un'operazione che elimina le cifre in eccesso trascurandole.  Il problema di
questo approccio e' che gli errori sono tutti positivi, il che, se si effettuasse una somma degli
errori, questi si sommerebbero tra loro, mentre se il segno potesse variare questi errori potrebbero
cancellarsi con molta probabilita'.

L'**Arrotondamento**, invece, consiste nell'arrotondare alla cifra decimale piu' vicina. Genera un
errore assoluto dimezzato rispetto all'operazione di troncamento. Inoltre gode del beneficio che gli
errori possono cambiare segno riducendo l'accumulo di errore nella somma.

**Arrotondamento unitario *(unit roundoff)***: Quantita' che maggiora l'errore relativo di arrotondamento.
Equivale a $u = \frac{1}{2} \beta^{1-t}$

**Precisione di macchina *(machine epsilon)* **: Quantita' che indica la distanza tra 1 e il successivo
numero di macchina. Equivale a: $\varepsilon_M = 2u = \beta^{1-t}$, il che equivale alla seguente
definizione:
$$
\epsilon_M := min  \varepsilon \in \mathbb{R} : trunc(1 + \varepsilon) > 1 
$$

## Standard IEEE754
Lo standard IEEE754 e' uno standard per la rappresentazione dei numeri in virgola mobile su
calcolatore. Lo standard definisce due tipi di precisione: 

* **Precisione Singola**: $\mathbb{F}(2,24,-126,128)$
* **Doppia Precisione**: $\mathbb{F}(2,53,-1022,1024)$

+------------+-------+-----------+------------+--------+----------------------+
| Precisione | Segno | Esponente |  Mantissa  | Totali |         Range        |
+:==========:+:=====:+:=========:+:==========:+:======:+:====================:+
| Singola    | 1 bit | 8 bit     | 23(+1) bit | 32 bit |  $10^{-35}-10^{38}$  |
+------------+-------+-----------+------------+--------+----------------------+
| Doppia     | 1 bit |   11 bit  | 52(+1) bit | 64 bit | $10^{-324}-10^{308}$ |
+------------+-------+-----------+------------+--------+----------------------+
: Comparazione schematica tra precisione singola e doppia 

L'utilizzo delle variabili in singola precisione piuttosto che quelle in doppia precisione e'
irrilevante in termini di prestazioni poiche' i calcolatori moderni prima di fare il calcolo
trasformano la variabile automaticamente in doppia precisione. L'unico vantaggio e' che possono
essere pero' predilette in applicazioni per cui si ha un limitato spazio di memoria. 

### Propagazione 
In luogo delle normali operazioni aritmetiche un calcolatore utilizza le cosiddette
operazioni di macchina.  In generale, data una operazione di macchina $\oplus$ vale la seguente
ipotesi: $$ x \oplus y = fl(x \oplus y) = (x + y)(1 + \varepsilon), | \varepsilon | < u. x,y \in
\mathbb{F} $$ Secondo questa ipotesi, l'errore relativo dell'operazione di somma, puo' essere
calcolato come:

$$ \varepsilon_{x+y} = \frac{ | (x + y) - fl(x + y) | }{|x + y|} = \frac{|- \varepsilon_{x} x -
\varepsilon_{y} y |}{x + y} = \frac{|x|}{|x + y|} | \varepsilon_y | + \frac{|y|}{|x + y|} |
\varepsilon_{y} | $$

Si nota che quando $x+y \rightarrow 0$ l'errore cresce tendendo a $\infty$. La somma puo' diventare
quindi **un'operazione pericolosa**.  Il numero di condizionamento $K$ dell'operazione somma diventa
quindi molto grande quando sommo due numeri all'*incirca uguali in modulo ma con segno discorde* ($x
\sim -y$).  Quando $x \sim -y$ si dice che si ha una **cancellazione numerica**.

La *moltiplicazione*, invece, non fa crescere in modo incontrollato l'errore poiche' ha
coeffieciente $K = 1$
