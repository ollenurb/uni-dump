---
title: Il Percettrone
header-includes: |
 \usepackage{tikz}
---

* Partiamo con il trattare il primo tipo di rete: il percettrone
* Fu introdotto dallo psicologo Frank Rosenblatt nel 1958
* E' un modello di rete molto semplice, in grado di classificare solo problemi
  linearmente separabili
* Il percettrone non e' nient'altro che un insieme di neuroni di output (per
  sempllicita' verranno rappresentati come uno solo), con la particolarita' che
  la funzione di attivazione e' definita nel modo seguente
  $$
  \phi(x) =
  \begin{cases}
    1 &  if \;  x > 0\\
    -1 &  otherwise 
  \end{cases}
  $$
* Dal momento che sappiamo il funzionamento del singollo neurone, se conosciamo
  i pesi di ogni input possiamo calcolare molto facilmente l'output di un
  percettrone dato l'insieme di input
* Data una certa configurazione di pesi, l'output sara'
    * $1$ se $w_1 x_1 + w_2 x_2 + \dots + w_p x_p + \underbrace{w_0}_{bias} > 0$
    * $-1$ altrimenti ($\leq 0$)
* Come detto, il percettrone risolve problemi linearmente separabili
* E' evidente come dato un insieme di input vada ad assegnare a tale insieme una
  classe: positiva ($1$) o negativa ($-1$)
    * Se noi prendiamo per esempio il caso bidimensionale, possiamo calcolare il
      suo output come $w_1 x_1 + w_2 x_2 + w_0$
    * Se noi la poniamo a 0, tale equazione ci da l'equazione della retta del
      *decision boundary* del percettrone: $x_2 = -(w_1 x_1 + w_0) / w_2$
* Si noti come l'aumentare del numero di input, aumenti di conseguenza il numero
  di dimensioni in cui l'iperpiano va ad agire come decision boundary

