# Metriche di performance
Le metriche di performance permettono di dare una stima sulla performance dei sistemi di calcolo
paralleli e distribuiti. La metrica di performance piu' importante per tale scopo e' appunto lo
**speedup factor**.

### Speedup Factor (Strong Scaling)
Lo speedup factor e' una misura che dato un problema di dimensioni definite indica quanto e' il
miglioramento delle prestazioni (in termini di tempo) che si ha utilizzando per risolvere il
determinato problema $p$ processori. 
$$
S(p) = \frac{t_s}{t_p}
$$
dove:

* $t_s$ e' il tempo di esecuzione utilizzando un singolo processore (migliore esecuzione
  sequenziale)
* $t_p$ e' il tempo di esecuzione utilizzando $p$ processori

E' necessario specificare che "processori" deve essere inteso nella sua accezione piu' generale (e
quindi come unita' di computazione a livello astratto). Non si specifica se tali sono core di un
processore, processori differenti oppure addirittura macchine differenti.  
Fatta questa premessa, pero', vien da se che il confronto deve essere fatto utilizzando
coerentemente la stessa unita' di computazione per entrambe le misurazioni. Ad esempio, se si
testasse il problema su di un singolo processore con un clock piu' alto rispetto ai $p$ processori,
la metrica risulterebbe inesatta.  Questo perche' le condizioni degli esperimenti sono differenti
tra loro, di fatto inserendo nella stima della metrica dei fattori che ne influenzano la qualita'.
Un altro esempio potrebbe essere quello di testare l'agoritmo sul singolo processore su una CPU e
poi quelli paralleli su una GPU.  
Per rendere quindi la metrica il piu' possibile precisa, l'unica condizione (o parametro) che viene
resa variabile per l'esperimento e' l'algoritmo. Questo perche' l'implementazione dell'algoritmo che
sfrutta il parallelismo e' spesso differente da un'implementazione sequenziale.

>**Nota per il progetto d'esame**: *E' necessario inserire lo speedup factor nella relazione del
>progetto, scegliendo l'algoritmo sequenziale migliore e piu' efficiente per la soluzione del
>problema.  E' preferibile poi motivare la scelta dell'algoritmo attraverso una citazione.*

Nella maggior parte dei casi lo speedup e' lineare, cioe' $S(p)=p$. E' possibile anche ottenere casi
in cui lo speedup e' superlineare, cioe' in cui $S(p)>p$, ma cio' accade spesso per ragioni come la
presenza di memoria aggiuntiva (quale Cache e RAM) in sistemi multiprocessore e per l'impiego di
algoritmi nondeterministici. 
Per esempio, in alcuni problemi il programma potrebbe essere troppo grosso da caricare interamente
in memoria su una macchina singola. Sfruttando il fatto che sia possibile caricarlo interamente
nella RAM o nella Cache utilizzando piu' macchine, il fattore puo' diventare di conseguenza
superlineare.

>**Focus**: Nell'informatica moderna si sfrutta questo fattore di superlinearita' nel training delle
>reti neurali. Poiche' il training delle reti neurali ha un fattore di convoluzione (moltiplicazione
>di matrici) per cui i processori moderni sfruttano i cosiddetti *tensor cores*, tenendo l'intero
>dataset su cui fare il training in una memoria piu' efficiente (nelle GPU chiamata *shell memory*) e
>permetto quindi di avere delle ottimizzazioni superlineari in termini di speedup.  Si sfrutta quindi
>il fatto che i dati sono caricati interamente in una memoria molto veloce per ottenere uno speedup
>superlineare. 

### Speedup Massimo e Legge di Amdahl
Lo speedup di tipo lineare assume che gli algoritmi che stiamo valutando siano
parallelizzabili interamente. Per questa ipotesi e' quindi possibile dividere in $N$ parti il
problema per poi far risolvere gli $N$ sottoproblemi ottenuti da $N$ elementi di calcolo.  Questa
ipotesi pero' non e' generalmente vera poiche' non tutti gli algoritmi sono parallelizzabili.  Si
pensi ad esempio all'I/O; molti algoritmi leggono inizialmente uno o piu' file e terminano generando
in output uno o piu' file. 
La legge di Amdahl tiene conto delle sezioni non parallelizzabili e che quindi devono essere
eseguite per forza in modo sequenziale. La serial fraction comprende qualsiasi sezione che non sia
parallelizzabile e che debba essere eseguita in modo sincrono. 

![Rappresentazione grafica di un problema in cui e' presente una sezione non parallelizzabile
(*serial section*)\label{figAmdahl}](img/1_amdahl.png)

La legge di Amdahl calcola quindi lo speedup massimo raggiungibile $S_{max}$:
$$
S_{max} = \frac{(t_s - t_p)}{(t_s + \frac{t_p}{N})}
$$
In cui

* $N$ e' il numero di processori in parallelo
* $t_p$ e' la sezione che viene eseguita in parallelo
* $t_s$ e' la sezione che viene eseguita in serie

Se noi ipotizziamo che $t_s + t_n = 1$ per semplicita' algebrica, si ottiene

$$
S_{max} = \frac{1}{(t_s + t_p/N)}
$$

Si nota fin da subito dalla relazione che tale speedup massimo non potra' mai essere $N$. Inoltre,
la legge di Amdahl non tiene nemmeno in considerazione tutti gli overheads introdotti da
un'implementazione parallela quali comunicazione, sincronizzazione e creazione di threads e processi.

### Legge di Gustafson
La legge di Gustafson e' un raffinamento della legge di Amdahl. 
