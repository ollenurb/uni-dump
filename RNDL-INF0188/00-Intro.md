---
title: Introduzione
---

* Le reti neurali sono utilizzate in tanti ambiti e diversi contesti 
* Si ispirano al metodo di funzionamento del cervello per cercare di acquisire
  la stessa duttilita' e performances
* L'unita' computazionale di base nel cervello e' il *neurone*, connessi tra
  loro da *sinapsi*. Anche le reti neurali condividono queste caratteristiche
  con il cervello.
* Il ruolo di un neurone e' quello di raccogliere l'informazione che arriva da
  altre parti della rete neuronale e propagarla al resto della rete
* I neuroni funzionano in parallelo con il resto dei neuroni nella rete/cervello
* L'apprendimento e' dato dalla modifica delle sinapsi/pesi delle connessioni
  tra i neuroni
* All'interno di una rete neurale, non c'e' differenza tra memoria e
  ragionamento: e' tutto codificato all'interno dei pesi

## Neurone

* Il *neurone artificiale* (McCulloch Pitts, 1943), cerca di catturare le
  caratteristiche del neurone biologico
* Un neurone e' costituito dai seguenti componenti fondamentali: 
    * **Insieme di valori in input** $x_1, \dots, x_p$, che vengono ricevuti
      contemporaneamente
    * **Insieme di pesi** $w_1, \dots, w_p$, collegati ai valori di input fino a
      raggiungere il cuore del neurone
    * **Funzione di aggregazione del segnale**, che e' una somma pesata. Per ogni
      valore in input $x_i$ che raggiunge il *j-esimo* neurone, il suo valore
      corrispondente sara' $w_{ji} \cdot x_i$
    * **Funzione di attivazione** $\phi$, applicata al segnale aggregato
    * Un **Bias**, che indica la tendenza naturale del neurone ad eccitarsi, piu' e'
      grande piu' il neurone sara' attivo anche con inputs piccoli
* Dal punto di vista formale, il *bias* viene integrato come un input della rete
  con peso corrispondente sempre pari a $1$. ($x_0 = 1, w_{j0} = b$ in cui $b$
  e' il bias)
* In questo senso, ogni neurone avra' il suo insieme di valori di input, piu'
  uno (il bias)
* Per mezzo di questa architettura di base si possono ottenere diverse tipologie
  di reti, che si suddividono in due sottocategorie principali:
    * **Reti ad un solo livello** (es. Percettrone)
    * **Reti a piu' livelli** (es. Recurrent NN)

### Funzioni di attivazione

* Possono essere di due tipi principali:
    1. *Threshold*: mandano a 1 valori $\geq 0$ e 0 valori $\lt 0$
    2. *Sigmoidi*: sono della forma
       $$
       \phi(v) = \frac{1}{1 + exp(-\alpha v)}
       $$
       dove $\alpha$ e' il parametro che regola la *pendenza* della curva
