# Possibili domande orali - Mazzei

## Algoritmo di Viterbi
L'algoritmo di Viterbi e' un algoritmo di programmazione dinamica per calcolare
in tempo polinomiale la sequenza di tag che massimizza la likelihood.
Questo perche' per un approccio naive, calcolare a mano tutte le possibili
sequenze richiederebbe un tempo esponenziale.
L'idea e' quella che si basa essenzialmente sul fatto che se una sequenza di tag
$t_1, \dots, t_n$ e' quella con probabilita' massima, allora sara' 

// TODO: Finire

## Cos'e' il NER tagging?
Il Named Entity Recognition e' il task di trovare le Named Entities in un testo,
cioe' qualsiasi elemento che puo' essere riferito con un nome proprio.
Alcuni esempi di tag comuni possono essere: 

* `LOC` (Location): New York City
* `PER` (Person): Pietro Smusi
* `ORG` (Organization): Stanford University

E' costituito da 2 sottotask:

1. Trovare gli span che costituiscono nomi propri
2. Taggare con i tag corretti questi span

### Perche' e' difficile?
Per due ragioni principali:
1. **Segmentazione**: In questo caso, non assegnamo un tag ad ogni parola, ma
   dobbiamo trovare il segmento stesso da taggare
2. **Ambiguita'**: i nomi propri sono molto ambigui, ad esempio lo stesso nome
   potrebbe essere utilizzato per riferirsi ad organizzazioni, persone e posti
   diversi (es. Washington).

### Come possiamo risolvere il problema della segmentazione?
Possiamo risolvere il problema della segmentazione del NER tagging con il BIO
tagging. In questo caso si trasforma il problema andando a introdurre 3 tag:

* `B` - Begin
* `I` - Inside
* `O` - Outside

I tag di `B` (Begin) e `I` (Inside) vengono tipati con il tipo del tag NER (es.
`B-Person`), in questo modo si risolve il problema della segmentazione
poiche' si ha un tag per ogni parola.

## Differenze tra HMM e MEMM. Pro/Contro e differenze a livello di probabilita'
Le differenze sono su diversi livelli:
* **Tipologia di modello**: HMM e' un modello *generativo* mentre MEMM e'
  *discriminativo*.
* **Fase di learning**: HMM necessita solo dei counts delle occorrenze, MEMM
  necessita di algoritmi di ottimizzazione che potrebbero anche non convergere
  mai ad un ottimo locale
* **Informazione utilizzata**: HMM e' in grado di utilizzare come features
  solamente la parola corrente, MEMM puo' utilizzare qualsiasi feature
  linguistica booleana 

A livello tecnico, le differenze sono anche a livello di probabilita'. Come
detto, in HMM si ha un modello generativo, per cui, data una sequenza di tag
vogliamo generare la sequenza di parole piu' verosimile. Per far cio'
applichiamo Bayes alla formulazione del problema e otteniamo il modello
$$
\hat{t}_1^n = \arg \max_{t_1^n} \prod_{i=1}^n P(w_i \mid t_i)P(t_i \mid t_{i-1})
$$
In MEMM, invece, abbiamo un modello discriminativo per cui non si applica
l'ipotesi di Bayes ma semplicemente si applica un'ipotesi di indipendenza e di
Markov, per cui il modello risultante e' il seguente
$$
\hat{t}_1^n = \arg \max_{t_1^n} \prod_{i=1}^n P(t_i \mid t_{i-1}, w_i)
$$
Questa probabilita' e' modellata utilizzando un modello di regressione lineare
su un template di features linguistiche scelte $\vec{w} \cdot \vec{f}$.
L'apprendimento consiste nello scegliere il vettore $\vec{w}$ tale per cui
la probabilita' del tag giusto sia massima.

Entrambi i modelli soffrono del problema della *sparseness*, cioe' quando si
incontrano parole non conosciute. In questo caso si possono impiegar diverse
tecniche tra le quali risaltano: supporre sia un nome oppure associare la
probabilita' degli altri tags.

## Problema dell'espressivita' delle lingue naturali. Mi parli di Chomsky, della sua gerarchia e delle grammatica Mildly Context Sensitive
Chomsky differenzia tra la **competence** (cioe' la competenza grammaticale) e
la **performance** (come questa competenza viene utilizata nella comunicazione).
Secondo lui il linguaggio naturale (la competence) puo' essere modellato per
mezzo delle Grammatiche Generative, cioe' dei sistemi formali di riscrittura
ispirati a Turing e Post. Formalmente una grammatica generativa e' una quadrupla
$<\Sigma, V, S, P>$ dove:

* $\Sigma$ e' l'alfabeto
* $V$ e' l'insieme dei simboli non-terminali
* $S$ e' lo *starting symbol*
* $P$ e' un insieme di regole di riscrittura $\theta \rightarrow \gamma$

Queste grammatiche sono in grado sia di modellare la struttura sintattica di una
frase che di generarla. L'ipotesi e' che i vari simboli non terminali modellino
i costituenti della frase. Chomsky individua anche una gerarchia di diverse
grammatiche, ognuna con capacita' espressiva differente (espressivita'
crescente):

