# Pattern Matching
## Z-Algorithm
Lo Z-Algorithm e' un algoritmo per fare pattern matching in un testo con
complessita' lineare. Piu' formalmente, sia $P$ un pattern di lunghezza $n$ e
$T$ un testo di lunghezza $m$ in cui $P$ puo' comparire 0 o piu' volte, trova
tutte le occorrenze di $P$ in $T$.
Il funzionamento dello Z-Algorithm consiste nel calcolare le Z-Box per ogni
elemento del testo $P%T$ in cui $%$ e' un carattere che non compare in nessuna
delle due stringhe. Per calcolare le Z-Box in modo efficiente, l'algoritmo tiene
conto delle posizioni di inizio ($l_i$) e fine ($r_i$) della Z-Box piu' grande
tra tutte quelle considerate fino alla posizione $i$. Questi indici significano
che la stringa compresa tra questi indici e' anche un prefisso del testo,
per cui per calcolare lo Z-Box di $i$, e' possibile sfruttare la Z-Box
precedentemente calcolata nel prefisso (precisamente a posizione $i - l_i$).
Per sfruttare queste informazioni, quindi, l'algoritmo deve differenziare tra le
possibili casistiche in cui ci si puo' trovare:

1. Nessuna Z-Box e' gia' stata calcolata ($i=2$), per cui calcola $Z_2$ tramite
   confronti consecutivi
2. Si ha superato l'indice della Z-Box massima $r_i$, per cui non si puo'
   riutilizzare nessun valore gia' calcolato e si calcola la nuova Z-Box con il
   metodo *naive*, partendo da $r_i$. Ovviamente, anche gli indici saranno
   aggiornati di conseguenza.
3. Si e' all'interno della sottostringa delimitata dagli indici $r_i$ ed $l_i$ e
   possiamo distinguere due sottocasi:
    1. La sottostringa che fa match dalla posizione corrente in poi non eccede
       il limite $r_i$ (lo sappiamo controllando il valore della Z-Box assegnata
       alla stessa posizione nel prefisso). In questo caso si assegna lo stesso
       valore della Z-Box al valore della Z-Box nella stessa posizione nel
       prefisso.
    2. La sottostringa che fa match dalla posizione corrente eccede il limite
       $r_i$, per cui si assegna il valore della Z-Box uguale a quello della sua
       stessa posizione nel prefisso, e si continua a fare matching *naive*

