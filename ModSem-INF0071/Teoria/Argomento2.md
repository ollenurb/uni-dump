## RDF
RDF e' un linguaggio che permette di descrivere risorse. Con risorsa si intende qualsiasi cosa, un
documento, una persona, un oggetto fisico o astratto. Piu' in generale il termine *risorsa* indica
qualsiasi cosa che sia identificabile tramite URI (Unified Resource Identifier).
RDF fa parte dello stack di linguaggi del web semantico, costituito da:

* RDF: che permette di descrivere risorse
* RDFS: che permette di descrivere relazioni tra risorse (propriamente estensione di RDF)
* OWL: che permette di descrivere ontologie computazionali (si colloca ad un livello superiore di
  RDF)

Le specifiche del linguaggio RDF consistono in una serie di documenti, noi ci concentreremo sulla
specifica *RDF 1.1 Primer*.  
Come detto in precedenza, RDF e' nato per descrivere risorse digitali e quindi pubblicate sul web.
Tali risorse sono collegate ed organizzate in una struttura a grafo in cui i nodi rappresentano le
entita' e gli archi le relazioni tra di esse (rappresentazione *knowledge graph*).
RDF possiede diverse serializzazioni, tipicamente per favorirne la leggibilita' si preferisce il
linguaggio TURTL. 
GLi elementi di base del data model di RDF sono:

* Triple
* IRI
* Letterali
* Blank Nodes
* Grafi

L'unita' di base di RDF e' una **tripla**, composta da soggetto, predicato e oggetto. Il soggetto e
oggetto possono essere **IRI** o **blank nodes**, mentre l'oggetto puo' essere anche un
**letterale** e il predicato puo' essere solo un IRI. Un **grafo** e' composto da un insieme di
triple. 

Esempio:

* Soggetto: Monna Lisa
* Predicato: fu creata da
* Oggetto: Leonardo da Vinci

che in pseudocodice corrisponde a:
```
<the Monna Lisa><was created by><Leonardo da Vinci>
```
Mentre un esempio di insieme di triple (e quindi di grafo) in pseudocodice potrebbe essere il
seguente:
```
<Bob><is a><Person>
<Bob><is a friend of><Alice>
<Bob><is born on><the 4th of July>
<Bob><is interested in><the Mona Lisa>
<the Mona Lisa><was created by><Leonardo da Vinci>
<the Mona Lista><is entitled><Mona Lisa>
<the video 'La Joconde a' Washington><is about><the Mona Lisa>
```
notare come i soggetti di alcuni predicati compaiano come oggetto di altri e viceversa, costruendo
cosi' una struttura a grafo interconnessa.
Tale grafo e' poi possibile rappresentarlo graficamente come in figura \ref{figGraph}.

![Rappresentazione grafica del grafo descritto nell'esempio\label{figGraph}](img/1.1_rdf_graph.png)

Vediamo ora nel dettaglio gli elementi costituenti di RDF. 

### URI e IRI
Come detto precedentemente, gli elementi di una tripla devono essere elementi identificabili 
tramite IRI e quindi riconducibili a entita' presenti nel web. 
Il sistema degli IRI, (cioe' URI internazionalizzato) sono utilizzati come strumento da RDF per 
rappresentare le entita'. Cosa rappresenti un IRI nella realta' non e' rilevante, l'importante e'
che sia *de-referenziabile*. Un predicato e' **sempre** rappresentato da un IRI, mentre soggetto e
oggetto possono esssere costituiti da altri elementi. Questo perche' il predicato e' un elemento di
vocabolario definito in qualche vocabolario. 

### Letterali
Sono tutti quei tipi che non sono IRI, ad esempio i tipi di dato primitivi quali:

* Stringhe
* Numeri in vari formati
* Booleani
* Date, ecc..

Solo gli oggetti possono essere letterali.

### Blank Nodes
Sono nodi speciali che permettono di denotare risorse senza l'ausilio di un URI. Un blank node puo'
essere visto come una variabile che puo' comparire in posizione di soggetto e oggetto nella tripla.

```
<><has_x_coord><12.5>
<><is a><Tree>
```

### Grafi
Nel tempo si e' visto che per gestire meglio le triple era piu' convieniente raggrupparle in grafi
diversi. Un grafo viene quindi dotato di un IRI (o un blank node) tramite cui e' possibile
identificarlo. 
Un dataset RDF e' costituito da:

* Un grafo e' detto anonimo (o default graph)
* Zero o piu' grafi con un nome (named graphs)

### Il formato Turtle
RDF e' serializzato in diversi formati tra cui Json LD, N-Triples, RDF/XML e Turtle.
Storicamente si e' sempre utilizzato e prediletto `XML`, tuttavie `XML` si e' imposto come standard
di condivisione di documenti. Lo standard attuale e' dato dal formato Turtle (*Terse RDF Triple
Language*) di cui ne vediamo alcune caratteristiche. 
Diamo ora un esempio di formato Turtle [@rdf_turtle] 
```
@base <http://example.org/> .
@prefixrdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefixrdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefixfoaf: <http://xmlns.com/foaf/0.1/> .
@prefixrel: <http://www.perceive.net/schemas/relationship/> .

<...#green-goblin>
    rel:enemyOf<#spiderman>;
    a foaf:Person;            # In the context of the Marvel universe
    foaf:name"Green Goblin" .

<...#spiderman>
    rel:enemyOf<#green-goblin> ;
    a foaf:Person;
    foaf:name"Spiderman",
             "Uomo Ragno" .
```
La rappresentazione a grafo risultante e' quella descritta in figura \ref{figGraph2}.

![Grafo RDF dell'esempio \label{figGraph2}](img/1.2_rdf_turtle_graph.png)

In questo esempio vengono introdotte numerose caratteristiche del linguaggio Turtle: 

* IRI `@base` e relativi
* `@prefix` e nomi prefissi
* `;` indica che allo stesso soggetto si applicano piu' predicati (con diverso oggetto).
* `,` indica che allo stesso soggetto e predicato si applicano piu' oggetti. 
* `:` indica il prefisso a cui ci si riferisce. Puo' essere anche vuoto. 