* Linear 
* Context-Free
* Context-Sensitive
* Type 0

Una domanda che imperverso' nella ricerca per molto tempo fu quindi quella di
stabilire a quale categoria appartenga il linguaggio umano. Inizialmente si
ipotizzo' fosse CF, ma il Tedesco Svizzero non lo e', per cui invalidava
l'ipotesi. Ci furono quindi diverse proposte a riguardo, che culminarono con
l'invenzione delle grammatiche Mildly Context Sensitive. Alcune di queste
grammatiche appartenenti a questa categoria degne di nota sono:

* Tree Adjoining Grammars (strutture ad albero e operazioni di adjoining e
  substitution)
* Head Grammars
* Linear Indexed Grammars
* Combinatory Categorial Grammars (bottom up, categorie di elementi atomici che
  si combinano attraverso regole di combinazione)

## Che differenza c'e' tra un parser top down e un parser bottom up?
Il parser top-down parte dalla radice $S$ e facendosi guidare dalla grammatica,
genera i vari alberi che possono anche non essere compatibli con la frase.
Il parser bottom-up, parte dalle foglie (le parole) e regredisce eventualmente
le varie regole della grammatica, per cui si fa guidare dalle parole. Ne segue
che tutti gli alberi sono compatibili con le parole ma non tutti sono ben
formati (hanno $S$ come radice).

## Cos'e' una grammatica CCG? Mi parli di questo paradigma
Una Combinatory Categorial Grammar e' una grammatica bottom up (si parte dalle
parole e si costruisce mano a mano l'albero) dove gli elementi principali sono
delle categorie di parole. Queste categorie poi vengono combinate con altre
categorie per mezzo di opportune regole di combinazione. Ad esempio, il verbo
*amare* e' una categoria che cerca un qualche altro elemento alla sua sinistra
(soggetto) e un'altro elemento alla sua destra (complemento oggetto) con cui
combinarsi.

## In cosa consiste la sintassi a dipendenze?
La sintassi a dipendenze postula che la struttura sintattica di una frase
consiste di elementi lessicali legati tra loro da relazioni binarie asimmetriche
chiamate **dipendenze**. Queste relazioni presuppongono una **head** e un
**dipendente** (modifier, inferior, subordinate).

## Algoritmi di parsing per grammatiche a dipendenze
Ci sono diversi algoritmi di parsing per le grammatiche a dipendenze:

* **Programmazione Dinamica**: e' possibile utilizzare una versione modificata
  di CKY, ma ha la complessita' computazionale pari a $O(n^5)$.
* **Graph Algorithms**: si crea un MST per la frase in un grafo in cui le parole
  sono i nodi e gli archi sono le dipendenze. I vari archi sono pesati e questi
  pesi vengono appresi da un ML classifier.
* **Parsing a costituenti + Conversione**: parsing di una grammatica con un
  algoritmo di parsing a costituenti noto e converto successivamente il
  risultato in formato a dipendenze secondo delle tabelle di percolazione
  derivate dalla teoria X-Bar.
* **Parsing Deterministico**: parsing che ad ogni run ritorna un singolo albero
  di parsing, guidato da Machine Learning Classifiers che prendono scelte
  greedy.
* **Constraint Satisfaction**: vengono eliminate tutte le possibili dipendenze
  che non soddisfano determinati vincoli.

## Mi parli dell'ambiguita' sintattica (PP attachment e coordination ambiguity)
L'ambiguita' sintattica (structural ambiguity) nasce dal momento che ci possono
essere piu' alberi di derivazione validi. Due casi degni di nota sono:
* **Attachment Ambiguity**: si verifica quando c'e' un'ambiguita' nella
  separazione tra una preposizione e la sua clausola. Questo puo' verificarsi
  quando una proposizione puo' essere legata a due o piu' frasi. Ad esempio:
  *"ho parlato col il Professore di matematica nel suo ufficio"* puo' voler dire
  *"ho parlato di matematica con il Professore nel suo ufficio"* oppure *"ho
  parlato con il professore di matematica nel suo ufficio"*
