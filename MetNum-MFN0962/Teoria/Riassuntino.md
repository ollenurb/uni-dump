# Metodi per al risoluzione di equazioni lineari

#### Bisezione

* La funzione deve essere continua e avere una radice in $[a,b]$ 
* Si basa sulla divisione progressiva dell'intervallo con $c=\frac{b - a}{2}$
* Siccome ad ogni iterazione l'intervallo si dimezza, anche l'errore si dimezza quindi $p=1$ e
  $C=\frac{1}{2}$

#### Newton

* La formalizzazione deriva dal fatto che si considera un fascio di rette passanti per $x_k,f(x_k))$ 
  e imponendo successivamente che il coefficiente angolare sia $f'(x_k)$ e che $y=0$
* La funzione deve essere continua e derivabile in $[a,b]$, inoltre il punto iniziale $x_0$ deve
  essere scelto sufficientemente vicino alla soluzione se no il metodo non converge.
* 
