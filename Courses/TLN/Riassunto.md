# Lezione 8

## Modelli del Linguaggio
Dal punto di vista formale, un modello del linguaggio non e' nient'altro che una
distribuzione di probabilita' $P(w_1, \dots, w_n)$ su tutte le possibili frasi. 


# Lezione 2

## Prototypes vs Examplar Theories & Dual Process Theories
Sono due grandi teorie riguardo alla rappresentazione del significato delle
parole. Secondo la teoria dei prototipi, il significato di un concetto puo'
essere rappresentato come il suo prototipo, cioe' un rappresntante
statisticamente rilevante tra gli elementi di questa categoria. (es. sedia)
Secondo la teoria degli esemplari, invece, un senso puo' essere rappresentanto
come l'**insieme** delle rappresentazioni di alcuni esempi di tale categoria che
sono stati incontrati durante l'esperienza di una persona.

La teoria dei processi duali e' una teoria che mira a mettere insieme approcci
basati sulla rappresentazione formale della conoscenza (ontologica) e approcci
basati su prototypes/examplars. Secondo questa teoria il cervello umano utilizza
due tipologie di processi cognitivi:

* System 1: parte del cervello che si e' evoluta anticamente, riguarda processi
  subconsci, automatici ed e' molto veloce. Utilizza conoscenze pragmatiche e
  quindi potrebbe essere visto in un contesto di rappresentazione continua
  (subsimbolica), e quindi secondo la teoria degli esemplari/prototipi.
* System 2: componente conscia, controllabile e relazionata direttamente al
  linguaggio. Molto piu' lenta del system 1 ma anche molto piu' logica ed
  astratta. La rappresentazione dei dati piu' adatta a modellare questo sistema
  e' quella proposizionale (ontologie).

# Lezione 12

## BabelNet
BabelNet e' una risorsa lessicale multilingua con lo scopo di unire Wikipedia
con WordNet. La conoscenza viene codificata in un grafo in cui i vari nodi sono
i concetti espressi come synsets multilingua (cioe' contenenti lessicalizzazioni
in diverse lingue) e gli archi sono le relazioni semantiche che intercorrono tra
essi. Le relazioni possono essere etichettate (is-a, part-of) oppure no. I
concetti sono costruiti inizialmente facendo un mapping dei sensi di WordNet e
le entry enciclopediche di Wikipedia. Le relazioni, invece, sono prese da
WordNet (quelle tipate), mentre quelle non etichettate sono create tra vari
concetti seguendo gli hyperlinks presenti nelle Wikipages. Le connessioni non
tipate hanno un determinato peso che e' determinato da una misura di relatedness
basata sul coefficiente di Dice.

## NASARI
NASARI e' una risorsa lessicale che nasce con l'intento di superare una delle
limitazioni delle rappresentazioni vettoriali: la conflazione. 
L'idea alla base di NASARI e' quella di ottenere delle rappresentazioni
vettoriali che tengano conto anche dell'informazione contestuale. Tale
informazione e' ottenuta da Wikipedia per mezzo di BabelNet. Dal punto di vista
operativo, NASARI crea due rappresentazioni per lo stesso concetto
(rappresentato come un BabelNet synset):

* Rappresentazione Lessicale: vettore avente come dimensioni i lemmi
  individuali.
* Rappresentazione Unificata: vettore avente come dimensioni i concetti. Ogni
  concetto e' pesato per la specificita' rispetto all'iperonimo comune.

Per creare le rappresentazioni unificate, vengono utilizzati i sensi di BabelNet
e se questi non sono trovati (il termine non e' presente nel vocabolario), si
utilizzano i *piped links* di Wikipedia. Essi non sono altro che hyperlinks che
appaiono negli articoli di Wikipedia per reindirizzare ad altri articoli.

### Weighted Overlap
Metrica per calcolare la similarita' semantica di vettori in NASARI, siccome
essi non sono numerici si calcola come la somma di tutti i ranghi (ordinati per
specificity) associati ai sensi che sono condivisi tra due vettori, normalizzata
per un'opportuno termine (sommatoria).
La similarita' che si basa sulla WO non e' nient'altro che il massimo della
radice quadrata della WO di due vettori.

## Automatic Summarization
Lo scopo dell'automatic summarization e' quello di produrre una versione
abbreviata di un documento (o di una collezione di essi), catturando le
informazioni salienti contenute in esso/i. Il testo prodotto deve essere
principalmente indicativo (referenziare i documenti per approfondimenti) e
informativo (coprire tutte le informazioni ritenute salienti). Ci sono due
tipologie di output di automatic summarization:

* Estratti: riassunti creati riutilizzando testo esistente in input. 
* Abstracts: creati ri-formulando i concetti presenti nel testo in input.

Generalmente gli approcci alla TS possono essere categorizzati in approcci
basati su:

* Statistici: coinvolgono il livello sintattico/lessicale, per cui spesso
  l'ouput e' un estratto in cui le parti sono prese dal testo. Utilizzano
  informazioni sulla frequenza delle parole, la loro collocazione, ecc. per cui
  essere significativi necessitano di una grande quantita' di testi. Non
  manipolando l'informazione a livello semantico, spesso producono testi di
  scarsa qualita', ma risultano buoni per riassunti in merito a delle queries
  (es. google)
* NLP: si basano su un'analisi semantica del testo seguita da una fase di
  generazione del linguaggio (NLG). L'idea e' quella di rappresentare il
  contenuto in una rappresentazione apposita per poi manipolarla. Questi
  approcci necessitano quindi di regole per la manipolazione di queste
  rappresentazioni. La qualita' dei testi prodotta e' notevole e supporta anche
  la generazione di abstracts.

Un possibile algoritmo per fare text summarization potrebbe essere riassunto dai
seguenti 3 passi:

* Selezione del contenuto: viene selezionata l'informazione (frasi) dal
  documento da riassumere in base alla saliency.
* Ordinamento delle informazioni: si ordinano e strutturano le unita'
  selezionate.
* Sentence realisation: vengono ripulite le unita' in modo che siano piu'
  coerenti nel nuovo contesto.

### Relevance Criteria
Un criterio utile per capire la rilevanza di elementi rispetto al suo contenuto
potrebbe essere dato dal posizionamento delle frasi. Tipicamente, infatti, le
frasi piu' importanti appaiono in delle sezioni specifiche del documento
(introduzione/conclusione). Abbiamo visto diversi approcci per determinare la
rilevanza delle frasi:

* Optimal Position Policy: le frasi sono collocate in delle posizioni "tipiche"
  del genere di articolo trattato. Si apprendono queste posizioni calcolando
  l'overlap dei termini del titolo del documento con le frasi. Successivamente
  si impone un ordine parizale sulle posizioni dove le frasi contengono parole
  importanti (cioe' presenti nel titolo).
* Cue Phrases: l'idea alla base di questo metodo si basa sull'osservazione che
  le frasi importanti contengono spesso dei "suggerimenti" (cues). Il metodo
  consiste nel definire delle parole *bonus* (comparativi, superlativi,
  espressioni conclusive) e parole *stigma* (negazioni, pronomi, ecc..). Ogni
  qual volta che una frase contiene delle parole bonus, allora si aumenta il suo
  score, mentre si riduce se contiene parole stigma. 
* Cohesion-Based: si basa sull'idea che le frasi/paragrafi importanti siano
  quelli le entita' piu' connesse rispetto ad una struttura semantica. Per
  determinarla si possono utilizzare diversi classi di approcci oppure una
  combinazione di essi.

 

