---
title: Riassunto Mazzei 
author: Matteo Brunello
numbersections: true
papersize: a4
geometry: margin=2.5cm
---

# Morfologia

## Algoritmo di Viterbi
L'algoritmo di Viterbi e' un algoritmo di programmazione dinamica per calcolare
in tempo polinomiale la sequenza di tag che massimizza la likelihood.
Questo perche' per un approccio naive, calcolare a mano tutte le possibili
sequenze richiederebbe un tempo esponenziale.
L'idea e' quella che si basa essenzialmente sul fatto che la probabilita' della
sequenza di tag $t_1, \dots, t_n$ che massimizza la verosimiglianza puo' essere
divisa essenzialmente in 2 parti:

1. La probabilita' della migliore sequenza di tag $t_1, \dots, t_{n-1}$.
2. Il massimo prodotto tra la probabilita' di transizione del tag $t_n$, dato
   $t_{n-1}$ e la probabilita' di osservazione della parola $w_n$ dato $t_{n}$.

Il prodotto di queste due parti, ci da la probabilita' della sequenza di tag con 
probabilita' massima, per cui possiamo essenzialmente sfruttare questo fatto per
costruire passo passo la sequenza, semplicemente selezionando ad ogni passo il
tag che massimizza la probabilita' (parte 2), e salvando la probabilita' massima
in un'opportuna struttura dati.
In altri termini
$$
\begin{split}
v_t(j) &= \max_{i=1}^N v_{t-1} a_{ij} b_j(o_t)\\
       &= \max_{i=1}^N v_{t-1} P(t_j \mid t_{i}) P(w_t \mid t_j)
\end{split}
$$
Tale struttura e' una matrice $T \times N$, dove $T$ e' il numero di PoS tags e
$N$ e' la lunghezza della frase. 

## NER Tagging
Il Named Entity Recognition e' il task di trovare le Named Entities in un testo,
cioe' qualsiasi elemento che puo' essere riferito con un nome proprio.
Alcuni esempi di tag comuni possono essere: 

* `LOC` (Location): New York City
* `PER` (Person): Pietro Smusi
* `ORG` (Organization): Stanford University

E' costituito da 2 sottotask:

1. Trovare gli span che costituiscono nomi propri
2. Taggare con i tag corretti questi span

### Difficolta'
Le difficolta' del NER tagging sono sottolineate da due ragioni principali:

1. **Segmentazione**: In questo caso, non assegnamo un tag ad ogni parola, ma
   dobbiamo trovare il segmento stesso da taggare
2. **Ambiguita'**: i nomi propri sono molto ambigui, ad esempio lo stesso nome
   potrebbe essere utilizzato per riferirsi ad organizzazioni, persone e posti
   diversi (es. Washington).

### Risoluzione della segmentazione
Possiamo risolvere il problema della segmentazione del NER tagging con il BIO
tagging. In questo caso si trasforma il problema andando a introdurre 3 tag:

* `B` - Begin
* `I` - Inside
* `O` - Outside

I tag di `B` (Begin) e `I` (Inside) vengono tipati con il tipo del tag NER (es.
`B-Person`), in questo modo si risolve il problema della segmentazione
poiche' si ha un tag per ogni parola.

## Differenze tra HMM e MEMM
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
l'ipotesi di Bayes ma semplicemente si applica un'ipotesi di in$$dipendenza e di
Markov, per cui il modello risultante e' il seguente
$$
\hat{t}_1^n = \arg \max_{t_1^n} \prod_{i=1}^n P(t_i \mid t_{i-1}, w_i)
$$
Questa probabilita' e' modellata utilizzando un modello di regressione lineare
su un template di features linguistiche scelte $\vec{w} \cdot \vec{f}$.
L'apprendimento consiste nello scegliere il vettore $\vec{w}$ tale per cui la
probabilita' del tag giusto sia massima. Nonostante sia evidente che MEMM sia
piu' flessibile poiche' permette di utilizzare features linguistiche arbitrarie,
questa flessibilita' viene pagata in termini di complessita' nella fase di
learning. Inoltre, alcuni ottimizzatori potrebbero anche non riuscire ad
ottenere una configurazione (sub) ottimale per i pesi.

