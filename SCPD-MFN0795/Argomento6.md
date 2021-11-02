\newpage
# Strategie *Divide et Impera* 
La strategia *divide et impera* e' particolarmente utile per la soluzione di
diversi problemi, per tale motivo e' un modo per risolvere i problemi molto
ricorrente in computer science. 
Essenzialmente consiste nell'applicare una divisione di un grosso problema in
diversi sottoproblemi di minor dimensione, ma della stessa forma del problema
originale (tipicamente ottenuta mediante *ricorsione*). Ogni soluzione di questi
sottoproblemi di portata piu' piccola viene poi combinata con le altre in modo
da ottenere la soluzione del problema originale.
Una strategia divide et impera e' in generale applicabile quando i problemi
impongono una struttura di tipo gerarchico. Si pensi, ad esempio, agli algoritmi
di ordinamento. Alcuni di essi, nonostante operino su una struttura dati di tipo
lineare (*array*), hanno comunque una struttura imposta dalla computazione
gerarchica, per cui e' possibile sfruttare questa strategia. 

> *La strategia dividi e conquista e' diversa dal semplice partizionamento, che
consiste invece in una semplice divisione del problema in parti.*

Nel contesto del parallel computing e' possibile trarre vantaggio da questa
strategia di pensiero, siccome e' possibile sfruttare la suddivisione per
estrarre il parallelismo. L'idea e' semplicemente quella di utilizzare diverse
unita' di calcolo per risolvere i diversi sotto-problemi, aggregando infine i
singoli risultati.

L'implementazione che puo' risultare banale dal punto di vista sequenziale,
nasconde delle difficolta' quando si parla di implementazione parallela. Questo
perche' la ricorsione necessita' di uno *stack*, che per essere implementato
richiede l'allocazione dinamica della memoria, che e' un problema difficile in
ambienti distribuiti. Addirittua nelle GPU e' sconsigliato, perche' non
supportato e a causa di prestazioni spesso scadenti.

Vediamo ora alcuni esempi di problemi che possono sfruttare questo modo di
risoluzione.

## Operazioni su strutture dati lineari 
Consideriamo delle operazioni di folding su delle strutture dati lineari. In
linea di massima, il problema consiste essenzialmente, data un'operazione di
aggregazione che sia *associativa*, applicarla su un'intera sequenza di elementi
per ottenere un'aggregazione finale. E' anche chiamata `foldr` o `reduce`.
Formalmente, dato l'operatore associativo $\oplus$ e una sequenza di elementi
$[e_1, e_2, \dots, e_n]$, si vuole ottenere $e_1 \oplus e_2 \oplus \dots \oplus
e_n$.

In questo caso, l'idea e' quella di suddividere la sequenza progressivamente
fino ad una grandezza stabilita (che rappresenta appunto la grana
computazionale), per far eseguire l'operazione di associazione sulle
sottosequenze ottenute da diverse unita' computazionali. I risultati di queste
operazioni, a loro volta, saranno un'altra sequenza di elementi, che sara'
combinata nello stesso modo per ottenere il risultato finale.

![Operazione di reduce risolta con strategia dividi e conquista. La lista
originale e' divisa in 3 sottoliste risolte da differenti unita' computazionali.
I risultati formano a loro volta una lista, risolta infine da un'unita'
computazionale predefinita in modo da ottenere il risultato
finale.](img/6.1_reduce.png){ width=50% }

## Algoritmi di ordinamento


### Merge Sort 

### Bucker Sort

## Integrazione Numerica

## Problema *N-Body*
