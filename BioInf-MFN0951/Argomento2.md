# Algoritmi di Pattern Matching

## Pattern Matching

* Stringa: Lista di caratteri contigui, l'$i$-esimo carattere si indica con $S(i)$
* Sottostringa: $S[i..j]$ - Lista dei caratteri contigui che vanno dalla posizione $i$ di $S$ alla
  posizione $j$
* Stringa vuota: $S[i..j]$ con $i>j$
* Prefisso: Sottostringa che inizia dal primo carattere di $S$
* Suffisso: Stottostring che inizia da un generico indice e termina nell'ultimo carattere di $S$
* Prefissi e suffissi si dicono propri (e viceversa non propri) quando la stringa vuota non e'
  considerata prefisso o suffisso
* Quando due caratteri sono uguali si dice che c'e' un *match*, altrimenti si dice *mismatch*
* Una sottosequenza e' un sottoinsieme dei caratteri della stringa NON contigui. Una sottostringa e'
  una sottosequenza, ma una sottosequenza non e' una sottostringa.

>**Definizione (Pattern Matching)** 
>Data una string $P$ chiamata *pattern* e una stringa piu' lunga
>$T$, trovare tuttre le occorrenze del pattern $P$ nel testo $T$. 

* Una soluzione naif a questo problema potrebbe essere quella di prendere i caratteri di $P$ con $T$
  e confrontarli da sinistra a destra, usando $P$ come *"stencil"* e confrontandone carattere per
  carattere. Successivamente si sposta a destra di un carattere rispetto a $T$ e il confronto
  ricomincia. 
* Sia $|P|=n$ e $|T|=m$, la complessita' dell'algoritmo e' $O(nm)$.
* E' possibile migliorare la tecnica andando a spostare $P$ di piu' di un carattere quando si
  presenta un mismatch, oppure riducendo i confronti saltando alcune parti del pattern dopo lo
  shift.
* Molti algoritmi di pattern matching funzionano in 2 fasi
    - Fase di preprocessing: estraggono delle informazioni sulla struttura del pattern e del testo
    - Fase di ricerca: utilizzano l'informazione ottenuta dalla prima fase per effettuare la ricerca 

* Per poter prima introdurre algoritmi di preprocessing o di pattern matching, e' necessario prima
  introdurre alcuni concetti e notazione specifica. 
* Con $Z_i(S)$ si indica la lunghezza della sottostringa piu' lunga di $S$ che inizia nella
  posizione $i$ e matcha un prefisso di $S$
    - es. $S = a\; a\; b\; c\; a\; a\; b\; x\; a\; a\;$
    - $Z_5(S)=3$, $Z_6(S) = 1$, $Z_9(S) = 2$
* ZBox: intervallo che inizia in $i$ e termina in $i + Z_i - 1$ 
* $r_i$ indica il valore massimo di $j + Z_j - 1$ per tutti i $1 < j <= i$ tali che $Z_j > 0$
* $l_i$ indica l'indice iniziale dello ZBox che termina in $r_i$
* Il tempo richiesto per calcolare tutti gli $Z_i$ e' $O(|S|^2)$
* Esiste pero' un algoritmo che sfrutta le iterazioni precedente che ha complessita' $O(|S|)$,
  chiamato Z-Algoritm
* Per poter capire come funziona a linee generali, facciamo un esempio e supponiamo che $k=121$,
  $r_{120}=130$, $l_{120}=100$. Si vuole calcolare $Z_{121}$.
 