D'atra parte, l'apprendimento di un HMM consiste semplicemente nel fare un count
delle occorrenze nel corpus, per cui e' molto meno oneroso e molto meno
suscettiible alla stocasticita' degli ottimizzatori. D'altra parte, e' molto
meno flessibile poiche' l'unica feature linguistica su cui si basa e' la parola
stessa e il tag attuale.

Entrambi i modelli soffrono del problema della *sparseness*, cioe' quando si
incontrano parole non conosciute. In questo caso si possono impiegar diverse
tecniche tra le quali risaltano: supporre sia un nome oppure associare la
probabilita' degli altri tags.

---

# Sintassi

## Chomsky e la sua gerarchia
Chomsky differenzia tra la **competence** (cioe' la competenza grammaticale) e
la **performance** (come questa competenza viene utilizata nella comunicazione).
Secondo lui il linguaggio naturale (la competence) puo' essere modellato per
mezzo delle Grammatiche Generative, cioe' dei sistemi formali di riscrittura
ispirati a Turing e Post. Formalmente una grammatica generativa e' una quadrupla
$\langle \Sigma, V, S, P \rangle$ dove:

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

## Parser Top Down/Bottom Up
Il parser top-down parte dalla radice $S$ e facendosi guidare dalla grammatica,
genera i vari alberi che possono anche non essere compatibli con la frase.
Il parser bottom-up, parte dalle foglie (le parole) e regredisce eventualmente
le varie regole della grammatica, per cui si fa guidare dalle parole. Ne segue
che tutti gli alberi sono compatibili con le parole ma non tutti sono ben
formati (hanno $S$ come radice).

## Grammatica CCG
Una Combinatory Categorial Grammar e' una grammatica bottom up (si parte dalle
parole e si costruisce mano a mano l'albero) dove gli elementi principali sono
delle categorie di parole. Queste categorie poi vengono combinate con altre
categorie per mezzo di opportune regole di combinazione. Ad esempio, il verbo
*amare* e' una categoria che cerca un qualche altro elemento alla sua sinistra
(soggetto) e un'altro elemento alla sua destra (complemento oggetto) con cui
combinarsi.

## Sintassi a Dipendenze
La sintassi a dipendenze postula che la struttura sintattica di una frase
consiste di elementi lessicali legati tra loro da relazioni binarie asimmetriche
chiamate **dipendenze**. Queste relazioni presuppongono una **head** e un
**dipendente** (modifier, inferior, subordinate).

Questo tipo di grammatiche, non hanno valenza generativa come quelle a
costituenti, bensi' hanno solo valenza di **schema di annotazione**.
Per stabilire se un sintagma e' un head o un dipendente, si utilizzano criteri
morfologici, sintattici e semantici guidati quindi dalla linguistica.

### Vantaggi

* Generalizzazione tra tutti i linguaggi.
* Trasparenza e semplicita' di rappresentazione.
* Identifica le relazioni sintattiche immediatamente.
* Le coppie di dipendenze possono essere buone features per classificatori e
  fare information extraction.

## Grammatiche a dipendenze: Algoritmi di parsing
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

## Ambiguita' sintattica: PP Attachment & Coordination Ambiguity
L'ambiguita' sintattica (structural ambiguity) nasce dal momento che ci possono
essere piu' alberi di derivazione validi. Due casi degni di nota sono:

* **Attachment Ambiguity**: si verifica quando c'e' un'ambiguita' nella
  separazione tra una preposizione e la sua clausola. Questo puo' verificarsi
  quando una proposizione puo' essere legata a due o piu' frasi. Ad esempio:
  *"Ho parlato col il Professore di matematica nel suo ufficio"* puo' voler dire
  *"Ho parlato di matematica con il Professore nel suo ufficio"* oppure *"Ho
  parlato con il professore di matematica nel suo ufficio"*
* **Coordination ambiguity**: si verifica quando una frase contiene una serie di
  elementi o frasi coordinate che possono essere interpretati in modi diversi a
  causa dell'ambiguita' nella loro struttura o posizione. Ad esempio, in *"Ho
  visto Maria e Paolo baciarsi"* la coordinazione *"e"* puo' essere interpretata
  come *"Ho visto Maria e ho visto Paolo baciarsi"* (anche in momenti diversi)
  oppure *"Ho visto Maria e Paolo baciarsi"* (nello stesso momento)

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

### Problematiche
Il primo problema e' che le dipendenze che vengono create non sono tipate. In
questo caso, si potrebbe risolvere creando appositamente delle operazioni del
tipo `LEFT_subj`, `RIGHT_subj`, per cui quando vengono eseguite creano la
relazione tipata. In questo caso pero' il numero di operazione crescerebbe
considerevolmente in relazione al numero di PoS tag diversi ($2n+1$ operazioni
per $n$ PoS tags).

Il secondo problema e' dovuto alla scelta dell'oracolo, cioe' la scelta
dell'algoritmo che sceglie effettivamente l'azione da eseguire.

### Costruzione dell'oracolo
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

## Algoritmo CKY
Caratteristiche:

* **Grammatica**: Chomsky Normal Form (CF).
* **Algoritmo**: Bottom-Up, Dynamic Programming.
* **Oracolo**: Rule-Based.

L'algoritmo CKY e' un algoritmo di parsing dinamico e bottom up che calcola
tutti i possibili alberi di parsing di una frase in tempo $O(n^3)$, controllando
di fatto l'esplosione combinatoria dovuta all'ambiguita' strutturale sintattica.
L'algoritmo funziona solo su grammatiche in Chomsky Normal Form (cioe'
grammatiche che possono produrre solo 2 simboli non-terminali o solo un simbolo
terminale).
L'idea dell'algoritmo si basa sull'intuizione che se esiste una regola $A
\rightarrow B C$, e $A$ copre dalla posizione $i$ alla posizione $j$, allora
$\exists k \; : \; i < k < j$ in cui $B$ copre $i \dots k$ e $C$ copre $k \dots
j$. Se noi memorizziamo per ogni *span* le regole che coprono tale span,
possiamo riutilizzarle senza doverle ricalcolare.

