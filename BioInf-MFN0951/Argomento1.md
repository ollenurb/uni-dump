# Introduzione
La disciplina della bioinformatica e' molto vasta, per cui e' possibile riassumerla in 3 grandi
sottocategorie:

* **Biologia Computazionale**: che pone l'accento sugli aspetti algoritmici dei problemi biologici e
  sull'efficienza delle loro soluzioni. Principalmente riguarda lo studio algoritmi e tecniche che
  riguardano stringhe di sequenze di caratteri.
* **Biologia dei Sistemi**: approccio introdotto recentemente che si basa sull'utilizzo della
  teoria dei sistemi per studiare i fenomeni biologici. L'idea e' quella di sfruttare formalismi
  matematico-computazionali per modellare interazioni biologiche. 
* **DNA Computing**: e' una forma di computazione che usa il DNA e la biologia molecolare al posto
  delle tecnologie computazionalii tradizionali (silico-based)

La biologia computazionale in particolare fa riferimento alla biologia molecolare, la branca della
biologia che si occupa di studiare le interazioni e le attivita' biologiche a livello molecolare.
Quando si parla di biologia molecolare e' impossibile non parlare del cosiddetto *dogma centrale
della biologia molecolare*, che descrive il flusso principale di informazione genetica all'interno
di un sistema biologico. In dettagli tale dogma e' descritto dai seguenti passaggi: 

1. Tutta l'informazione di una cellula e' codificata nel **DNA**. L'informazione e' organizzata nei
   "geni" che sono delle sequenze particolari all'interno dello stesso
2. Nelle cellule eucariote, il DNA deve "uscire" dal nucleo della cellula, e per far cio' viene
   letto e tradotto in **mRNA**. L'RNA e' una piccola molecola in grado di passare attraverso degli
   appositi "pori" situati nella membrana nucleare [@molbio_central]
3. L'RNA viene trasformato in **proteine** (cioe' il "*carburante*" che permette al meccanismo
   genetico di funzionare) attraverso un processo di sintesi
4. Le proteine determinano il **fenotipo**, cioe' le caratteristiche *morfologiche* e le
   *funzionalita'* di un determinato organismo
5. Il fenotipo si riflette all'interno di una popolazione di individui. Tramite dei meccanismi di
   incrocio (nella maggior parte degli esseri viventi e' l'accoppiamento) si ottengono nuovi
   individui con fenotipi differenti. In questa fase avviene una **selezione** dei fenotipi migliori
6. Il risultato della selezione dei fenotipi migliori determina l'**evoluzione** della specie
7. Il nuovo fenotipo determina un nuovo DNA, il ciclo si ripete.

In generale, e' possibile riassumere questi punti nei seguenti passaggi
$$
DNA \; \overset{trascrizione}{\rightarrow} 
\; mRNA \;
\overset{traduzione}{\rightarrow} 
 \; Proteine
