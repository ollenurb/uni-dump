# Regole di Ragionamento per le ontologie 

## Regole SWRL

* SWRL $\rightarrow$ *Semantic Web Rules Language*
* Specifica del 2004
* Supportato solo da alcuni reasoner (Pellet, ma anche Hermit in parte)
* Hanno una forma `IF-THEN`, con antecedente e conseguente
* Non possono creare individui, ma possono solo *asserire nuove relazioni/proprieta'*
* Esempi di regole:
    * `C(x)`: L'individuo `x` appartiene alla classe `C`
    * ``
    * 

* Esempio di regola: `Personaggio(?x) ^ personaggioDi(?x, ?y) ^ Commedia(?y) -> PersonaggioComico(?x)` 
* SWRL supporta un insieme di operatori built in, sopratttto quelli numerici quali `multiply` o
  `greaterThan` 
* `RIL` (Rule Interchange Format): Standard per facilitare la sintesi e l'integrazione di sistemi di
  regole.
    * Tramite RIL si possono specificare delle regole per la corrispondenza tra ontologie diverse

## OWL2

**Manca la parte sui linguaggi OWL2, guardare slides..**

## SPARQL

* Linguaggio di interrogazione per RDF
* Permette di creare nuovi grafi con le triple estratte
* Una query SPARQL restituisce un insieme di triple oppure uno o piu' grafi RDF
* Le query sono indirizzate a un indirizzo HTTP che ospita un endpoint SPARQL
* L'endpoint esegue le query su uno o piu' dataset contenuti in uno store di triple
* Molte Linked Data Platforms hanno un'interfaccia per poter interagire con l'endpoint SPARQL
* Schema di una query:
    * Dichiarazione di prefissi: `PREFIX foo: <http:.../>`
    * Definizione del dataset: `FROM ...`
    * Definizione dei nodi che si vogliono restituire: `SELECT ...`
    * Pattern da rispettare per la query: `WHERE { ... }`
    * Modificatory: `ORDER BY ...`
* Schema minimo di una query:
```sql
SELECT ?x
WHERE
{
    ?x predicato_1 ?y.
    ?x predicato_2 ?x
}
```

* I predicati delle triple possono essere *object-properties*, *data-properties*, o predicati
  `rdf:type` (`a`)
* Soggetti o oggetti delle triple possono essere variabili, classi, individui oppure letterali
* Esempio 1: *Nell'ontologia del cinema, selezionare tutti gli individui che sono persone*
```sql
PREFIX cinema: <http../>

SELECT ?x
WHERE { ?x rdf:type cinema:Persona }
```

* Esempio 2: *Nell'ontologia delle citta', selezionare tutte le triple che sono citta' e che hanno
  come popolazione la popolazione di Torino*
```sql
PREFIX citta: <http../>

SELECT ?x
WHERE { ?x citta:haPopolazione citta:popolazioneDiTorino;
           rdf:type            citta:Citta'
      }
```

* `;` significa `AND`, e viene messo per evitare di ripetere il soggetto
* `,` viene messo per evitare di ripetere soggetto e predicato
* Esempio 3: *Nell'ontologia delle citta', selezionare tutte le citta' e il loro corrispettivo nome
  che hanno una popolazione ampia e sono situate in Giappone.*
```sql
PREFIX citta: <http../>

SELECT ?c, ?n
WHERE
{
    ?c citta:haPopolazione ?p;
       citta:nome ?n;
       citta:situatoIn citta:Giappone.
    ?p rdf:type citta:PopolazioneAmpia
}
```

* E' possibile filtrare i risultati tramite espressioni regolari: `FILTER regex (?n, "Tokio")`
* Cosi' come SQL, e' possibile utilizzare la clausola `HAVING` per filtrare in base ai risultati di
  funzioni di aggregazione quali (ad esempio) `COUNT`