CKY utilizza quindi una matrice $N \times N$ (con $N$ numero di parole della
frase) in cui, nella posizione $(i, j)$ vengono memorizzate le regole che
coprono lo span $i \dots j$. L'algoritmo, considerando la parola $j$-esima,
inserisce inizialmente nella matrice alla posizione $(j, j)$ tutte le regole che
coprono tale parola. Questo e' appunto ragionevole siccome lo span $j \dots j$
coincide con la singola parola che si sta considerando.

Successivamente, l'algoritmo considera tutti i possibili span dall'inizio della
parola ($0$) fino a $j$ e per ogni span tutti i possibili split $k$. Per ognuno
di essi, ci si chiede se esiste una regola $A \rightarrow BC$ tale per cui $B$
copre lo span $i \dots k$ e $C$ copre lo span $k \dots j$ (lo sappiamo perche'
sono state salvate precedentemente nella tabella). Se cio' avviene, allora $A$
copre $i \dots j$, per cui viene inserita nella tablla alla posizione $(i,j)$.

Si noti che la complessita' e' $O(n^3)$ poiche' ci sono 3 cicli `for` innestati:

1. Scorre tutte le parole
2. Scorre tutti i possibili *span* fino alla parola attuale
3. Scorre tutti i possibili *split* dello span attuale

## Difetti

* Il caso peggiore e il caso medio coincidono
* Necessita di una grammatica in CNF

## Algoritmo CKY (Probabilistico)
Caratteristiche:

* **Grammatica**: Probabilistic CF.
* **Algoritmo**: Bottom-Up, Dynamic Programming.
* **Oracolo**: Probabilistic.

CKY genera tutti gli alberi possibili, pero' non si ha modo di decidere quale
fra questi sia il piu' adatto. Secondo questa variante, un albero di derivazione
ha associata una probabilita' che e' il prodotto di tutte le regole che sono
state utilizzate nella derivazione.
Essenzialmente si va a costruire l'albero piu' probabile andando a selezionare
la regola di derivazione piu' probabile. Per fare cio' viene definita una
distribuzione di probabilita' sulle regole della grammatica. Ogni non terminale
e' associato ad una probabilita' tale per cui:

* $A \rightarrow \beta[p]$ con $p \in [0, 1]$
* $\sum_\beta P(A \rightarrow \beta) = 1$