$$
Idealmente, un genoma (DNA) codifica un mRNA che a sua volta codifica una proteina. Tale derivazione
pero' non e' corretta dal momento che ogni genoma puo' codificare molte proteine (e quindi determina
molte funzioni). Basti pensare ad esempio che il genoma umano che condividiamo con le altre persone
ha similarita' per il 99,9% rispetto agli altri. Cio' significa che anche la piu' piccola variazione
nella presenza di geni puo' causare una differenza fenotipica molto accentuata. Oltre a questo, e'
valido anche il contrario, cioe' che esistono all'interno della sequenza genomica gli stessi geni
che codificano proteine diverse. Principalmente, un DNA e' composto da 4 nucleotidi (Adenosina,
Citosina, Guanina e Tinina), mentre una proteina che viene codificata dal DNA e' composta da
amminoacidi. Gli amminoacidi sono al massimo 20. Ogni amminoacido e' codificato da una sequenza di 3
nucleotidi. Quindi, per calcolare quanti amminoacidi sono codificati da una tripla:
$$
4 \cdot 4 \cdot 4 = 4^3 = 64
$$
cio' significa che tramite una tripla possono essere codificati 64 amminoacidi, ma dal momento che
sono solo 20, alcune sequenze sono duplicate, per cui lo stesso amminoacido e' codificato da diverse
triple.
E' evidente come sia fondamentale per una branca come la biologia molecolare trattare una grande
mole di dati biologici dal punto di vista computazionale, ed e' qui che entra in gioco la
biologia computazionale.
La bioinformatica nasce essenzialmente negli anni 2000 in seguito ad un evento scientifico molto
importante: il sequenziamento del genoma umano. Per la prima volta veniva raccolta una mole di dati
mai raccolta prima. Questo evento mise luce alla mancanza di adeguatezza da parte delle tecniche e
tecnologie informatiche (riguardanti la biologia computazionale) utilizzate fino a quel momento.
Naque quindi la necessita' di sviluppare algoritmi e tecniche della biologia computazionale
particolarmente sviluppate per trattare grandi quantita' di dati. 
Al giorno d'oggi e' addirittura fondamentale sviluppare tecnologie high-thoughput per il
processamento di dati biologici. Una di questa ragione e' che molte delle tecnologie per il
sequenziamento producono di norma una quantita' di dati molto grande. Un esempio di questo sono i
microarrays, cioe' dei chip hardware specificatamente progettati per il sequenziamento parallelo di
migliaia di geni contemporaneamente. (Piu' recentemente si utilizza il deep sequencing)

## Introduzione alla biologia

### Dai geni alle proteine

* Il dogma fondamentale della biologia molecolare negli anni e' diventato sempre meno un "dogma" dal
  momento che si sono scoperte alcune eccezioni e variazioni.
* Il DNA contiene tutto il nostro codice genetico. Esso determina ogni nostro fenotipo e ogni reazione
  che abbiamo a stimoli sia interni che esterni.
* Il DNA e' formato puo' essere rappresentato come una stringa formata da 4 caratteri che
  rappresentano i nucleotidi: **A**(*denina*),**T**(*inina*), **G**(*uanina*), **C**(*itosina*)
* Il DNA concettualmente *dirige* le operazioni principali della cellula (come ad esempio determina
  la risposta ad un determinato stimolo)
* Il DNA umano e' di circa 3Gb (*basi*). Di tutto questo genoma, la parte che effettivamente
  contiene informazioni operative e' una porzione molto piccola. 
* La maggior parte del DNA non sono delle porzioni che codificano dei geni (e quindi proteine), ma
  sono delle parti che o vanno a regolare la codifica delle stesse proteine, oppure per la
  produzione di alcuni tipi di proteine che non vengono prodotte normalmente (storicamente veniva
  definito come *"junk"* DNA perche' si pensava fosse inutile)
* Dal momento che i geni codificati sono molto pochi, per ottenere una combinazione di molte piu'
  proteine possibili la cellula usa l'mRNA messaggero
* La trascrizione di una sequenza di $n$ nucleotidi di DNA produce una sequenza di $n$ nucleotidi
  di mRNA. (la trascrizione preserva la lunghezza) 
* Le proteine sono codificate come una sequenza di amminoacidi. In tutto sono 20
* La traduzione *NON* preserva la lunghezza della sequenza

**Il DNA: La doppia elica**

* NOTA: Una sequenza di DNA e' contrassegnata dal carattere `5'` che ne indica la testa e dal
  carattere `3'` che ne indica invece la coda
* Il DNA e' composto da due filoni di nucleotidi connessi tra di loro 
* Esiste una complementarieta' tra i nucleotidi che compongono il DNA. Tale complementarieta' e'
  derivata da una caratteristica intrinseca dei nucleotidi che lo compongono
* In generale l'Adenina si lega in modo complementare alla Tinina, mentre la Citosina si va a legare
  in modo complementare alla Guanina
* L'Adedina e la Tinina sono legate da 2 ponti a idrogeno, mentre la Guanina e la Citosina sono
  legate da 3 ponti a idrogeno. Questo implica che quando si deve fare un esperimento che presuppone
  una divisione delle due stringhe di DNA, se la quantita' di Citosina e Guanina e' piu' presente,
  bisognera' usare molta piu' energia per poterle dividere 
* Il DNA e' in grado di replicare se stesso tramite un processo di replicazione in cui i due filoni
  di DNA si dividono per poi essere "letti" da una proteina apposita in grado di generare il
  nucleotide complementare
* Dal momento che il DNA e' una sequenza molto lunga che deve risiedere interamente dentro ad una
  porzione specifica (nelle cellule eucariote) detta nucleo, il DNA assume una forma piu' compatta
  detta cromosoma 
* Il compattamento in cromosoma del DNA e' dato da una proteina a forma di racchetta chiamata
  *Histone*. Concettualmente, il DNA non fa altro che "*arrotolarsi*" su di questa proteina
* La sequenza genomica si arrotola piu' volte su di questa proteina, ottenendo infine il cromosoma
* E' importante notare che il DNA rimane sempre in questa forma compatta con l'eccezione della fase
  di replicazione. Inoltre durante il processo di trascrizione vengono scompattate solo le parti di
  DNA (i genomi) da trascrivere.
* Esistono diverse forme di RNA, ognuna atta a svolgere una funzione specifica. Ad esempio, lo scopo
  dell'mRNA e' quelo di trasportare informazione genomica-protenomica.  
* Contrariamente al DNA, l'mRNA e' costituito da un singolo filamento formato dagli stessi nucleotidi
  che formano il DNA, con la differenza che la Tinina e' sostituita all'Uracile
* Durante il processo di trascrizione, solo uno dei due filamenti di DNA viene letto. Non ci sono
  limitazioni sul quale, l'importante e' che entrambi vengano letti nel verso giusto (`5'-3'`) 
* Il processo di trascrizione avviene per mezzo di una proteina chiamata *RNA-Polimerasi*. Quando il
  DNA entra all'interno dell'RNA polimerasi, il DNA viene diviso nei suoi due filamenti. Uno di
  questi filamenti e' il template della trascrizione, su sui si legheranno a loro volta i nucleotidi
  di cui e' composto l'mRNA man mano che il DNA passa all'interno dell'RNA polimerasi. Una volta
  uscito, il DNA si richiude da solo. 
* Generalmente l'inizio di un gene e' contraddistinto dalla seguenza `ATG`
* Il promotore e' la zona a monte di un gene che contiene al suo interno delle sequenze (*Motif*)
  che hanno la funzione di regolazione 
* Una di queste sequenze e' la cosiddetta `TATA` box. Essa e' una sequenza situata a 25 nucleotidi
  prima dell'inizio della sequenza del gene e serve essenzialmente a legarsi con una proteina
  (TBP-TFIIID) il cui scopo e' quello di "sedersi" sopra la struttura del DNA per scompattarla. 
  Successivamente altri fattori di trascrizione si assemblano nei pressi del promotore, compresa la
  proteina DNA-Poly. Infine, un fattore di trascrizione TFIIH, utilizza l'ATP per spezzare il DNA
  all'inizio del punto di trascrizione dando il via al processo stesso.
* Esistono principalmente 4 tipi di RNA:
    - mRNA: messaggero dell'informazione genetica
    - tRNA: codon-to-amino acid apecificity
    - rRNA: nucleo del ribosoma
    - snRNA: reazioni di splice
* Da un gene presente nel DNA si ottengono $n$ proteine. Questo avviene per mezzo dell'mRNA
  messaggero, tramite un'operazione chiamata *splicing*. 
  Come detto, un filamento di mRNA messaggero corrisponde ad un gene particolare nel DNA. Tutta
  l'informazione presente nell'mRNA, pero', non e' solo riguardante alla proteina da sintetizzare. 
  Possiamo quindi definire 2 parti dell'mRNA:
    - Esoni: codificano effettivamente la proteina da produrre
    - Introni: sono porzioni che non contribuiscono all'informazione della proteina da produrre
  Ci sono due tipologie di splicing principali:
    1. Splicing classico: che consiste nella rimoziione degli introni dalla sequenza. il risultato
       e' l'unione degli esoni.
    2. Splicing alternativo: consiste nella rimozione di alcuni introni (anche tutti), e di alcuni
       esoni. 
  Tramite lo splicing alternativo, quindi si possono ottenere tante combinazioni dalla stessa
  sequenza di mRNA, e di conseguenza diverse proteine

  
