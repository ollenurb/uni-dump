% Web of data: I linguaggi 
# Web of data: I linguaggi

#### Reti semantiche 
* Utilizzare per rappresentare la conoscenza strutturata
* Equivalgono ad un sottoinsieme della logica del prim'ordine dove

    - I nodi sono i termini 
    - Gli archi sono i predicati
    - La congiunzione e' implicita

* Relazioni che coinvolgono piu' di due entita' costringono l'introduzione 
di un ulteriore nodo (stile relazioni `n-n` DB)

**Reti semantiche proposizionali**: Reti semantiche che includono nodi rappresentanti proposizioni

Le reti soffrono di alcune ambiguita' (eterogeneita'): 
* Archi rappresentano relazioni di tipo diverso tra concetti
* Nodi rappresentano concetti di tipo diverso
 
### Frame Theory 
* Evoluzione delle reti semantiche finalizzata a rappresentare la conoscenza di tipo *stereotipato*
* Sviluppato per alcune applicazioni in ambito di visione artificiale o elaborazione del linguaggio

Un frame e' una struttura dati per la rappresentazione di *situazioni stereotipiche*, come ad esempio
il trovarsi in una determinata stanza oppure l'essere ad un compleanno di un bambino. 
I livelli piu' alti di un frame sono fissi e rappresentano cose che sono sempre vere in merito a 
situazioni specifiche. I livelli piu' bassi hanno nodi terminali chiamati *slots* i quali devono 
essere riempiti con istanze specifiche o dei dati. 

Struttura di un frame: 

* Contrassegnato da un identificativo
* Ha degli slot piu' generali e specifici
* Ha degli slot piu' generici: essi possono avere dei vincoli di tipo, inoltre il contenuto di un frame 
puo' pountare ad un altro frame. 