Le probabilita' vengono calcolate a partire da un tree bank nel modo seguente
$$
P(\alpha \rightarrow \beta \mid \alpha) =
\frac{Count(\alpha \rightarrow \beta)}{Count(\alpha)}
$$

---

# Semantica

## Semantica Argomentale
La semantica di cui abbiamo discusso a lezione e' la semantica argomentale,
cioe' ci dice chi ha fatto cosa (struttura predicato argomento), non ci dice,
per esempio, quando questa cosa e' stata fatta, per cui si ignora la componente
temporale.
Per modellare questa semantica si utilizza la logica del prim'ordine perche' e'
un buon compromesso tra facilita' di rappresentazione e a livello di
complessita' di computazione.

## Principio di composizionalita' di Frege
Il principio di composizionalita' di Frege e' un principio secondo il quale il
significato di una frase e' in funzione del significato delle sue componenti e
di come questi significati sono combinati tra loro.
Da questo principio ne deriva un algoritmo fondamentale della linguistica
computazionale, che consiste nei seguenti passaggi:

1. Parsifica la frase ottenendo l'albero sintattico.
2. Cerca la semantica per ogni sintagma.
3. Componi la semantica fino a risalire al significato della frase.

## Semantica di Montague
La semantica di Montague e' un formalismo che unisce la logica del prim'ordine e
il lambda calcolo. Questo perche' il lambda calcolo serve a superare delle
limitazioni intrinseche della logica del prim'ordine, poiche' esso e' solamente
un formalismo di *rappresentazione* e non di calcolo. Due limitazioni principali
sono:

1. Non e' possibile rappresentare predicati con variabili libere
2. Non e' possibile imporre un ordine preciso di applicazione dei predicati

Con l'introduzione del lambda calcolo risolviamo entrambi i problemi. A questo
punto, le grammatiche vengono annotate con delle lambda astrazioni in cui
vengono specificate anche le regole di composizione. 


## Rappresentazione di Articoli e Sostantivi
Per rappresentare articoli, bisogna permettere l'astrazione anche sui predicati,
per cui se volessimo rappresentare *"un"* avremo:
$$
\lambda P. \lambda Q. \exists z (P(z) \land Q(z))
$$

## Rappresentazione di Avverbi
Per rappresentare avverbi, invece, non possiamo utilizzare l'avverbio come
predicato e passargli come argomento l'altro predicato, questo perche' si
otterrebbe una logica del second'ordine. Ad esempio:
$$
sweetly(love(Paolo, Francesca))
$$
Si potrebbe invece pensare di aggiungere un argomento al predicato che funga da
modificatore
$$
love(Paolo, Francesca, sweetly)
$$
Ma questa soluzione non e' particolarmente elegante. Si decide quindi di
*reificare* l'evento, cioe' identificare con una variabile un **evento**
$$
\exists e \; : \; love(e, Paolo, Francesca) \land sweetly(e)
$$
Questo modo di rappresentare gli avverbi puo' anche essere scritto in un'altra
maniera detta *Neo-Davidsoniana* in cui essenzialmente vengono generalizzati
anche gli argomenti (si normalizzano tutti i predicati ad avere 2 soli
argomenti)
$$
\exists \; : \; love(e) \land agent(e, Paolo) \land patient(e, Francesca) \land
sweetly(e)
$$
Questa formulazione rispetta anche la transitivita' e offre una modellazione
piu' sistematica. Mentre in Montague si hanno predicati *n*-ari in base ai
modificatori, nello stile Neo-Davidsoniano si hanno invece solo predicati unati
e i modificatori sono esplicitati con i luoghi semantici.

---

# Natural Language Generation

## Quali sono le differenze tra Referencing Expression e Lexicalization?

## Perche' l'architettura dell'NLG e' divisa in 3 fasi?

---

# Dialogue Systems


---

# Esercizi e Miscellanee

## Qual'e' la differenza tra ambiguita' sintattica e ambiguita' semantica?

## Esercizio 1 (Viterbi) 

## Esercizio 2 (CKY)

## Esercizio 3 (MALT)

## Esercizio 4 (Montague)

## Esercizio 5 (Neo-Davidsonian Style)
