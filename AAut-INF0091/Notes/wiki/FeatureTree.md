% Feature Tree

Un *Feature Tree* e' una struttura ad albero costruita a partire da un
[dataset](Dataset.md) in cui:

* I **nodi** interni (quelli che non sono foglie) sono annotati con le features
* Gli **archi** che si dipartono da un nodo sono etichettati con i *letterali*
  (cioe' i valori possibili che puo' assumere quella feature) corrispondenti
  alle feature del nodo
* Le **foglie** rappresentano espressioni logiche costruite come congiunzione di
  ogni vincolo sui letterali incontrato nel percorso dalla radice alla foglia

In altri termini un feature tree rappresenta un'espressione scritta in [forma
normale disgiuntiva](DNF.md). Dal momento che ogni espressione logica puo'
essere riscritta in DNF, i feature trees sono strattamente piu' espressivi delle
espressioni in forma normale congiuntiva.
