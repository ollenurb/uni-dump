# Pattern Matching
## Z-Algorithm
Lo Z-Algorithm e' un algoritmo per fare pattern matching in un testo con
complessita' lineare. Piu' formalmente, sia $P$ un pattern di lunghezza $n$ e
$T$ un testo di lunghezza $m$ in cui $P$ puo' comparire 0 o piu' volte, trova
tutte le occorrenze di $P$ in $T$.
Il funzionamento dello Z-Algorithm consiste nel calcolare le Z-Box per ogni
elemento del testo $P \phi T$ in cui $\phi$ e' un carattere che non compare in
nessuna delle due stringhe. Per calcolare le Z-Box in modo efficiente,
l'algoritmo tiene conto delle posizioni di inizio ($l_i$) e fine ($r_i$) della
Z-Box piu' grande tra tutte quelle considerate fino alla posizione $i$. Questi
indici significano che la stringa compresa tra questi indici e' anche un
prefisso del testo, per cui per calcolare lo Z-Box di $i$, e' possibile
sfruttare la Z-Box precedentemente calcolata nel prefisso (precisamente a
posizione $i - l_i$).  E' possibile definire l'algoritmo induttivamente:

1. Caso base: Nessuna Z-Box e' gia' stata calcolata ($i=2$), per cui calcola
   $Z_2$ tramite confronti consecutivi
2. Caso Induttivo: Dati $l$ ed $r$, vogliamo calcolare lo Z-Value di una
   posizione qualsiasi $k$:
    * Se $k > r$, allora procedo con i confronti *naive*
    * Altrimenti, $k$ e' compreso all'interno di $l$ ed $r$, per cui sappiamo
      che sicuramente c'e' almeno una porzione di stringa compresa tra $k$ e $r$
      che fa match col prefisso. Dobbiamo pero' distinguere il caso in cui $k$
      matchi una sottostringa che non esca al di fuori del limite $r$, oppure
      che sia all'interno di questo limite, per cui il valore di $Z_k$ sara'
      almeno pari al minimo tra $r - k$ (lunghezza) e $Z_{k - l}$ (valore Z-Box
      complementare nel prefisso):
        * Il minimo e' $r-k$: Allora il valore $Z_k$ e' pari a $Z_{k-l}$ e
          lascio invariati gli indici $l$ ed $r$
        * Il minimo e' $Z_{k-l}$: Allora parto a confrontare in modo naive da
          $r+1$. Sia $q$ la posizione in cui c'e' il primo mismatch, allora
          $l = k$, $r = q-1$ e $Z_k = q - k$.
La complessita' di questo metodo e' $O(n + m + 1)$

## Algoritmo Boyer Moore
L'algoritmo di Boyer Moore e' un algoritmo per fare pattern matching, cioe' dato
un pattern $P$, trova tutte le posizioni in un testo $T$ in cui occorre $P$.
L'algoritmo funziona come il metodo naive, cioe' allinea ripetutamente il
pattern nel testo, ma presenta 3 differenze che gli permettono di essere piu'
efficiente:

* **RtoL comparisons**: I caratteri del pattern vengono confrontati da destra a
  sinistra
* **Bad character shift rule**:
    * **Normale**: quando si presenta un mismatch, si sposta il pattern in modo
      che il carattere nel testo $T$ in cui c'e' stato il mismatch sia allineato
      con lo *stesso carattere piu' a destra* nel pattern. Funziona male con
      alfabeti piccoli
    * **Estesa**: E' uguale a quella normale, con la differenza che sposta il
      pattern in modo da allineare il carattere nel testo in cui c'e' stato
      mismatch al carattere uguale *piu' vicino a sinistra* della posizione in
      cui c'e' stato mismatch (richiede una fase di preprocessing in cui si
      costruisce una matrice che, data la posizione e la lettera ritorna la sua
      occorrenza piu' vicina a sinistra della posizione data)
* **Good suffix rule**: quando si presenta un mismatch nel pattern, significa
  che un suo suffisso $t$ matcha. L'idea e' quella di allineare il suffisso $t$
  ad un suffisso uguale in $P$ tale per cui il carattere in cui ha fatto
  mismatch non e' lo stesso. Quindi, quando un mismatch avviene:

La **Good suffix rule** e' riassumibile nei seguenti passaggi:

1. In caso di mismatch, cerca nel pattern una stringa $t'$ uguale a $t$ tale per
   cui il carattere in cui c'e' stato mismatch e' diverso e allinea il pattern e
   il testo in modo che siano allineati $t$ e $t'$
2. Se non esiste $t'$, allora sposta $P$ in modo che un suo prefisso matchi un
   suffisso di $t$, in caso non sia possibile, sposta $P$ di $n$ posti a destra
3. In caso si trovi un'occorrenza di $P$, allora sposta $P$ in modo che un suo
   *prefisso* matchi un suo *suffisso* in $T$, in caso non sia possibile, sposta
   $P$ di $n$ posti a destra

Per poter funzionare, la good suffix rule ha bisogno di una fase di
preprocessing, in cui vengono calcolati gli $L'(i)$, che indicano la posizione
del carattere piu' a destra della copia piu' a destra di $P[i \dots n]$ che non
e' un suffisso di $P$ e che il carattere precedente e' diverso da quello che
precede $P[i \dots n]$.
Quindi, se supponiamo di avere un mismatch alla posizione $P(i-1)$, allora $P$
viene spostato a destra di $n - L'(i)$ posizioni.
Per calcolarlo, si fa una fase di preprocessing sul pattern in tempo $O(|P|)$,
che consiste nel calcolare gli Z-Values del pattern *riflesso* $P^R$

## Algoritmo Knuth Morris Pratt
Nella pratica e' un algoritmo con performance piu' scadenti rispetto a Boyer
Moore.