* `MIN/MAX` permettono di calcolare il minimo e il massimo rispetto ad una determinata
  data-property. Nel seguente esempio viene utilizzato MAX per calcolare il compenso massimo di una
  persona nel dominio del cinema

```sql
SELECT ?persona (MAX(?compenso) AS ?piupagato)
WHERE
{
    ?persona cinema:haRuolo ?ruolo
    ?ruolo cinema:compenso ?compenso
}
GROUP BY ?persona
```

* SPARQL e' anche in grado di modificare/inserire e cancellare le triple rdf, anche di piu' basi di
  conoscenza contemporaneamente

## Esercizi SPARQL sul dominio Arte

Selezionare le seguenti informazioni dall'ontologia:

1. Opere e artisti
```sql
SELECT ?o ?a
WHERE
{
    ?o rdf:type Opera. 
    ?a rdf:type Artista.
    ?o ontoart:creataDa ?a
}
```

2. Tutte le opere di un artista
```sql
SELECT ?o
WHERE
{
    ?o rdf:type Opera. 
    ?o ontoart:creataDa ontoart:LeonardoDaVinci
}
```

3. Opere di un dato artista in ordine alfabetico
```sql
SELECT ?o ?t
WHERE
{
    ?o rdf:type Opera;
       ontoart:titolo ?t.
    ?o ontoart:creataDa ontoart:LeonardoDaVinci
}
ORDER BY ?t
```

4. Quale artista e' autore di una data opera
```sql
SELECT ?a
WHERE
{
    a? ontoart:creataDa ontoart:AUTORE.
}
```

5. Musei e opere
```sql
SELECT ?m ?o
WHERE
{
    m? rdf:type ontoart:Collezione.
    m? ontoart:contiene ?o
}
```

6. Opere per epoca
```sql
SELECT ?e ?o
WHERE
{
    o? rdf:type ontoart:Opera;
       ontoart:epoca ?e

}
GROUP BY ?e
```
 
8. Opere di una data epoca
```sql
SELECT ?o
WHERE
{
    ?o rdf:type ontoart:Opera;
       ontoart:epoca "Rinascimento"
}
```

9. Quante opere contiene ogni museo
```sql
SELECT
WHERE
{

}
```

11. Musei con un numero di opere maggiore di $n$
```sql
SELECT
WHERE
{
}
```

13. Opere e soggetti
```sql
SELECT
WHERE
{
}
```

14. Opere con un dato soggetto
```sql
SELECT
WHERE
{
}
```

## DBpedia, Yago e Wikidata

* DBpedia e' stata chiamata la "cristallizzazione" di Wikipedia nei Linked Data
* E' stata creata da diversi collaboratori
* Contiene circa 3 miliardi di triple RDF
* E' stata creata a partire dalle infobox delle pagine di Wikipedia utilizzando dei template
  appositi per il mapping tra informazioni nelle infobox alle entita' sull'ontologia. In
  particolare, il processo per il mapping e' riassumibile nei seguenti passi:
    - L'URI dell'articolo di Wikipedia diventa il soggetto
    - Il predicato e' creato concatenando il namespace con il nome dell'attributo nell'infobox
    - L'oggetto e' creato dal valore dall'attributo
* In particolare esistono 11 estrattori in grado di trasformare un certo tipo di markup in triple
  RDF
* DBPedia fa riferimento ad altre ontologie fondazionali quali YAGO, Wordnet ecc..
* Wikidata e' un database collaborativo creato a partire sempre da Wikipedia e Wikimedia
* E' un database secondario: le informazioni sono etichettate con la sorgente da cui provengono
* Le entita' sono inserite mediante un template di default, in modo che tutte le informazioni
  inserite siano conformi tra loro
* Le entita' sono identificate per mezzo di un identificativo che ha un prefisso `Q`. (Es. `Q26478`)
* Ogni entita' possiede diverse label linguistiche
* `wdt` = Wiki Data Terms, `wd` = Wiki Data
*  
