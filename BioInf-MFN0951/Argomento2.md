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

## Algoritmi di Preprocessing

* Vediamo ora alcuni algoritmi per la fase di preprocessing
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
* Possiamo sfruttare questa caratteristica per sviluppare il cosiddetto *Z-Algorithm*:
    - All'inizio, $Z_2$ e' trovato confrontando carattere per carattere la sottostringa
      $S[1\dots|S|]$ con la sottostringa $S[2\dots|S|]$ fino a quando non si trova un mismatch,
      proprio come nel metodo Naive.
    - Se $Z_2>0$, $r=Z_2+1$ e $l=2$, altrimenti $r=l=0$ (*non esiste una Z-Box*)
    - Procediamo poi a calcolare i restanti $Z$. Dati gli $Z_i$ con $2<=i<=k-1$, $l(l_{k-1})$ e
      $r(r_{k-1})$, $Z_k$ e i  nuovi valori di $l$ e $r$ sono calcolati nel modo seguente:
        * Se $k>r$, vuol dire che la *Z-box* tra $l$ ed $r$ e' stata *"superata"*, per cui bisogna
          per forza utilizzare il metodo naive: $Z_k$ viene trovat confrontando i caratteri dalla
          posizione $k$ con quelli che iniziano nella posizione $1$ di $S$ finche' non si trova un
          mismatch. Una volta trovato, se $Z_k>0$, aggiorna i valori $r=k+Z_k-1$ e $l=k$.
        * Altrimenti ($k<r$), la posizione $k$ e' contenuta in uno *Z-box* e $S(k)$ e' contenuto
          nella sottostringa $\alpha=S[l \dots r]$ tale che $l>1$ ed e' uguale ad un prefisso.
 
![Raffigurazione schematica della situazione descritta
nell'esempio\label{figExamplee2}](img/2.2_zalg_example.png){ width=50% }