![Raffigurazione schematica della situazione descritta
nell'esempio\label{figExample1}](img/2.1_zalg_example.png){ width=50% }

* Come si vede nella figura \ref{figExample1}, per la definizione di Z-Box e secondo i dati dati dal
  problema, esiste una stringa $\alpha$ di lunghezza $30$, all'inizio del testo e alla posizione
  $100$. Allora la sottostringa $\beta$ lunga $10$ che inizia nella posizione $121$, deve matchare
  la sottostringa $\beta$ lunga $10$ che inizia nella posizione $22$ di *S*, percio' $Z_{22}$ puo'
  essere utile per calcolare $Z_{121}$. Se $Z_{22}$ e' per esempio $3$, allora anche $Z_{121}$ sara'
  $3$.
 
## Z-Algorithm

* Possiamo sfruttare questa caratteristica per sviluppare il cosiddetto *Z-Algorithm*:
    - All'inizio, $Z_2$ e' trovato confrontando carattere per carattere la sottostringa
      $S[1\dots|S|]$ con la sottostringa $S[2\dots|S|]$ fino a quando non si trova un mismatch,
      proprio come nel metodo Naive.
      $$
      \begin{aligned}
        \overbrace{\underset{\uparrow}{a}bcdefg}^{S[1\dots|S|]} \dots\\
        a\overbrace{\underset{\uparrow}{b}cdefg}^{S[2\dots|S|]} \dots 
      \end{aligned}
      $$
    - Se $Z_2>0$, $r=Z_2+1$ e $l=2$, altrimenti $r=l=0$ (*non esiste una Z-Box*)
    - Procediamo induttivamente a calcolare i restanti $Z$. Dati gli $Z_i$ con $2<=i<=k-1$, $l=l_{k-1}$ e
      $r=r_{k-1}$, $Z_k$ e i  nuovi valori di $l=l_k$ e $r =r_k$ sono calcolati nel modo seguente:
        + Se $k>r$, vuol dire che la *Z-box* tra $l$ ed $r$ e' stata *"superata"*, per cui bisogna
          per forza utilizzare il metodo naive: $Z_k$ viene calcolato confrontando i caratteri dalla
          posizione $k$ con quelli che iniziano nella posizione $1$ di $S$ finche' non si trova un
          mismatch. Una volta trovato, se $Z_k>0$, aggiorna i valori $r=k+Z_k-1$ e $l=k$.
        + Altrimenti ($k \leq r$), denotiamo $Z_k'$ la *Z-Box* corrispondente al prefisso, cioe'
          $k'=l-k+1$, la situazione e' quella raffigurata in figura \ref{figZalg1}. 
 
![\label{figZalg1} Situazione in cui $k \leq r$](img/2.2_zalg_example.png){ width=50% }

Possiamo ora distinguere due casi differenti:

  - Se $Z_{k'} < \beta$, allora imposta $Z_k = Z_{k'}$ e lascia $l$ ed $r$ invariati 
  - Se $Z_{k'} \geq \beta$, allora utilizza il metodo naive a partire dalla posizione $r+1$ e
    $|\beta|+1$ fino a quando non trovi un mismatch. Posto che il mismatch avvenga in una posizione
    $q \geq r + 1$, allora setta $Z_k=q-k$, $r=q-1$ ed $l=k$ 
 
![](img/2.3_zalg_example_a.png){ width=50% }\ ![](img/2.3_zalg_example_b.png){ width=50% }
\begin{figure}[!h]
\begin{subfigure}[t]{0.6\textwidth}
\caption{Situazione in cui $Z_{k'} \geq \beta$ }
\end{subfigure}
\hfill
\begin{subfigure}[t]{0.4\textwidth}
\caption{Situazione in cui $Z_{k'} < \beta$ }
\end{subfigure}
\end{figure}

Lo *Z-Algorithm* puo' essere utilizzato per cercare un pattern nel testo andando a imporre che la
stringa $S$ sia la concatenazione di $S=P\gamma T$ dove $\gamma$ e' un carattere che non occorre ne'
in $P$ ne' in $T$.

## Algoritmo di Boyer-Moore

* Come nell'algoritmo naif, l'algoritmo di Boyer-Moore allinea successivamente $P$ con $T$ e
  verifica il match carattere per carattere, ma differisce dal metodo naive per 3 caratteristiche.
    - La scansione del pattern avviene da destra a sinistra quando si confrontano i caratteri
    - Regola di shift del "*bad character*" (e conseguentemente la regola "*bad character estesa*") 
    - Regola di shift del "*good suffix*"
* Queste idee portano a un metodo che di solito esamina meno di $m+n$ caratteri e ha complessita' in
  tempo lineare in caso peggiore, proprio come nello *Z_algorithm*.
* **Bad character shift rule:**
    * Sia $i$ il punto in cui in $P$ si presenta il mismatch, mentre gli $n-i$ caratteri precedenti
      sono uguali ai corrispondenti in $T$ (ne siamo sicuri dal momento che il confronto avviene da
      destra a sinistra)
    * Sia $T(k)$ il carattere allineato con $P(i)$ nel testo $T$ (il carattere in cui si presenta il
      mismatch nel testo).
    * Sia $R(x)$ la posizione dell'occorrenza piu' a destra del carattere $x$ in $P$ ($R(x) = 0$ se
      $x$ non occorre in $P$).
    * Allora, sposta $P$ a destra di $N$ posizioni, con $N = max\{1, i-R(T(k)) \}$. Se in $P$
      l'occorrenza piu' a destra di $T(k)$ e' in posizione $j < i$, sposta $P$ in modo che il
      carattere $j$ di $P$ sia allineato con il carattere $k$ di $T$, altrimenti sposta $P$ di una
      posizione.
* La bad character shift rule, non ha effetto se il carattere $T(k)$ con in quale si trova il
  mismatch, si trova in $P$ a destra del punto in cui e' stato trovato il mismatch (perche', come
  detto nel punto precedente, viene spostato di una sola posizione).
* **Bad character shift rule estesa:** Quando si presenta un mismatch nella posizione $i$ di $P$ e
  il carattere in $T$ e' $x$, sposta $P$ a destra in modo che il carattere $x$ a sinistra piu'
  vicino alla posizione $i$ in $P$ sia allineato con $x$ in $T$.
    * Questa regola ha bisogno di una fase di preprocessing per calcolare le posizioni delle
      occorrenze piu' vicine a $i$ a sinistra, la quale, per ogni posizione $i$ in $P$ e per
      ogni carattere $x$, calcola la posizione dell'occorrenza di $x$ piu' vicina a $i$ alla sua
      sinistra.
    * Si puo' utilizzare un array bidimensionale $n \times | \Sigma |$ per memorizzare queste
      informazioni.
    * Scandendo $P$ da destra a sinistra si possono memorizzare per ogni carattere le posizioni in
      cui occorre. Ogni lista e' in ordine decrescente, e la loro costruzione richiede sia tempo
      che spazio $O(n)$.
* **Strong Good Suffix rule**: Sia $t$ un suffisso che viene matchato sia in $P$ che in $T$ per cui
  il prossimo carattere fa mismatch. Trova allora un suffisso $t'=t$ in $P$ per cui il carattere
  successivo non e' uguale a quello che ha fatto mismatch. Trovato il suffisso $t'$, sposta $P$ a
  destra in modo che la sotto stringa $t'$ in $P$ sia allineata con la sotto stringa $t$ in $T$ 
    * In caso $t'$ non esista, allora sposta l'estremita' sinistra di $P$ della minima quantita' in
      modo che un prefisso del pattern matchi un suffisso di $t$ in $T$, se cio' e' possibile.
    * Se cio' non e' possibile, sposta $P$ di $n$ posti a destra.
    * Se si trova un'occorrenza di $P$, sposta $P$ del minimo numero di posizioni in modo che un
      prefisso proprio di $P$ matchi un suffisso dell'occorrenza di $P$ in $T$, altrimenti sposta
      $P$ di $n$ posizioni, cioe' oltre $t$ in $T$.

Esempio di Strong Suffix Rule:
\begin{center}
\begin{verbatim}
T: PRSTABSTUBABQXRST
             ||
P:   QCABDABDAB
             ||
P':        QCABDABDAB
\end{verbatim}
\end{center}
 
* Anche la good suffix rule ha bisogno di una fase di preprocessing:
  * Sia $L(i)$ la massima posizione minore di $n$ tale che la stringa $P[i \dots n]$ matcha un
    suffisso di $P[1 \dots L(i)]. L(i) = 0$ se la condizione non e' soddisfatta
  * Sia $L'(i)I$ la massima posizione minore di $n$ tale che la stringa $P[i \dots n]$ matcha un
    suffisso di $P[1 \dots L'(i)]$ e il carattere che precede il suffisso non e' uguale a $P(i-1)$.
  * Sia $L(i)$ che $L'(i)$ possono essere calcolati in tempo lineare sulla lunghezza del pattern:
      * Sia $N_j(P)$ la lunghezza del piu' lungo *suffisso* della sotto stringa $P[1..j]$ (e'
        l'inverso di $Z_i$ in sostanza)
      * Dal momento che $N$ e' l'inverso di $Z$ (cioe' vale $N_j(P) = Z_{n-j+1}(P^R)$) possiamo
        utilizzare lo *Z-algorithm* per calcolare tutti gli $N_j$, applicandolo sulla stringa
        riflessa $P^R$
       
  * Z-Based Boyer Moore Preprocessing
    ```
    for i:=1 to n do L'(i) := 0
    for j:=1 to n-1 do
        i := n - N_j(P) + 1;
        L'(i) := j;
    ```

* Per trattare nella fase di preprocessing anche i casi di $L'(i)=0$ e occorrenza di $P$ trovata,
  poniamo che $l'(i)$ sia la lunghezza del massimo suffisso di $P[i..n]$ che e' anche prefisso di
  $P$, e supponiamo che durante la ricerca si presenta un mismatch alla posizione $i-1$ di $P$:
    * Se $L'(i)>0$, la good suffix rule sposta P a destra di $n-L'(i)$ posizioni in modo che il
      prefisso di $P$ di lunghezza $L'(i)$ venga allineato al suffisso di $P$ nella posizione
      precedente
    * Se $L'(i)=0$ la good suffix rule sposta $P$ di $n-l'(i)$ posizioni
    * Se si trova un'occorrenza di $P$, lo shift e' di $n-l'(2)$ posizioni
    * Se il risultato del primo confronto e' un mismatch, $P$ viene spostato di una posizione

## Algoritmo di Knuth-Morris-Pratt

* Viene raramente usato in pratica perche' in molti casi ha prestazioni inferiori rispetto a
  Boyer-Moore, ma costituisce la base di un noto algoritmo per cui vale la pena studiarlo
* Sia $sp_i(P)$ la lunghezza del piu' lungo suffisso proprio di $P[1..i]$ uguale ad un prefisso di
  $P$. $sp_1=0$ per ogni stringa
* Sia $sp'_i(P)$ la lunghezza del piu' lungo suffisso proprio di $P[1..i]$ uguale ad un prefisso di
  $P$, e tale che i caratteri $P(i+1)$ e $P(sp'_i + 1)$ siano diversi
* Per tutte le stringhe e per tutte le posizioni $i$, $sp'_i(P) <= sp_i(P)$
* Per ogni allineamento di $P$ e $T$, se il primo mismatch si presenta in posizione $i+1$ di $P$,
  con la corrispondente posizione $k$ in $T$, sposta $P$ in modo che $P[1..sp'_i]$ sia allineato con
  $T[k-sp'_i..k-1]$. Cioe', di $i-sp'_i$ posizioni in modo che il carattere $sp'_i+1$ di $P$ sia
  allineato con il carattere $k$ di $T$
* Se si trova un'occorrenza di $P$, sposta $P$ di $n-sp'_n$ posizioni
* Anche in questo caso, gli $sp'_i$ e gli $sp_i$ possono essere calcolati in fase di preprocessing
  utilizzando una versione modificata dello *Z-algorithm*
* Z-Based Knuth Morris Pratt Preprocessing
  ```
  for i:= 1 to n do
    sp'_i := 0
  for j := n to 2 do
    i := j + Z_j(P) - 1
    sp'_i := Z_j
  ```
  
  
