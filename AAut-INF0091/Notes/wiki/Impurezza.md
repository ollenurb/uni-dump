% Impurezza'

* E' una misura che viene impiegata come euristica nella scelta dello split
  migliore dall'algoritmo [GrowTree](GrowTree.md)
* Funzione che ha come parametro un dataset $D$ e ritorna uno scalare $Imp: D
  \rightarrow \mathbb{R}$
* E' determinata univocamente dal numero di positivi e negativi del dataset,
  cio' significa che dipende dalla *probabilita' empirica* 
  $$
  \dot{p} = \frac{n^{\oplus}}{n^{\oplus} + n^{\ominus}}
  $$
* L'impurezza' deve essere uguale nel caso si scambiassero le classi (positivi
  con negativi e viceversa). Inoltre deve essere pari a 0 quando $\dot{p} = 0,1$
  e raggiungere il massimo in $\frac{1}{2}$
* Ci sono diversi modi per calcolare l'impurezza':
    * ***Minority Class*** ($\min(\dot{p}, 1-\dot{p})$): misura la proporzione
      dei mismatches ipotizzando che la classe maggioritaria sia stata scelta
      come label per la foglia
    * ***[Gini Index](GiniIndex.md)*** ($2\dot{p}(1-\dot{p}$): misura la
      proporzione dei mismatches ipotizzando che gli esempi nella foglia sino
      etichettati randomicamente ma rispettando la distribuzione delle classi
      originale
    * ***[Entropia](Entropia.md)*** ($-\dot{p}\log_2 \dot{p} - (1- \dot{p})
      \log_2(1-\dot{p})$):
      Informazione attesa. Piu' puro e' l'esempio piu' bassa e' l'informazione
      attesa. 
* L'impurezza' **attesa** di uno split $D \rightarrow \{D_1, \dots, D_l\}$ e'
  data dalla media delle impurezza' di ogni singolo sottoinsieme $D_i$:
  $$
  Imp(\{D_1, \dots, D_l\}) = \sum_{j = 1}^l \frac{| \; D_j \; |}{| \; D \; |}Imp(D_j)
  $$
* Purity Gain: Immaginiamo che il dataset $D$ venga splittato in $\{D_1, \dots,
  D_l\}$ dalla feature $f$. Con purity gain intendiamo la quantita' 
  $$
  Imp(D) - Imp(\{D_1, \dots, D_l\})
  $$
  che concettualmente indica il *gain in purezza* che si avrebbe se si includesse
  $f$ come feature di split.
