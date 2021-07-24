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
* Esiste pero' un algoritmo che sfrutta le iterazioni precedente che ha complessita' $O(|S|)$
* Supponiamo di voler calcolare il valore di $Z_k$
 

    

