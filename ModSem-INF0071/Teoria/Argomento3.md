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

## SUMO 
SUMO (*Suggested Upper Merged Ontology*) e anch'esso un progetto mirato alla creazione di
un'ontologia fondazionale per la rappresentazione di conoscenza di senso comune. SUMO utilizza una
gerarchia di classi e un insieme di relazioni tra di esse per rappresentare la conoscenza. Il
linguaggio con cui e' scritta e' il KIF (*Knowledge Interchange Format*).
Per ogni classe, esiste un insieme di assiomi che ne descrivono le caratteristiche. Gli assiomi a
loro volta sono espressi utilizzando le relazioni contenute nell'ontologia. 

## YAGOSUMO
E' l'integrazione di milioni di entita' di YAGO (basata su Wikipedia e Wordnet) in SUMO. La
combinazione di queste due grosse ontologie ha dato vita a un'enorme quantita' di conoscenza
formalizzata, che puo' essere utilizzata da strumenti di ragionamento automatico. 
Ogni termine di WordNet viene mappato con la classe corrispondente di SUMO.
YAGOSUMO sfrutta poi la conoscenza assiomatica di SUMO per poter effettuare delle forme di
ragionamento automatico piu' avanzate che non sarebbero possibili su YAGO. 

## YAGO2

E' la versione piu' recente di YAGO, e' un'ontologia derivata da Wikipedia, WordNet e GeoNames.
Contiene piu' di 10 milioni di entita'. 

## Dbpedia
E' un'iniziativa semantica di Wikipedia. E' stata costruita a partire da Wikipedia tramite strumenti
automatici. 

## OWL [@owl2_primer]
OWL2 e' un linguaggio per creare ontologie per il web semantico con un significato definito
formalmente. Le ontologie scritte in OWL2 contengono classi, individui e letterali, definiti
all'interno di documenti il cui formato e' stabilito dal web semantico (RDF/XML, Turtle, ecc..).  In
generale, dal momento che OWL e' costruito al di sopra di RSF/RSFS, le ontologie OWL2 sono
codificate in documenti RDF in modo automatico.  OWL si basa su logiche computazionali in modo che
la conoscenza espressa nell'ontologia possa essere oggetto di ragionamento automatico da parte di
software specifici chiamati *reasoner*. Tali software verificano la non contradditorieta'
dell'ontologia e sono in grado di rendere esplicita la conoscenza implicita contenuta
nell'ontologia, attraverso specifici meccanismi di inferenza. Una caratteristica particolare di OWL
e' che non permette di descrivere in maniera prescrittiva la struttura di un documento. Cio'
significa che non e' possibile specificare che una determinata informazione deve essere
necessariamente presente (al contrario di un database relazionale ad esempio).  
Cosi' come nelle logiche descrittive, un'ontologia puo' essere suddivisa in due parti principali: La
terminologia (o vocabolario, o T-Box) che costituisce la conoscenza generale sul dominio dato, e un
insieme di asserzioni (o A-Box) che descrivono entita' concrete o specifiche del dominio.  
Ogni entita' presente nell'ontologia deve essere dichiarata all'interno dell'ontologia. Ovviamente,
ogni entita' deve avere un IRI che deve far parte dell'ontologia. Inoltre, e' necessario anche
specificare a che tipo di entita' appartiene l'IRI (individuo, classe, datatype, object property,
data property, ecc..).
Piu' precisamente, gli elementi costituenti di un'ontologia sono:

