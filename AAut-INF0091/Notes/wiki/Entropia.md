% Entropia

* Il concetto di entropia serve a dare una **misura** della **quantita' di
  informazione** associata ad un **evento**
* Si basa fondamentalmente sul concetto di **informazione** (o "*sorpresa*")
  associata ad un evento $I(E)$.
    * Intuitivamente, la sorpresa associata ad un evento con probabilita' *molto
      alta* deve essere *molto bassa*. (si pensi, ad esempio, se si lanciasse
      ripetutamente una moneta truccata con $p(T)=0.9$. Quanto saresti sorpreso
      se dopo 5 lanci in cui e' uscito testa uscisse ancora testa?)
    * Per poter modellare questo comportamento, l'informazione di un evento e'
      una funzione definita come $I(E) = log_2(\frac{1}{p(E)}) = -log_2(p(E))$.
      Questo perche' il rapporto $\frac{1}{p(E)}$ matematicamente causa
      problemi.
* Dato un esperimento $E$ che puo' avere l'insieme di outcome $E_1 \dots E_n$,
  l'entropia di $E$ e' semplicemente **la quantita' di informazione media**
  calcolata su tutti gli outcome possibili $E_i$
  $$
  H(E) = \sum^n_{i=1} P(E_i) \cdot log_2(\frac{1}{P(E_i)})
  = -\sum^n_{i=1} P(E_i) \cdot log_2(P(E_i)) 
  $$
* Nota: Quando si usa l'entropia come indice per calcolare
  l'[impurita](Impurita.md)' e viene applicato nel caso di due classi
  ($\oplus$/$\ominus$), allora abbiamo due outcome possibili (prendo un negativo
  oppure un positivo), con probabilita' rispettivamente $\dot{p} e (1-\dot{p})$. 
* Un'altra intuizione e' data dal fatto che quando la differenza tra gli oggetti
  appartenenti alle classi e' 0, l'entropia raggiunge il valore massimo (1),
  mentre il valore si abbassa tanto quanto la differenza degli oggetti tra le
  classi aumenta
