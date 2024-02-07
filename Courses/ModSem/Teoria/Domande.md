# Domande Esame

## Domanda #1

> **Domanda**: Si dia una descrizione della frame theory e si definisca la
> struttura di un frame.

La frame theory e' un formalismo per la rappresentazione della conoscenza
strutturata, che rappresenta un'evoluzione rispetto al formalismo delle reti
semantiche, in cui viene aggiunta la possibilita' di rappresentare conoscenza di
tipo stereotipico. Come suggerisce il nome per l'appunto, il formalismo si basa
sul concetto di *Frame*, una struttura dati atta a rappresentare delle
conoscenze stereotipiche riguardo a determinate situazioni. Un frame e' composto
da una serie di slots organizzati in livelli, che vengono riempiti di valori in
base alla situazione specifica. Gli slots a livello piu' alto rappresentano
della conoscenza steoreotipica della situazione, per cui contengono valori di
default che sono assunti essere sempre veri rispetto alla situazione. Quelli
piu' bassi, invece, possono essere riempiti con dati o istanze specifiche della
situazione. I valori degli slots possono essere sia dati, che riferimenti ad
altri frames. Inoltre, agli slots possono essere associate anche delle procedure
di calcolo dei valori (*if-needed*), per cui si ottiene sia una formalizzazione
sia a livello di conoscenza, che a livello di procedure di calcolo per
ottenerla. Piu' nel dettaglio, la struttura di un frame e' composta dai seguenti
elementi:

* **Identificativo**: permette l'identificazione del frame da parte di altri
  frames;
* **Slot generali/specifici**: permettono di creare una tassonomia di frame;
* **Slot generici**: rappresentano la conoscenza stereotipica;
* **Procedure per il calcolo di valori**: permettono di calcolare
  automaticamente alcuni valori degli slots sulla base di condizioni specifiche;
* **Valori predefiniti**: valori impostati di defaults.

## Domanda #2

> **Domanda**: Si elenchino le differenze tra un grafo relazionale (rete
> semantica) e una rete proposizionale.

Siccome le reti proposizionali sono un'evoluzione delle reti semantiche, ci sono
molte similitudini tra i due formalismi di rappresentazione. Nonostante cio',
esistono alcune differenze. La prima e' che una rete proposizionale e' in grado
di rappresentare conoscenza di tipo *epistemico* (credenze soggettive) per mezzo
dei nodi proposizionali. Mentre le reti semantiche non hanno questa
possibilita', per cui la conoscenza asserita dal grafo e' in qualche modo di
tipo *eterarchico*, cioe' tutta allo stesso livello di importanza. La seconda e'
che introducendo quantificatori, connettivi e variabili le reti semantiche
proposizionali permettono di ottenere lo stesso livello di espressivita' della
logica del prim'ordine, mentre le reti semantiche ne implementano solo un
sottoinsieme. 

## Domanda #3

> **Domanda**: Quali sono le primitive di SnePS?

* `assert`: asserisce della conoscenza nella rete che viene creduta vera, ad
  esempio il comando `assert(member Tweety class Canary)` asserisce che "Tweety"
  e' un canarino.
* `build`: permette di rappresentare della conoscenza che non viene creduta dal
  sistema ma che comunque e' presente.
* `find`: cerca uno o piu' nodi della rete. Permette di utilizzare la rete come
  un database di fatti che puo' essere interrogato descrivendo il tipo di fatti
  cercato. (es. `find(class elephant)`)
* `deduce`: permette di cercare proposizioni che non sono direttamente asserite
  dal sistema, ma che esso e' comunque in grado di inferire. (es. `deduce(member
  $x class canary)` cerca tutti gli `$x` che appartendono alla classe dei
  canarini).
* `define-path`: crea una relazione a partire da un percorso di relazioni (crea
  di fatto una *property-chain*), componendole col comando `compose`.

## Domanda #4

> **Domanda**: Quali sono i tipi di inferenze possibili con SnePS?

Ci sono 3 tipologie di metodi per fare inferenze su SnePS:

1. **Riduzione**: consiste nel dedurre da un grafo una porzione contenuta in esso.
   (es. se diciamo che John da un libro a Mary, allora possiamo anche dedurre
   (credere) la proposizione che John stia dando un libro.)
2. **Basate su percorsi**: consiste nello stabilire che un percorso fatto da
   certe relazioni sia uguale ad una singola relazione.
3. **Basato su regole**: sono regole del tipo antecedente-conseguente che
   possono essere definite dall'utente in modo arbitrario, e fanno parte della
   base di conoscenza stessa. Permettono di aumentare la conoscenza della rete
   non implicita e sono *domain-specific*.

## Domanda #5

> **Domanda**: Descrivere cos'e' e in cosa consiste il formalismo SWRL.

Il *Semantic Web Rule Language* e' un linguaggio per la definizione di regole
nel web semantico. Tali regole permettono sia di inferire nuova conoscenza
(regole dichiarative) che di effettuare delle azioni (regole di produzione). E'
bene notare che le regole di produzione non possono creare nuovi individui, ma
solo asserire nuove *relazioni*/*proprieta'* tra le entita' gia' presenti nel
grafo. L'impiego di queste regole permette di definire ragionamenti specifici
del dominio di riferimento, senza dover intaccare l'architettra dell'ontologia.
Le regole SWRL sono composte da un antecedente e un conseguente in cui
l'antecedente viene valutato sul grafo che rappresenta l'A-Box e la T-Box. Sia
l'antecedente che il conseguente sono composti da congiunzioni di atomi che
possono essere: 

* `C(x)`: `x` appartiene alla classe `C`
* `P(x, y)`: `x` e' legato a `y` tramite la proprieta' `P`
* Operatori built-in quali:
    * `sameAs(x, y)`: `x` e' uguale a `y`
    * `differentFrom(x, y)`: `x` e' diverso da `y`

Esempio di regola:

`haRuolo(?a, ?r) ^ haCompenso(?r, ?c) ^ swrlb:greaterThan(?c, 30000) -> AttoreMoltoPagato(?a)`

## Domanda #6

> **Domanda**: Descrivere in maniera informale gli assiomi di SUMO (navigare
> l'interfaccia).



## Domanda #7

> **Domanda**: Descrivere l'allineamento tra YAGOSUMO e WordNet.

## Domanda #8

> **Domanda**: Quali sono le possibili serializzazioni di RDF?

## Domanda #9

> **Domanda**: Che differenza c'e' tra TBox e ABox?

## Domanda #10

> **Domanda (importante)**: Quali sono le differenze tra *property-centric*
> (RDFS) e *class-centric* (OWL)?

## Domanda #11

> **Domanda**: Name graph e (?).

## Domanda #12

> **Domanda**: Ontology Engineering (NEON e OntoClean).

## Domanda #13

> **Domanda**: Quali sono le differenze tra *enduranti* e *perduranti*?

## Domanda #14

> **Domanda**: In cosa consiste WikiData? 


