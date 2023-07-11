# Laboratorio Self-Organizing Maps

### Esercizi
1. Eseguire almeno una volta la dimostrazione `som_demo1` per intero
2. In `som_demo1` si parla di *prototype vectors* anziche' *weight vectors*.
   Perche?
3. Cos'e' `D` alla riga `62`? Cosa rappresentano le dimensioni di `D`?
4. Alla riga 75, `som_randominit` crea e inizializza una SOM. Cosa rappresenta
   `msize`?
5. Verificare i campi contenuti in `sMap`. Cosa contiene `codebook`? A cosa
   corrispondono le sue dimensioni?
6. Si può specificare se si vuole che la struttura della mappa sia rettangolare
   o esagonale inserendo come argomento di `som_randinit`, `lattice`,`hexa`
   oppure `rect`.
   Verificare come cambia la distanza tra le unità nei due casi. A
   tal fine, si usi la funzione `som_unit_dists` che applicata a una SOM
   restituisce la matrice delle distanze tra le unità (nella figura, le unità
   son disposte dall'alto al basso, cominciando dall'alto a sinistra; per vedere
   le coordinate delle varie unità sul lattice di una SOM si può usare la
   funzione `som_unit_coords` applicata alla SOM).

### Soluzioni

1. -
2. Perche' sotto un certo punto di vista, i vettori dei pesi dei neuroni
   sono effettivamente dei prototipi che rappresentano una determinata classe
4. E' il dataset che viene generato in modo casuale. Rappresentano il numero di
   dati nel dataset e il numero delle features con cui sono rappresentati gli
   esempi
5. A specificare la dimensione della mappa. Il numero di neuroni sara' $10 \cdot
   10 = 100$ in questo caso
6. Contiene i pesi di ogni neurone nella mappa. $10 \times 10 \times 2$, siccome
   ogni neurone ha un vettore di 2 pesi.
7. _ 