* **Individui**: oggetti del dominio concettuale che appartengono ad una o piu' classi (non disgiunte) 
* **Classi**: categorie degli oggetti del dominio 
* **Proprieta'**: 
    - Object properties: collegano individui a individui
    - Datatype properties: assegnano un dato a un individuo (es. eta' ad una persona) 
    - Annotation properties: contengono commenti e descrizioni sulle entita' per facilitare il
      mapping tra l'ontologia e il linguaggio naturale
* **Assiomi di classe**: permettono di esprimere relazioni di sottoclasse (`SubClassOf`), equivalenza
  (`EquivalentClasses`), disgiunzione (`DisjointClasses`) e di unione disgiunta tra classi
  (`DisjointUnion`).  
* **Espressioni**: Le entita' possono essere combinate a formare espressioni usando dei costruttori
  di classi. Le cosiddette espressioni di classe rappresentano insiemi di individui, specificando
  formalmente le condizioni e le proprieta' che devono rispettare le singole entita'. Le entita' che
  rispettano tali condizioni sono dette *istanze* della class expression. Ad esempio, il concetto di
  professoressa potrebbe essere costruito tramite congiunzione dei concetti *docente* e *donna*.
  Tramite le class expression quindi si possono descrivere dei concetti sulla base di altri
  concetti. *Nota*: Il tipo piu' semplice di class expression e' la classe stessa.  
  Gli operatori forniti da OWL2 per definire le classi sono:
    - Connettivi booleani
    - Quantificazione universale ed esistenziale
    - Restrizioni numeriche o di cardinalita'
    - Enumerazione di individui

In sintesi, in OWL2 si distinguono *classi, individui* e *proprieta'*. Le *class expressions* cosi'
come le *property expressions* permettono di descrivere classi e proprieta'. Gli *assiomi di classe*
permettono di stabilire relazioni tra classi.

### Elementi di sintassi
Vediamo ora alcuni esempi di OWL utilizzando la sintassi `Turtle` e `RDF/XML`.
Per definire una classe, di dice che essa appartiene al tipo di classe di OWL. Per definire ad
esempio la classe `Person`: 
```xml
# Person e' una Classe
:Person rdf:type owl:Class;
```
`rdf:type` ha un duplice utilizzo, poiche' oltre a definire una certa classe permette anche di
specificare che un certo individuo appartiene a (*e' istanza di*) una certa classe.
```xml
# Mary e' una persona
:Mary rdf:type :Person;
```
Ovviamente, un certo individuo puo' appartenere a piu' classi, per cui e' valida anche la seguente
asserzione
```xml
# Mary e' una persona, una donna e un'insegnante 
:Mary rdf:type :Person,
               :Woman,
               :Teacher.
```
Per asserire che una classe e' sottoclasse di un'altra si usa l'assioma `rdfs:subClassOf`. In questo
modo tutti gli individui della classe figlia sono anche membri della classe madre (*sussunzione*).
```xml
# Donna e' sottoclasse di Persona
:Woman rdfs:subClassOf :Person;
```
*Nota*: Ogni classe e' sottoclasse di se stessa.

Particolarmente utile in casi di merge di due ontologie e' la possibilita' di esprimere
l'equivalenza tra classi. Inoltre la possiblita' di esprimere equivalenza tra classe permette anche
di definire le cosiddette *class expressions*.  OWL introduce questa possibita' con l'assioma di
classe `owl:equivalentClass`.
```xml
:Person owl:equivalentClass :Human;
```
Lo stesso vale per gli individui con gli assiomi `owl:differentFrom` e `owl:sameAs`.
La disgiunzione tra classi, invece, viene espressa attraverso 2 triple:
```xml
# Woman e Man sono classi disgiunte
[] rdf:type owl:AllDisjointClasses;
   owl:members (:Woman :Man)
```
>"*Esiste la classe anonima delle classi disgiunte i cui membri sono Woman e Man*"

Cosi' come le classi, anche le object properties si definiscono attraverso `rdf:type`
```xml
# La proprieta' haSposa e' una objectProperty
:hasSpouse rdf:type owl:ObjectProperty;
```
Per speficare dominio e range di una objectProperty, e' sufficiente l'espressivita' di RDFS. Lo
stesso vale anche per descrivere proprieta' che sono sottoproprieta' di altre.

Le data property sono trattate differentemente, dal momento che hanno come dominio una classe e come
range un tipo di dato *"primitivo"* 
```xml
# hasAge e' una data property di persona e ha tipo intero
:hasAge rdf:type owl:DatatypeProperty;
:hasAge rdfs:domain :Person;
        rdfs:range xsd:nonNegativeInteger.
        
# John ha 51 anni
:John :hasAge 51.
```

Uno dei principali meccanismi per definire nuove classi a partire da quelle esistenti (definire
class expressions) e' mediante le restrizioni:

* Su classi esistenti mediante operatori insiemistici
* Mediante proprieta' tramite quantificatori (esistenziale, universale, cardinalita')

Vediamo ora come definire classi mediante operatori insiemistici, partendo dall'intersezione. Essa
permette di definire una classe come intersezione di due classi.
```xml
# Madre e' la classe degli individui che sono sia donne che genitori
:Mother owl:equivalentClass [
        rdf:type owl:Class ;
        owl:intersectionOf (:Woman :Parent)
].
```

Il complemento e' uguale alla differenza di due classi. Ad esempio, la classe dei non genitori
(*ChildLessPerson*) e' complemento della classe dei genitori (*Parent*). Questo significa che le due
classi sono disgiunte e non e' possibile che un individuo possa appartenere contemporaneamente ad
una classe e al suo complemento. 
```xml
# Un non genitore sono tutte quelle istanze che non sono genitori 
:ChildlessPerson owl:equivalentClass [
                 rdf:type owl:Class;
                 owl:intersectionOf (:Person [rdf:type owl:Class;
                                              owl:complementOf :Parent
                                             ]
                                    )
                 ].
```

Parlando di quantificatori, `owl:someValuesFrom` esprime la quantificazione esistenziale. Mediante
questo quantificatore, e' possibile esprimere ad esempio che un genitore e' una persona che ha
almeno un figlio. La quantificazione universale e' similmente espressa con `owl:allValuesFrom`.
```xml
# Genitore e' una persona che ha almeno un figlio
:Parent owl:equivalentClass [
            rdf:type owl:Restriction;
            owl:onProperty :hasChild;
            owl:someValuesFrom :Person
        ].
```
***Nota (Necessario e sufficiente)***: Le classi definite come *equivalenti* a un certo insieme di
restrizioni sono denominate classi definite. Le restrizioni individuano condizioni necessarie e
sufficienti per l'appartenenza alla classe. Senza l'utilizzo del costrutto `equivalentClass` (ad
esempio con `subClassOf`) si possono invece associare a una classe solo proprieta' necessarie ma
*non sufficienti*. E' bene notare inoltre che solo le classi definite permettono determinate forme
di ragionamento.

OWL e' un linguaggio *property-centric*. Cio' significa che e' possibile descrivere delle proprieta'
per cui l'espressivita' di rdf non e' sufficiente. Si possono definire le proprieta' come:

* Simmetriche: vale anche il contrario (*es. coniugeDi*)
* Funzionali: per cui esiste una corrispondenza N-1 (*es. haPadre*)
* Inverse: che sono la relazione inversa di altre (*es. figlioDi* inverso di *haPadre*)
* Riflessive: che valgono anche al soggetto a cui e' applicata (*es. conosce*)
* Transitive: rispettano la relazione transitiva (*es. contiente*)