* **Coordination ambiguity**: si verifica quando una frase contiene una serie di
  elementi o frasi coordinate che possono essere interpretati in modi diversi a
  causa dell'ambiguita' nella loro struttura o posizione. Ad esempio, in *"ho
  visto Maria e Paolo baciarsi"* la coordinazione *"e"* puo' essere interpretata
  come "Ho visto Maria e ho visto Paolo baciarsi" (anche in momenti diversi)
  oppure "Ho visto Maria e Paolo baciarsi" (nello stesso momento)

## A cosa serve il Lambda Calcolo?

## Algoritmo CKY (Cos'e' e a cosa serve. Simulazione algoritmo su carta)

## Come rappresentare articoli e sostantivi nel lambda calcolo?

## Semantica formale e composizionale con esercizio (Montague)

## Mi parli della Semantica di Montague

## Cos'e' la Sintassi a dipendenze

## Qual'e' la differenza tra ambiguita' sintattica e ambiguita' semantica?

## Quali sono le differenze tra Referencing Expression e Lessicalizzazione?

## Perche' l'architettura dell'NLG e' divisa in 3 fasi?

## Algoritmo di parsing TUP
Caratteristiche:
* **Grammatica**: Dipendenze.
* **Algoritmo**: Bottom-Up, Depth-First.
* **Oracolo**: Rule-Based.

Algoritmo per la parsificazione di grammatiche a dipendenze basato su 3
passaggi: Chunking, Coordination e VerbSub-Cat. 

## Algoritmo di parsing MALT
Caratteristiche:
* **Grammatica**: Dipendenze.
* **Algoritmo**: Bottom-Up, Depth-First.
* **Oracolo**: Probabilistico.

E' un algoritmo per la parsificazione di grammatiche a dipendenze. E' detto
"deterministico" perche' ad ogni run, si ottiene un singolo albero di
dipendenze, contrariamente a come succede con CKY. L'algoritmo si basa su il
concetto di automa. Lo stato di questo automa e' composto da:

* Input buffer: contiene le parole mancanti da analizzare.
* Stack: contiene le parole attualmente analizzate.
* Dependency relations: contiene le dipendenze tra le parole create fino al
  momento attuale.

Su questo stato si possono applicare 3 operazioni principali:

* `SHIFT`: prende la prossima parola dalla lista (rimuovendola) e la inserisce
  in cima allo stack.
* `LEFT`: fa pop della parola ($b$) sullo stack ($b = pop(stack)$) e crea una
  dipendenza $(a, b)$ con la prossima parola della lista ($a$).
* `RIGHT`: fa pop della parola ($b$) sullo stack ($b = pop(stack)$), crea una
  dipendenza $(b, a)$ con la prossima parola della lista ($a$), rimuove $a$
  dalla lista e inserisce al suo posto $b$.

L'algoritmo pare da uno stato iniziale in cui l'input buffer e' pieno (contiene
tutta la frase) e lo stack vuoto, e applica ad ogni passo l'operazione che viene
suggerita dall'oracolo fino a quando non si raggiunge uno stato finale in cui
l'input buffer e lo stack sono vuoti e la dependency relations non e' vuota.

### Di quali problemi soffre?
Il primo problema e' che le dipendenze che vengono create non sono tipate. In
questo caso, si potrebbe risolvere creando appositamente delle operazioni del
tipo `LEFT_subj`, `RIGHT_subj`, per cui quando vengono eseguite creano la
relazione tipata. In questo caso pero' il numero di operazione crescerebbe
considerevolmente in relazione al numero di PoS tag diversi ($2n+1$ operazioni
per $n$ PoS tags).

Il secondo problema e' dovuto alla scelta dell'oracolo, cioe' la scelta
dell'algoritmo che sceglie effettivamente l'azione da eseguire.

### Come si costruisce l'oracolo? 
L'oracolo e' un Machine Learning Classifier che viene addestrato sui vari stati
del programma. Bisogna inoltre stabilire:

* **Features linguistiche significative**: bisogna selezionare le features dello
  stato che sono piu' significative ai fini della classificazione. Tipiche
  features possono riguardare le *posizioni* nello stato e gli *attributi* di
  alcune parole.
* **Dataset**: costruito per mezzo del Dependency Tree Bank, facendo reverse
  engineering degli alberi e ottenendo dei passi dell'algoritmo (si apprende su
  "storie" di esecuzione di azioni)
* **Algoritmo di training**: che deve far apprendere i pesi che vanno a
  massimizzare lo score della transizione corretta per tutte le configurazioni
  nel training set

