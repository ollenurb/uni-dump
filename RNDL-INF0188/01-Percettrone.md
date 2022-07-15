---
title: Il Percettrone
header-includes: |
 \usepackage{tikz}
---

* Partiamo con il trattare il primo tipo di rete: il percettrone
* Fu introdotto dallo psicologo Frank Rosenblatt nel 1958
* E' un modello di rete molto semplice, in grado di classificare solo problemi
  linearmente separabili
* Il percettrone e' basato sul concetto di neurone artificiale esposto
  precedentemente (*McCulloch-Pitts model*)
* *Induced local field* = somma degli input moltiplicati per i pesi
* Dal punto di vista architetturale, il percettrone e' una rete a singolo layer,
  cioe' e' costituita da un solo layer di output
* Noi tratteremo il caso in cui questo layer sia composto da un solo neurone, ma
  la teoria e' facilmente estendibile a casi con piu' di un neurone.
* Il percettrone ha la caratteristica principale di avere la seguente funzione
  di attivazione (o *hard llimiter*):
  $$
  \phi(x) =
  \begin{cases}
    1 &  if \;  x > 0\\
    -1 &  otherwise 
  \end{cases}
  $$
* Dal momento che sappiamo il funzionamento del singollo neurone, se conosciamo
  i pesi di ogni input possiamo calcolare molto facilmente l'output di un
  percettrone dato l'insieme di input
* Data una certa configurazione di pesi, l'output sara'
    * $1$ se $w_1 x_1 + w_2 x_2 + \dots + w_p x_p + \underbrace{w_0}_{bias} > 0$
    * $-1$ altrimenti ($\leq 0$)
* Come detto, il percettrone risolve problemi linearmente separabili
* E' evidente come dato un insieme di input, un singolo neurone vada ad
  assegnare a tale insieme una classe: positiva ($1$) o negativa ($-1$)
    * Se noi prendiamo per esempio il caso bidimensionale, possiamo calcolare il
      suo output come $w_1 x_1 + w_2 x_2 + w_0$
    * Se noi la poniamo a 0, tale equazione ci da l'equazione della retta del
      *decision boundary* del percettrone: $x_2 = -(w_1 x_1 + w_0) / w_2$
* Si noti come l'aumentare del numero di input, aumenti di conseguenza il numero
  di dimensioni in cui l'iperpiano va ad agire come decision boundary
* Da questo punto di vista, il bias non e' nient'altro che la distanza del
  decision boundary dall'origine

## Algoritmo di apprendimento 

* Per stabilire il valore dei *pesi* di un percettrone, bisogna costruire un
  *algoritmo di apprendimento*
* Il setting e' di apprendimeno supervisionato, per cui l'algoritmo sara' basato
  sulla *correzione dell'errore* per ogni esempio non classificato correttamente
* Denotiamo con
    * $\mathbf{x}(n) = [+1, x_1(n), \dots, x_m(n)]^T$ l'insieme di input al passo $n$
    * $\mathbf{w}(n) = [b, w_1(n), \dots, w_m(n)]^T$ l'insieme di pesi al passo $n$
    * $v(n) = \sum^m_{i=0} w_i(n) x_i(n)$ la funzione di attivazione al passo
      $n$, che corrisponde a $\mathbf{w}^T(n) \mathbf{x}(n)$
* Siccome le istanze di train sono rappresentate con $m$ features
  (corrispondenti al numero di input), possiamo indicare con
    * $\mathscr{X}_1$ l'insieme dei vettori (istanze) con classe positiva
    * $\mathscr{X}_2$ l'insieme dei vettori (istanze) con classe negativa 

> Il processo di apprendimento richiede la regolazione del vettore dei pesi
> $\mathbf{w}$ in modo che **SE** le due classi sono linearmente separabili,
> **ALLORA** esiste un vettore $\mathbf{w}$ di pesi tale per cui
>
>   * $\forall \mathbf{x} \in \mathscr{X_1}, \mathbf{w}^T \mathbf{x} > 0$
>   * $\forall \mathbf{x} \in \mathscr{X_2}, \mathbf{w}^T \mathbf{x} \leq 0$ 

