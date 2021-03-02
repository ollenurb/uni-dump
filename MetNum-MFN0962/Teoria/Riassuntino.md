# Metodi per al risoluzione di equazioni lineari
* Un fattore di condizionamento del problema e' dato dal valore della derivata prima della funzione
  in prossimita' della radice, piu' e' piccola piu' il problema sara' mal condizionato. (Ci si
  arriva tramite il polinomio di Taylor oppure per via grafica) se la funzione tende ad essere
  tangente all'asse $x$ tende quindi ad avere piu' di una radice.

#### Bisezione
* La funzione deve essere continua e avere una radice in $[a,b]$ 
* Si basa sulla divisione progressiva dell'intervallo con $c=\frac{b - a}{2}$
* Siccome ad ogni iterazione l'intervallo si dimezza, anche l'errore si dimezza quindi $p=1$ e
  $C=\frac{1}{2}$

#### Newton
* La formalizzazione deriva dal fatto che si considera un fascio di rette passanti per $(x_k,f(x_k))$ 
  e imponendo successivamente che il coefficiente angolare sia $f'(x_k)$ e che $y=0$. ($y - f(x_k) =
  f'(x_k)(x-x_k)$)
* La funzione deve essere continua e derivabile in $[a,b]$, inoltre il punto iniziale $x_0$ deve
  essere scelto sufficientemente vicino alla soluzione se no il metodo non converge.
* Ha convergenza quadratica
  
#### Secanti
* Uguale a Newton ma fissa il coefficiente angolare
* Ordine di convergenza $p \approx 1.618$ 

#### Punto Fisso
* Serve a trovare un $\alpha$ tale che $\alpha = g(\alpha)$
* Il punto fisso $\alpha$ viene trovato se la funzione e' contrattiva in un intervallo $I$ che
  contiene $\alpha$
* Se la funzione e' derivabile si puo' dire che sia anche contrattiva se $|g'(x)<1$ in $I$
* $\alpha$ e' unico 
* Se $g'(\alpha)=0$ e $g''(x)$ continua in $[a,b]$ allora il metodo ha ordine di convergenza $p=2$
* 


