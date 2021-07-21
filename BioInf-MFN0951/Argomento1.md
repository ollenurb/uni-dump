# Introduzione

La disciplina della bioinformatica e' tanto vasta da essere suddivisa in diverse aree di competenza.
Tra queste, quelle di maggiore rilevanza troviamo:

* Genomica: si occupa dello studio dei *genomi*
* Genomica strutturale: estende lo studio della genomica, focalizzandosi sulle proprieta'
  *strutturali* dei genomi (cioe' la loro conformazione 3-dimensionale all'interno della cellula)
* Protenomica: si occupa dello studio delle *proteine*

Tutte queste discipline ricadono nella piu' generica Biologia Molecolare Computazionale. Tale
disciplina concerne particolarmente lo studio a livello *molecolare* (e quindi microscopico) delle
singole cellule, sfruttando metodologie computazionali. Al giorno d'oggi, infatti, gran parte degli
studi riguardanti la biologia molecolare non vengono piu' fatti in laboratorio facendo singoli
esperimenti sul singolo gene. Ad esempio un tipico esperimento poteva consistere nel modificare un
singolo gene e osservarne i cambiamenti nel funzionamento dell'organismo. Oggi invece gli
esperimenti vengono fatti in maniera massiva sull'intero genoma, sfruttando tecniche e tecnologie
computazionali per analizzare le grandi quantita' di dati raccolti. 
La biologia molecolare a sua volta fa parte della Biologia Computazionale, che a differenza della
biologia molecolare, vengono tenuti in considerazione alcuni aspetti della funzionalita' o
fenotipici (esteriori) della cellula o del sistema biologico.
Oggigiorno si parla sempre piu' anche di biologia dei sistemi, che concerne lo studio di sistemi
biologici complessi, in cui viene studiato il funzionamento e le caratteristiche non piu' della
singola cellula o del singolo gene, ma di un intero sistema multicellulare (ad esempio organi).

L'informatica viene a supporto di tutte queste discipline mediante l'impiego di diverse tecniche e
tecnologie. Piu' nello specifico, alcune aree dell'informatica che contribuiscono maggiormente a
supporto della biologia computazionale sono (per citarne alcune):

* Basi di dati: lo storage di grandi quantita' di dati genomici (storicamente erano conservati in
  semplici sequenze di testo in dei files non strutturati)
* Machine Learning: forniscono algoritmi di predizione, clustering ecc.. di dati biologici
* Statistica & Probabilita: forniscono meccanismi di validazione statistico-probabilistica per la
  veridicita' dei dati biologici
* Algoritmi: fornisce algoritmi per l'analisi di sequenze genomiche
* Teoria dei grafi: molto importante nell'ambito della biologia dei sistemi, in cui vengono
  impiegate tecniche per l'analisi di grafi di interazione tra molecole, proteine, geni ecc..
* Teoria dell'informazione: validazione della significativita' delle sequenze che vengono estratte
  dagli algoritmi (alcune sequenze di DNA codificano un gene, mentre altre nulla)

La biologia molecolare si basa su di un paradigma cosiddetto "paradigma centrale della biologia
molecolare" che puo' essere riassunto nei seguenti punti:

1. Tutta l'informazione di una cellula e' codificata nel **DNA**
2. Il DNA viene letto e tradotto in **RNA**
3. L'RNA viene trasformato in **proteine** (cioe' il "*carburante*" che permette al meccanismo genetico di
   funzionare)
4. Le proteine determinano il **fenotipo**, cioe' le caratteristiche *morfologiche* e
   *funzionalita'* di un determinato organismo
5. Il fenotipo si riflette all'interno di una popolazione di individui. Tramite dei meccanismi di
   incrocio (nella maggior parte degli esseri viventi e' l'accoppiamento) si ottengono nuovi
   individui con fenotipi differenti. In questa fase avviene una **selezione** dei fenotipi migliori
6. Il risultato della selezione dei fenotipi migliori determina l'**evoluzione** della specie
7. Il nuovo fenotipo determina un nuovo DNA, il ciclo si ripete.

Analogamente per la bioinformatica possiamo derivare dalla biologia molecolare un cosiddetto
"*paradigma centrale della bioinformatica*":

1. L'**informazione genetica** e' rappresentata come una sequenza di caratteri
2. La sequenza genetica codifica una **struttura molecolare**
3. La struttura molecolare determina la **funzione biochimica** della molecola
4. La funzione biochimica determina a sua volta il **fenotipo**, cioe' i sintomi derivanti dalla
   funzione biochimica (es. produzione di insulina per digerire gli zuccheri da parte del pancreas)

Lo scopo degli algoritmi bioinformatici e' quello di analizzare l'informazione genetica in modo tale
da generare automaticamente la struttura molecolare, per poi predirne la funzione biochimica e
infine il fenotipo (i sintomi) della stessa. Un aspetto particolarmente interessante concerne quello di
riuscire a trovare algoritmi che "saltino" concettualmente alcuni passaggi, cioe' a partire
dall'informazione genetica, riuscire a determinare direttamente la funzione biochimica della stessa
o addirittura il fenotipo. Piu' in generale, gli obiettivi della bioinformatica possono essere
riassunti nei seguenti punti:

* **Apprendimento e generalizzazione**: l'analisi delle sequenze ci permette di trovare pattern che
  sono ripetuti anche in geni diversi. Questo permette di inferire il funzionamento di alcuni geni,
  andandoli a comparare in organismi o strutture genomiche differenti.