* Il problema dell'apprendimento non e' nient'altro che trovare questo vettore
  $\mathbf{w}$ che soddisfi le due condizioni contemporaneamente
* Possiamo quindi formulare l'algoritmo nel modo seguente:
    1. Se l'esempio viene classificato correttamente, allora non modificare il
       peso
    2. In caso contrario, il peso del percettrone viene aggiornato sottraendo o
       aggiungendo il *learning rate* moltiplicato per gli input
* Riformulato formalmente:
    1. $\mathbf{w}(n + 1) = \mathbf{w}(n)$ se $\mathbf{w}^T \mathbf{x} > 0$ e
       $\mathbf{x} \in \mathscr{X_1}$ oppure $\mathbf{w}^T \mathbf{x} \leq 0$ e
       $\mathbf{x} \in \mathscr{X_2}$ (*se l'esempio e' classificato
       correttamente*)
    2. $\mathbf{w}(n + 1) = \mathbf{w}(n) - \eta(n) \mathbf{x}(n)$ se
       $\mathbf{w}^T \mathbf{x} > 0$ e $\mathbf{x} \in \mathscr{X_2}$
       (*se l'esempio viene classificato **positivo** ma e' **negativo***)  
       $\mathbf{w}(n + 1) = \mathbf{w}(n) + \eta(n) \mathbf{x}(n)$ se
       $\mathbf{w}^T \mathbf{x} \leq 0$ e $\mathbf{x} \in \mathscr{X_1}$ (*se
       l'esempio viene classificato **negativo** ma e' **positivo***)  
* Il *learning rate parameter* $\eta(n)$ controlla gli aggiustamenti che vengono
  fatti ad ogni missclassificazione
  * Se e' costante ad ogni iterazione ed e' $>0$, allora parliamo di
    *fixed-increment adaptation rule*
* Sulla base di queste osservazioni possiamo formulare il vero e proprio
  algoritmo:
  1. Inizializza $\mathbf{w}(0)$ con valori casuali
  2. Finquando ci sono esempi non classificati correttamente:
  3. Prendi un esempio $\mathbf{x}$ da quelli non classificati correttamente
  4. Applica l'update rule (*punto 2.*)

### Convergenza

* E' possibile provare la convergenza dell'algoritmo precedente, cioe' la sua
  terminazione in caso le classi siano linearmente separabili
* Supponiamo di rappresentare nel piano il vettore peso dell'*n-esima*
  iterazione $\mathbf{w}(n)$ e il vettore stimolo $\mathbf{x}(n)$
* Se il prodotto tra questi due vettori e' maggiore di 0, allora il percettrone
  resituera' 1 come output, contrariamente restituera' -1
* Geometricamente, il prodotto $\mathbf{w}(n) \cdot \mathbf{x}(n) = \|
  \mathbf{x}(n) \|\| \mathbf{x}(n) \| \cos(\Theta)$, per cui possiamo dire che
  sara' $>0$ se $-90 < \Theta < 90$
* Il decision boundary ($=0$) sara' pari all'angolo $\Theta = 90$ e $270$  
* Ogni volta che c'e' un mismatch, il vettore $\mathbf{w}$ viene spostato verso
  una direzione differente, spostando di conseguenza anche il decision boundary

> **Teorema** (*Convergenza del Percettrone*): Date le due classi $C_1$ e $C_2$,
> se esse sono *linearmente separabili* allora l'algoritmo di apprendimento
> termina in un *numero finito* di iterazioni

#### Dimostrazione

* Supponiamo che $C_1$ sia la classe positiva e $C_2$ sia negativa  
* Sia $C = C_1 \cup \overline{C_2}$, in cui $\overline{C_2} = \{-x \; | \; x
  \in C_2\}$
