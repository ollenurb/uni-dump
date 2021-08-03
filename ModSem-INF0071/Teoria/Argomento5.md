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
