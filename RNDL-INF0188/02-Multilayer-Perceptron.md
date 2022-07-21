---
title: Multilayer Perceptron
---

* Abbiamo visto col percettrone che esso classifica le classi solo nel caso di
  classi linearmente separabili
* Esso riesce a dividere esattamente le due classi trovando un iperpiano che le
  separi
* Nei casi in cui l'insieme non sia linearmente separabile, il percettrone non
  puo' fare nulla
* Per ovviare a questo problema si e' introdotto il *MultiLayer Perceptron* (per
  cui sono stati essenzialmente introdotti i layer nascosti)

## Adaline

* Il modello Adaline e' di fatto per struttura un Percettrone
* Differisce dal percettrone per l'algoritmo con cui si va ad addestrare (una
  variante semplificata dellla *backpropagation*)
* Inoltre, Adaline ha una funzione di trasferimento che e' pari all'identita'
* Algoritmo di apprendimento **Least-Mean-Square (LMS)**
* Possiamo calcolare l'errore che viene commesso sul *k-esimo* esempio nel modo seguente
* Per ogni *k-esimo* esempio etichettato $(\mathbf{x}^{(k)}, d^{(k)})$,
$$
E^{(k)}(\mathbf{w}) = \frac{1}{2}(d^{(k)} - y^{(k)})^2 =
\frac{1}{2}\left(d^{(k)} - \sum^m_{j=0}\mathbf{x}^{(k)}_j \mathbf{w}_j \right)^2
$$
* L'errore totale su tutto il dataset e' la somma degli errori al quadrato di
  tutti gli esempi
$$
E_{tot} = \sum^N_{k=1} E^{(k)}
$$
* $E_{tot}$ e' una funzione quadratica dei pesi, per cui sappiamo per forza che
  la sua derivata esiste ovunque
* L'algoritmo consiste nel applicare un algoritmo di discresa del gradiente
  incrementale
* A grandi linee, tale algorimo cerca il valore di pesi ottimale che permette di
  ottenere l'output in uscita che ci si attende
* **Gradiente**: Quantita' che si applica a funzioni di piu' variabili. Da in
  output un vettore per ogni punto della funzione, che ha direzione verso i
  punti che risultano nella crescita maggiore del valore della funzione
  (*steepest ascent*)
* L'idea dell'algoritmo e' quella di calcolare ad ogni step l'opposto del
  gradiente del'errore
$$
-(\nabla E^{k}(\mathbf{w})) = - \left[ \frac{\partial E}{\partial w_1},
\dots, \frac{\partial E}{\partial w_m}\right]
$$
* Successivamente, ci si sposta facendo un piccolo passo (di grandezza $\eta$)
  in tale direzione
$$
\mathbf{w}(k+1) = \mathbf{w}(k) - \eta(\nabla E^{(k)}(\mathbf{w}))
$$
* Per calcolare il gradiente, dell'errore totale, dobbiamo prima vedere come
  calcolare la derivata parziale dell'errore rispetto al singolo componente
  $w_j$
$$
\frac{\partial E^{(k)} \mathbf{w}}{\partial \mathbf{w}_j} = 
\frac{\partial E^{(k)} \mathbf{w}}{\partial y^{(k)}}
\frac{\partial y^{(k)}}{\partial w_j} =
-(d^{(k)} - y^{(k)})x_j^k
$$
* Essenzialmente si applica la *chain rule* per fare la derivata
* La delta rule per l'update dei pesi sara' quindi (in forma compatta) 
$$
\mathbf{w}(k + 1) = \mathbf{w}(k) + \eta (d^{(k)} - y^{(k)})\mathbf{x}^{(k)}
$$
* Si noti come tanto piu' grande sara' l'errore, tanto di piu' verra' modificato
  il peso
* Possiamo estendere le considerazioni fatte per Adaline (che ha la stessa
  architettura del Percettrone) al Multilayer Perceptron

## Multi Layer Perceptron

* Le reti multi layer sono molto piu' generali delle architetture viste fin'ora
* L'idea e' quella di introdurre dei livelli *nascosti*, che non interagiscono
  direttamente con il mondo esterno (non ricevono direttamente inputs, ne
  ritornano direttamente outputs)
* Questi livelli servono a superare le limitazioni delle reti a layer singolo,
  per cui riescono a rappresentare dei task che non sono linearmente separabili.
* Il valore di output del singolo neurone, quindi, sara' calcolato nel modo
  seguente
$$
v_j = \sum w_{ji} y_i
$$
* in cui:
    * $w_{ji}$ e' il peso dal neurone $i$ al neurone $j$
    * $y_i$ e' l'output del neurone $i$ (che viene trattato in input
      essenzialmente)
* L'algoritmo di apprendimento classico di queste reti e' anch'esso basato sulla
  discesa del gradiente
* Per poter utilizzare questo algoritmo, le funzioni di trasferimento devono
  essere derivabili ovunque
* Una funzione classica di trasferimento che si utilizza e' la **Funzione
  Sigmoide**, definita come
$$
\phi(v_j) = \frac{1}{1 + e^{- \alpha v_j}}
$$
* con $\alpha > 0$
* Come visto la somma pesata rappresenta l'equazione di un iperpiano nella
  dimensione del problema
* L'inserire diversi layer intermedi, fa si che si introduca un numero diverso
  di questi iperpiani

### Algoritmo di Backpropagation

* Per fare l'apprendimento di questo tipo di reti, si utilizza l'algoritmo di
  **backpropagation**
* Questo algoritmo cerca di trovare i valori dei pesi in modo da minimizzare
  l'errore quadratico medio totale della rete sull'intero dataset
* Differenzia tra due tipologie di correzioni di pesi:
    * Correzioni per pesi che connnettono gli hidden layers
    * Correzioni per pesi che connettono gli input/output layers
* L'algoritmo consiste nell'applicazione ripetuta di due passaggi principali:
    * **Passo Forward**: viene computato l'errore per ogni neurone andando a
      calcolare l'ouput della rete per un determinato esempio
    * **Passo Backward**: viene utilizzato l'errore per fare l'update dei pesi
      utilizzando la update rule

> I nodi hidden contribuiscono all'errore attraverso i nodi dei prossimi layer

* Secondo questa osservazione, partendo dall'output layer, l'errore e' propagato
  al contrario attraverso la rete, calcolando ricorsivamente il **gradiente
  locale** (derivata dell'errore rispetto al peso) di ogni peso
* La funzione dell'errore e' definita come lo scarto quadratico medio
* Sia $e_j(n)$ l'errore commesso dal neurone $j$ al passo $n$
$$
e_j(n) = d_j(n) - y_j(n)
$$
* Sia il *pattern error* la somma degli errori al quadrato dei *neuroni di output*
$$
E(n) = \frac{1}{2} \sum_{j \text{output node}} e^2_j(n)
$$