* Vogliamo quindi ottenere un percettrone che assegni sempre 1 a tutte le
  istanze di $C$
* Sia $\mathbf{x}(0), \dots, \mathbf{x}(k) \in C$ la sequenza di istanze che sono state
  utilizzate per *correggere* il vettore di pesi fino alla *k-esima*
  iterazione
* Dall'algoritmo, la regola per la correzione e' una somma, per cui per la
  generica iterazione vale $\mathbf{w}(k+1) = \mathbf{w}(k) + \mathbf{x}(k)$
* Secondo questa ipotesi vale $\mathbf{w}(k+1) = \mathbf{x}(0) + \dots +
  \mathbf{x}(k)$ (*unwinding della funzione ricorsiva*)
* La dimostrazione a questo punto si basa sullo studio di come si evolve la
  norma del vettore dei pesi.

> Alla prof basta che la dimostrazione del teorema deriva da delle
> considerazioni su come evolve il valore della norma del vettore pesi al
> crescere delle iterazioni. 

* (Da qui in poi e' opzionale)
* Possiamo stabilire due limiti: Uno inferriore e uno superiore

##### Limite Inferiore (*)

* Per ipotesi (*separabilita' lineare*) deve esistere per forza un \mathbf{w^*}
  tale per cui ogni esempio $\mathbb{x} \in C$ viene classificato correttamente
  (cioe' valore $>0$)
* Allora possiamo moltiplicare questo vettore per ambo i membri della relazione
  trovata in precedenza
  $$
  \mathbb{w}^{*T}\mathbb{w}(k+1) =\mathbb{w}^{*T} \mathbb{x}(1) + \dots + \mathbb{w}^{*T}
  \mathbb{x}(k)
  $$
* (Ho gia' moltiplicato ogni membro per la somma nella parte dx)
* Sia $\alpha = \min \{ \mathbb{w}^{*T}\mathbb{x}(0), \dots, \mathbb{w}^{*T}
  \mathbb{x}(k) \}$ 
* Allora possiamo dire che vale la seguente relazione
  $$
  \mathbb{w}^{*T}\mathbb{w}(k+1) =\mathbb{w}^{*T} \mathbb{x}(1) + \dots + \mathbb{w}^{*T}
  \mathbb{x}(k) \geq \alpha k
  $$
* Per la diseguaglianza di *Cauchy' Schwartz* e qualche ri-arrangiamento
  algebrico elementare otteniamo:
  $$
  \| \mathbf{w}(k+1) \|^2 \geq \frac{k^2 \alpha^2}{\|\mathbb{w}^*\|}
  $$
* Abbiamo quindi dimostrato che $\alpha$ e' in qualche modo un *lower bound* di
  $\mathbb{w}(k+1)$, cioe' che la magnitudine del vettore $\mathbb{w}(k+1)$
  cresce almento tanto velocemente quanto $\alpha$. $_\blacksquare$

##### Limite Superiore (*)

* Inoltre, si dimostra che
$$
\| \mathbb{w}(k+1) \|^2 \leq k\beta
$$
* Dove $\beta = \max \|\mathbb{x}(i)\|^2$ 
* Cioe' che $\mathbb{w}(k+1)$ non cresce mai piu' velocemente di $k\beta$
  $_\blacksquare$
    
---

* A questo punto ci troviamo con una coesistenza di questi due limiti, per cui
  possono essere compatibili se e solo se
  $$
  \frac{k^2 \alpha^2}{\| \mathbb{w}^* \|^2} \leq k \beta
  $$
  cioe' quando
  $$
  k \leq \frac{\beta\| \mathbb{w}^* \|^2}{\alpha^2}
  $$
* Questo dice che $k$ deve essere un valore finito, per cui e' dimostrato.
  $_\blacksquare$
