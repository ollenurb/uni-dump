# Ontology Engineering

* Ambito che si occupa del design di ontologie e del loro mantenimento
* Pratiche e linee guida per progettare ontologie interoperabili e ben fondate
* Tra queste metodologie troviamo OntoClean e Neon
* Tali pratiche sono molto importanti dal momento che spesso si lavora in modo collettivo e
  collaborativo alle ontologie

## OntoClean
(An Overview of OntoClean, in Handbook on ontologies (pp. 201-220))

* Deriva dal lavoro effettuato sulle ontologie formali e fondazionali condotto tra la fine degli
  anni 90 e il primo decennio di questo secolo
* Metodologia basata su nozioni molto generali tratte dalla filosofia quali concetti come essenza,
  identita' e unita', usate per caratterizzare aspetti rilevanti quali il significato delle
  proprieta', classi e relazioni che compongono un'ontologia.
* Questi aspetti vengono rappresentati da delle cosiddette "*metaproprieta'* delle classi, che
  impongono diversi vincoli sulla struttura tassonomica di un'ontologia.
* L'analisi di questi vincoli aiuta a valutare e validare le scelte fatte.
    * Esempio: Una classe anti-rigida (come un ruolo), non puo' sussumere una classe rigida. Ne
      consegue che la classe *studente* non puo' sussumere la classe *persona*.
* Le metapropreta' sono:
    * Identita' (I): proprieta' *intrinseca* che identifica un tipo di oggetti (Es. triangolo
      $\rightarrow$ lunghezza dei lati). viene ereditata dalle sottoclassi
    * Unita' (U): proprieta' di un tipo di oggetto di essere unitario (Es. persona vs. argilla)
    * Rigidita' (R): proprieta' di un tipo di oggetto che non e' soggetta a cambiamenti (Es. persona
      vs. Studente - lo studente quando finisce il corso di studi decade da questa classe). viene
      ereditata dalle sottoclassi (non vale per -U)
    * Dipendenza (D): proprieta' di un tipo di oggetti di dipendere da un altro per la propria
      definizione (Es. studente - scuola). Solo l'antirigidita' (~R) viene ereditata dalle
      sottoclassi.
* Queste metaproprieta' non sono prescrittive, cioe' che a seconda di come decido di rappresentare
  una classe o un'entita' del mondo reale, potrei ottenere delle metaproprieta' diverse
* Le classi vengono annotate con metaproprieta':
    * `+P`: la classe possiede la metaproprieta' $P$
    * `-P`: la classe non possiede la metaproprieta' $P$
    * `~P`: la classe possiede l'anti proprieta' $~P$ (non-proprieta')
* *Phase sortal* e' la proprieta' di alcune istanze di essere in grado di cambiare alcuni criteri
  della propria identita' durante la propria esistenza, pur sempre rimanendo sempre la stessa
  entita'. Un esempio sono i bruchi, che cambiano totalmente alcune caratteristiche, pur rimanendo
  lo stesso individuo. I phase sortal sono indipendenti (-D), anti-rigidi (~R) e hanno un criterio
  di identita' (+I)
* **Vedere esempi nell'articolo**
* 