* **Fare Predizione**: partendo da eventualmente informazioni o strutture conosciute, cercare di
  inferire la funzione o la struttura di nuovi geni dopo averli individuati. Piu' in generale e'
  possibile fare la stessa cosa su interi genomi, cioe' determinare la funzione di interi organismi.
* **Organizzazione e intergrazione**: sviluppare un approccio sistematico alla genomica in modo tale
  da organizzare meglio le interazioni molecolari, metaboliche, ecc.. 
* **Simulare**: nel momento in cui si riesce a modellare il funzionamento delle proteine e delle
  molecole, e' possibile simulare l'interazione delle stesse per poterne studiare meglio il
  comportamento 
* **Ingegnerizzare**: tramite le informazioni acquisite dallo studio dei genomi, si possono
  modificare i geni di cui e' nota la funzionalita' per regolarne la capacita' funzionale. Ad
  esempio, diminuendo la capacita' funzionale di alcuni geni responsabili di alcune malattie, ecc..
  Tramite queste informazioni e' possibile anche costruire nuovi organismi (come i batteri che
  digeriscono la plastica)
* **Terapia Genica**: e' lo stesso scopo dell'ingegnerizzazione, ma in questo caso ci si concentra
  sui geni o mutazioni che possono causare malattie, modificando il funzionamento del gene stesso
  che causa la mutazione o la malattia

Tutti questi problemi e obiettivi che la bioinformatica si propone sono pero' di difficile
soluzione. Questo perche' contrariamente ad altre tematica, l'ambito biologico non e' ben definito.
Ad esempio nello studio delle reti di calcolatori, si ha a che fare con dei dispositivi
computerizzati di cui se ne conosce perfettamente il funzionamento. Cio' pero' non accade nei
sistemi biologici per diversi motivi:

* L'informazione e' ridondante, dal momento che molti geni sono ripetuti all'interno di un genoma.
  Inoltre il problema e' accentuato dalla presenza di geni che sono molto simili tra di loro.
  Esistono anche molti geni diversi che svolgono funzioni simili (=codificano la stessa proteina).
  A tutto cio' si aggiungono alcuni geni che singolarmente svolgono diverse funzioni.
* La ridondanza si riflette anche dal punto di vista strutturale. Come nel caso dei geni, la
  struttura molecolare di una proteina (che ne determina la funzione) puo' avere la stessa funzione
  di una molto differente strutturalmente. Un'altro aspetto riguarda la meta-stabilita' delle
  proteine, dal momento che la struttura della proteina non rimane invariata nel tempo, la sua
  funzionalita' varia di conseguenza.
* L'informazione genetica viene rappresentata unidimensionalmente (come una stringa di caratteri),
  mentre la funzione della proteina che codifica il gene dipende anche dalla sua struttura
  3-dimensionale. Questo e' noto come il problema del protein folding, per cui non ci permette di
  determinare con esattezza la funzionalita' direttamente dal gene.

Un DNA e' composto da 4 nucleotidi (Adenosina, Citosina, Guanina e Tinina), mentre una proteina che
viene codificata dal DNA e' composta da amminoacidi. Gli amminoacidi sono al massimo 20. Ogni
amminoacido e' codificato da una sequenza di 3 nucleotidi. Quindi, per calcolare quanti amminoacidi
sono codificati da una tripla:
$$
4 \cdot 4 \cdot 4 = 4^3 = 64
$$
cio' significa che tramite una tripla possono essere codificati 64 amminoacidi, ma dal momento che
sono solo 20, alcune sequenze sono duplicate, per cui lo stesso amminoacido e' codificato da diverse
triple.

I principali tipi di dati che vengono trattati in bioinformatica sono:

* Biosequenze (DNA, RNA, Proteine): rappresentate mediante sequenze di caratteri 
* Strutture (DNA, Secondaria dell'RNA, Secondaria e Terziaria delle proteine): che sono
  rappresentate sempre mediante un alfabeto specifico oppure mediante la descrizione della posizione
  degli atomi che compongono gli amminoacidi
* Dati di interazione (DNA-Proteina, RNA-RNA, RNA-Proteina, Proteina-Proteina) 
* Livelli di espressione (RNA (Microarray), Proteine (Protein array)): tipicamente rappresentati con
  dati numerici

# Introduzione
Storicamente, la bioinformatica nasce negli anni 2000 in seguito ad un evento scientifico molto
importante: il sequenziamento del genoma umano. Per la prima volta veniva raccolta una mole di dati
mai raccolta prima. Questo evento mise luce alla mancanza di adeguatezza da parte delle tecniche e
tecnologie informatiche (riguardanti la biologia computazionale) utilizzate fino a quel momento.
Naque quindi la necessita' di sviluppare algoritmi e tecniche della biologia computazionale
particolarmente sviluppate per trattare grandi quantita' di dati. 
Quando si parla di biologia, si parla di un sistema composto da diverse livelli. Si possono studiare
le interazioni a livello atomico (folding problem ad esempio), come anche le interazioni a livello
macroscopico (organismo all'interno di un ambiente).

Il termine bioinformatica racchiude 3 grandi sottocategorie:
* **Biologia Computazionale**: che pone l'accento sugli aspetti algoritmici dei problemi biologici e
  sull'efficienza delle loro soluzioni
* **Biologia dei Sistemi**: approccio introdotto recednetemente che si basa sull'utilizzo della
  teoria dei sistemi per sutidare i fenomeni biologici
* **DNA Computing**: e' una forma di computazione che usa il DNA e la biologia molecolare al posto
  delle tecnologie computazionalii tradizionali (silico-based)
