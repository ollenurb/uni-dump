# Embarassingly Parallels Computations
Nella parallelizzazione di programmi sequenziali, quello che si vuole ottenere idealmente e' una
suddivisione del problema in parti diverse (idealmente $p$) che saranno eseguite in parallelo dai
diversi $p$ processori. Molti problemi sono facilmente divisibili mentre altri no. La disivibilita'
deriva principalmente dalla presenza o meno di dipendenze tra operazioni che devono essere eseguite
in un ordine preciso. Quando questa dipendenza e' assente, le operazioni possono essere eseguite
indipendentemente su ogni dato, per cui e' possibile parallelizzare tali operazioni.  
Molti problemi hanno questa caratteristica, tanto che sono stati chiamati problemi
"imbarazzantemente paralleli", proprio per la facilita' con cui si puo' ottenere una suddivisione
del problema sequenziale per ottenere una versione parallela.
Trattiamo ora nel dettaglio alcuni di questi problemi con la loro relativa analisi delle
performance, seguendo le definizioni che sono state introdotte nel capitolo precedente.

## Trasformazioni su immagini
Supponiamo di voler effettuare delle trasformazioni su una immagine. Un'immagine e' rappresentata
in un calcolatore come una matrice di pixel di dimensioni $h*w$ dove $h$ e' l'altezza e $w$ e' la
larghezza. Una trasformazione consiste nel cambiare pixel per pixel la loro disposizione secondo una
regola ben precisa. Ad esempio per una traslazione lungo l'asse $x$ di $\Delta x$ e lungo l'asse
$y$ di $\Delta y$, dato il pixel di coordinate $(x, y)$, le nuove coordinate $(x', y')$ sono date
dalla regola:
$$
x' = x + \Delta x
y' = y + \Delta y
$$
E' subito chiaro che la natura del problema sia di tipo imbarazzamente parallelo, dal momento che il
calcolo di ogni pixel e' indipendente dagli altri. L'implementazione parallela consiste quindi nel
dividere l'immagine in $p$ blocchi, e distribuire poi tali blocchi ai processori. Il risultato sara'
poi collezionato da un processo unico prefissato.

### Analisi
//111
