# Ontologie computazionali
Con ontologia in computer science si intende un artefatto artificiale, costituito da specifici
vocabolari utilizzati per descrivere una certa realta', e un insieme di assunzioni esplicite
riguardo al significato del vocabolario stesso (Guarino, 1998). L'uso del termine "ontologia"
nell'informatica deriva dal precedente uso dello stesso termine in filosofia, dove ha il significato
dello studio dell'essere e del divenire dello spirito che modella gli enti - le entità soggette al
divenire. Così come nella filosofia anche in informatica l'ontologia descrive le entità, in quanto
soggette al cambiamento, con i concetti fondamentali di categoria e di relazione. Le entità non sono
dunque definite una volta per tutte in maniera assoluta - non sono cioè metafisiche, ma assumono
significato in base alle relazioni che possono stringere con altre entità. Il potenziale delle
relazioni che un'entità può stringere è limitato dalla propria essenza, definita come una categoria
della nostra ontologia, che altro non è che una tassonomia delle entità - es. un corvo in quanto
volatile non può vivere sott'acqua e in quanto non mammifero non può allattare il suo cucciolo , un
delfino in quanto cetaceo può fare entrambe le cose, tutti e due gli animali, in quanto animali
possono uccidere un altro animale, nessuno dei due in quanto non umani può insegnare all'Università
[@wiki_ontology].
Le ontologie si basano su linguaggi che permettono di descrivere in maniera esplicita le proprieta'
delle classi e le proprieta' delle relazioni tra le classi. Tramite questi linguaggi le macchine poi
possono fare inferenze sui concetti.  
Una possibile classificazione delle ontologie fa riferimento al loro livello di specificita':

* Ontologie top-level o fondazionali: definisce e descrive concetti fondazionali a tutti i domini. 
* Ontologie mid-level: definiscono e descrivono concetti generali utilizzando i concetti definiti
  nelle ontologie fondazionali. 
* Domain ontologies: rappresentano i concetti  e le relazioni proprie di un dominio specifico, anche
  mediante l'uso di concetti definiti con ontologie a livelli inferiori.

Le ontologie possono essere anche categorizzate in due categorie principali:

* Lightweight: normalmente sono delle semplici tassonomie senza assiomi e con poche relazioni per
  facilitarne la standardizzazione. Esempi di questa tipologia di ontologie sono Wordnet, Tesauri,
  Soggettari, Iconclass
* Large-Scale: ontologie di grandi dimensioni. Possono essere ottenute tramite l'estrazione
  automatica di concetti da testi, dall'integrazione di risorse diverse oppure dal lavoro di una
  comunita' di utenti via *crowd sourcing*. Esempi di ontologie large scale sono CYC, YAGO, YAGO2 e
  DBPedia.

Vediamo ora nel dettaglio alcune delle ontologie citate.
  
## CYC 
CYC (*enCYClopedic Knowledge*) e' un progetto che mira ad assemblare un'ontologia e una knowledge
base che racchiuda concetti base e regole su come il mondo funzioni. L'idea e' quella di catturare
la conoscenza di senso comune, concentrandosi anche a rappresentare la conoscenza implicita. Ne
esiste una versione open source (OpenCyc) che comprende circa 200.000 concetti.  
La Knowledge Base di CYC e' composta essenzialmente da due elementi principali:

* Termini: formano il vocabolario di CYC
* Asserzioni: mettono in relazione i termini 

Le asserzioni sono a loro volta categorizzabili come:

* Asserzioni semplici
* Regole

Un'altra caratteristica importante della knowledge base di CYC e' il fatto che sia divisa in
microteorie (*microtheories*), cioe' un insieme di asserzioni che condividono le stesse assunzioni.
Ogni microteoria si focalizza su un particolare dominio della conoscenza. Questa suddivisione
permette al motore inferenziale di fare asserzioni che sarebbero apparentemente contraddittorie.  
Il motore inferenziale e' in grado di effettuare la deduzione logica (*modus ponens, modus tollens,
quantificazione esistenziale e universale*) e i meccanismi di inferenza tipici dell'IA
(*ereditarieta', classificazione automatica*).
Attualmente CYC e' utilizzata in applicazioni quali:

* Modellazione della conoscenza
* Apprendimento e pattern recognition
* Assistenti intelligenti
* Sicurezza delle reti
* Intelligent analysis, basi di dati, ecc.

## Ontologia SUMO 
SUMO (*Suggested Upper Merged Ontology*) e anch'esso un progetto mirato alla creazione di
un'ontologia fondazionale per la rappresentazione di conoscenza di senso comune. SUMO utilizza una
gerarchia di classi e un insieme di relazioni tra di esse per rappresentare la conoscenza. Il
linguaggio con cui e' scritta e' il KIF (*Knowledge Interchange Format*).
Per ogni classe, esiste un insieme di assiomi che ne descrivono le caratteristiche. Gli assiomi a
loro volta sono espressi utilizzando le relazioni contenute nell'ontologia. 

## YAGOSUMO
E' l'integrazione di milioni di entita' di YAGO (basata su Wikipedia e Wordnet) in SUMO. La
combinazione di queste due grosse ontologie ha dato vita a un'enorme quantita' di conoscenza
formalizzata, che puo' essere utilizzata da strumenti di ragionamento automatico. YAGOSUMO sfrutta
quindi la conoscenza assiomatica di SUMO per poter effettuare delle forme di ragionamento automatico
piu' avanzate che non sarebbero possibili su YAGO. 



