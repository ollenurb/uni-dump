% Gini Index

* Serve a calcolare l'[impurita'](Impurita.md) di un [dataset](Dataset.md)
* Indica la probabilita' che un esempio qualsiasi sia stato etichettato
  erroneamente, **supponendo** che le istanze siano state etichettate
  campionando randomicamente dalla distribuzione di classi del dataset
* Si calcola mediante la seguente formula
  $$
  \sum^{k}_{i=0} \dot{p}_i(1 - \dot{p}_i)
  $$
  $\dot{p}_i$ indica la *probabilita' empirica* che l'istanza sia etichettata
  con la classe $i$.

## Derivazione della formula 
Sia $D$ un dataset le cui istanze sono state etichettate mediante la *true class
function* $l: D \rightarrow \mathscr{L}$.  Definiamo ora un'altra funzione di
labeling $\hat{e}: D \rightarrow \mathscr{L}$, che associa una classe
randomicamente campionandola dalla distribuzione delle classi di $D$. Per
semplicita', supponiamo inoltre che le etichette disponibili siano solo 2:
positive $\oplus$ e negative $\ominus$.

Possiamo allora definire $\dot{p} = P(\hat{e}(x) = \oplus) = \frac{n^+}{n^+ +
n^-}$ come la *probabilita' empirica* che ad un generico $x$ sia assegnata la
classe positiva. Analogamente, sfruttando il secondo e terzo assioma della
probabilita' si ottiene $P(\hat{e}(x) = \ominus) = (1-\dot{p})$

Inoltre, siccome la distribuzione delle classi non cambia, vale $(P(l(x) =
\oplus) = \dot{p}$, e analogamente $(P(l(x) = \ominus) = (1 - \dot{p})$. Dato
un esempio a caso, vogliamo calcolare ora la probabilita' che esso sia stato
etichettato da $\hat{e}$ come falso positivo.
$$
\begin{split}
P(FP) =& P[\hat{e}(x) = \oplus \; | \; l(x)= \ominus] \; P[l(x)= \ominus]  \\
      =& P[\hat{e}(x)= \oplus] \; P[l(x)=\ominus] \\
      =& \dot{p}(1 - \dot{p})
\end{split}
$$
Seguendo lo stesso ragionamento, otteniamo anche che $P(FN) =
(1-\dot{p})\dot{p}$. Si conclude quindi che il *Gini Index* equivale a $P(FP) +
P(FN) = 2\dot{p}(1 -\dot{p})$
