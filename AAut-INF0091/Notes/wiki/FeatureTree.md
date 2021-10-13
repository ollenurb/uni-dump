% Feature Tree

* Un *Feature Tree* e' una struttura ad albero costruita a partire da un
  [dataset](Dataset.md) in cui:
    * I **nodi** interni (quelli che non sono foglie) sono annotati con le features
    * Gli **archi** che si dipartono da un nodo sono etichettati con i *letterali*
      (cioe' i valori possibili che puo' assumere quella feature) corrispondenti
      alle feature del nodo
    * Le **foglie** rappresentano espressioni logiche costruite come congiunzione di
      ogni vincolo sui letterali incontrato nel percorso dalla radice alla foglia.
      Il sottoinsieme di istanze coperte dall'espressione e' chiamato *segmento* di
      istanze associato alla foglia
    * Uno **split** e' l'insieme di *letterali* di un nodo

* E' essenzialmente un metodo per rappresentare diversi
  *[concetti](Concetto.md)* (congiuntivi) nello spazio delle ipotesi in un modo
  compatto e intuitivo.
* Per costruire un feature tree a partire dai dati di training si utilizza
  l'algoritmo [GrowTree](GrowTree.md), utilizzato dalla maggior parte dei tree
  learners
