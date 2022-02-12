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
L'idea importante e' che nelle pipelined computations si vuole *"spezzare"* una
funzionalita' in tante funzionalita' piu' piccole che possono potenzialmente
essere eseguite in parallelo.

Il pipelining puo' essere impiegato per ottenere uno speedup essenzialmente nei
casi in cui ci si trovi in una delle tre possibili situazioni:

1. Se deve essere eseguita piu' di una istanza del problema completo
2. Se una serie di dati devono essere processati per cui vengono richieste
   diverse operazioni
3. Se le informazioni necessarie a far partire il prossimo processo possono
   essere passate prima che il processo abbia completato tutte le prorie
   operazioni interne

In linea di massima ad ognuna di queste situazioni corrisponde una tipologia di
pipeline. L'idea della pipeline di tipo 1 (implementata da `Intel TBB`
[@intel_TBB]) e' quella di far eseguire la stessa funzione su dati diversi da
unita' computazionali differenti. Ad esempio, supponiamo di voler eseguire la
funzione $F=f_1; f_2; f_3$ (dove ; indica una relazione di sequenzialita' delle
funzioni) per ogni istanza di un dataset $X = \{x_1, \dots, x_n \}$. In questo
caso, quello che si fa semplicemente e' assegnare ogni $x_i$ ad ogni unita'
computazionale (*pipeline step*) che eseguira' $F(x_i)$. Ogni processing element
computa *tutte le funzioni* (poiche' $F= f_1 \cdot \dots \cdot f_n$) su un
determinato dato. La pipeline di tipo 1 viene utilizzata molto spesso dai
*Workflow Engines*.

La pipeline di tipo 2, invece, consiste nel far eseguire le *singole* funzioni
$f_i$ da ogni processing element. In altri termini, si fanno eseguire tutte le
parti di $F$ ($f_1, \dots, f_n$) da processing element differenti $P_1, \dots,
P_n$.

> La differenza sostanziale e' che nella pipeline di tipo 1 ogni processing
  element calcola **tutte** le funzioni su un certo dato, mentre nel tipo 2 ogni
  processing element calcola **una specifica** funzione su tutti i dati.

La pipeline di tipo 3 non e' molto diversa dalle precedenti. La differenza e'
che nelle altre pipeline il risultato veniva passato al prossimo stage alla fine
di ogni stage, cioe' quando tutte le operazioni di un determinato stage erano
terminate. In questo caso, invece, il passaggio al prossimo stage avviene prima
che tutte le operazioni di un determinato stage siano terminate. Se lo vediamo
nel contesto di parallel computing, l'UC assegnata ad un particolare stage
continua ad eseguire operazioni anche dopo aver fatto partire il prossimo stage.

**TODO: Aggiungere immagini pipelines**

Fino ad ora, in tutte le pipelines si e' ipotizzato che il numero di stadi fosse
uguale al numero di processori. In generale quando questo non accade si tende a
ridurre il parallelismo, raggruppando piu' stadi nella stessa UC.
Il parallelismo della pipeline ha delle limitazioni legate inerentemente alla
propria struttura: ll numero massimo di task che vengono eseguiti in parallelo
e' pari al numero di stage della pipeline. Questo pone delle limitazioni non
indifferenti, soprattutto se si vuole raggiungere un grado di parallelismo di
ordine molto alto.

> In generale, e' possibile trasformare le pipelines di tipo 2 in pipelines di
  tipo 1. L'idea e' quella di comporre gli stage della pipeline di tipo 2
  trasformandola in una pipeline di tipo 1, e utilizzare un paradigma di tipo
  *task farm* per eseguire gli stage.

Se ipotizziamo che le pipelines siano composte da $p$ steps, che siano di tipo
1 o 2, e che debbano eseguire $m$ istanze del problema, allora la pipeline
eseguira' tutte le $m$ istanze in $(p-1)+m$ steps.
Un'altra considerazione puo' essere fatta sull'implementazione di pipelines. In
generale le pipelines richiedono che le UC siano connesse direttamente tra loro.
Una struttura di interconnessione molto ideale e' ad esempio quella ad anello o
a linea.

Vediamo ora i diversi problemi che possiamo risolvere con le diverse strutture a
pipeline viste.

## Somma di una lista di numeri
Anche in questo caso possiamo sfruttare questa astrazione per sommare una lista
di numeri in modo parallelo. In linea di massima e' possibile implementare una
pipeline per lo scopo in due modi differenti. Il primo consiste nel mappare uno
stage ad ogni posizione nella lista, per cui ogni stage avra' un numero della
lista. Ogni stage riceve la somma accumulata dagli altri step, ne somma il
proprio elemento, e inoltra il risultato al prossimo step della pipeline. Ogni
step, "consumato" il proprio elemento utilizzera' poi l'elemento corrispondente
della prossima lista. Siccome la pipeline funziona per diverse istanze (lista)
dello stesso problema, stiamo parlando di una pipeline di tipo 1.

![Esempio di pipeline per la somma di liste di 3 numeri della prima tipologia.
Diverse liste vengono sommate dalla pipeline. Ogni processing element effettua
la somma del numero assegnato alla propria posizione sulla lista con il
risultato accumulato dallo stage precedente. La somma viene poi passata allo
stage successivo.](img/7.1_sum_pipeline.png){ width=50% }

## Ordinamento di numeri
Un'altro impiego della pipeline e' quello dell'ordinamento di liste di numeri,
implementando di fatto una versione parallela dell'*insertion sort*. Per
semplicita', consideriamo una pipeline che abbia tanti steps quanti elementi
abbia la lista da ordinare. Inizialmente, ogni step avra' al proprio interno il
numero piu' piccolo possibile ($-\infty$). Successivamente, ogni elemento $e_r$
ricevuto dal singolo step viene confrontato con l'elemento interno dello step
$e_i$:
* Se $e_r > e_i$, allora passa $e_i$ al prossimo stage e imposta $e_i = e_r$
* Altrimenti, passa $e_r$ al prossimo stage, senza alterare $e_i$

Alla fine della pipeline, la lista ordinata sara' contenuta all'interno di ogni
step della pipeline. Il metodo migliore per collezionare il risultato e' quello
di far passare poi gli elementi all'indietro nella pipeline, in modo che il
primo step contenga la lista ordinata. Questa struttura e' detta ad *anello*.
La tipologia di pipeline utilizzata e' chiaramente la tipologia 1, siccome e'
utilizzata per ordinare una sola lista (*singola istanza del problema*).
