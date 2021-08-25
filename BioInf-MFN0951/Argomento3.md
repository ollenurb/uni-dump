# Motif Finding

* In generale, il problema del motif finding e' simile ad un problema di pattern matching, con la
  differenza che il pattern non e' conosciuto a priori
* Un'altra grande differenza e' che i *motifs* possono presentare delle mutazioni, per cui anche se
  si conoscesse il pattern (motifs) da cercare, impiegare algoritmi di pattern matching sarebbe
  inutile (perche' non si troverebbero tutti i motifs con almeno una mutazione)
* Piu' formalmente, possiamo dire che un $(n, k)$ motif e' un pattern di lunghezza $n$ che appare
  con $k$ mismatches all'interno della sequenza di DNA
* L'obiettivo del motif finding e' ritrovare il pattern $P$ (motif) all'interno della sequenza di
  DNA, data la sua lunghezza e il numero di mutazioni ($(n, k)$)

