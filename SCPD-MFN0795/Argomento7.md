\newpage
# Computazioni Pipelined
Seppur gia' introdotte precedentemente come *stream parallelism*, riprendiamo la
trattazione che segue il libro su questo tipo di parallelismo.
Le computazioni pipelined possono essere impiegate per risolvere diverse classi
di problemi. Essenzialmente l'idea e' quella di dividere un singolo problema in
una serie di *step* che sono legati da una dipendenza di terminazione tra i
precedenti (l'*n-esimo* step puo' essere eseguito solo dopo l'*(n-1)-esimo*).

> Nel contesto del parallel computing, il parallelismo viene sfruttato assegnando
ad ogni step della pipeline un unita' computazionale differente.

La differenza essenziale tra gli altri metodi discussi fin'ora, e' che questo
metodo si basa su una suddivisione ***funzionale*** del problema. Cio' significa
che non vengono piu' suddivisi i ***dati***, ma e' lo stesso problema che viene
suddiviso in piu' parti che possono essere eseguite in modo parallelo.

Il pipelining puo' essere impiegato per ottenere uno speedup essenzialmente nei
casi in cui ci si trovi in una delle tre possibili situazioni:

1. Se devono essere eseguite una o piu' istanze del problema completo
2. Se una serie di dati devono essere processati per cui vengono richieste
   diverse operazioni
3. Se le informazioni necessarie a far partire il prossimo processo possono
   essere passate prima che il processo abbia completato tutte le prorie
   operazioni interne

La pipeline di tipo 1 e' implementata da `Intel TBB` [@intel_TBB].
L'idea e' quella di far eseguire la stessa funzione su dati diversi da unita'
computazionali differenti. Ad esempio, supponiamo di voler eseguire la funzione
$F$ per ogni istanza di un dataset $X = \{x_1, \dots, x_n \}$. In questo caso,
quello che si fa semplicemente e' assegnare ogni $x_i$ ad ogni unita'
computazionale che eseguira' $F(x_i)$.
Ogni processing element computa *tutte le funzioni* (poiche' $F= f_1 \cdot \dots
\cdot f_n$) su un determinato dato.

La pipeline di tipo 2 invece e' quella discussa fin'ora. Se si ha uno stream di
dati, si fanno eseguire tutte le parti di $F$ ($f_1, \dots, f_n$) da processing
element differenti
