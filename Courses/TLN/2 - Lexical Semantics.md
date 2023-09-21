---
title: 'Riassunto di Tecnologie del Linguaggio Naturale'
subtitle: 'Parte 2: Semantica Lessicale'
author: Matteo Brunello
numbersections: true
papersize: a4
geometry: margin=2.5cm
---

# Introduzione
La semantica lessicale è lo studio del **significato** delle parole e le loro
**relazioni**. La ricerca nelle ontologie è diventata sempre più centrale
nell'ambito della semantica lessicale. Un'ontologia è un modello semantico
formale basato sulla logica per rappresentare la conoscenza specifica di un
dominio. L'ontologia definisce un vocabolario che concettualizza la conoscenza e
permette quindi di rappresentare fatti per mezzo dei termini specificati in
esso. Tale vocabolario può poi essere condiviso, per cui facilita anche
l'interscambio di conoscenza.

L'importanza di avere un vocabolario comune può essere esplicata per mezzo di un
esercizio mentale: immaginiamo di voler rappresentare un bicchiere d'acqua.
Qualche persona potrebbe vederlo mezzo pieno, mentre altri potrebbero vederlo
mezzo vuoto. In questo caso, stabilire un vocabolario comune permette di
*fissare* la stessa prospettiva con cui si descrive la realtà di riferimento.

Il termine ontologia deriva dalla filosofia. Essa è per appunto la disciplina
che studia la natura (ciò che esiste) e la struttura della realtà. Un'ontologia
filosofica è un sistema strutturato di *entità*, organizzato in *categorie* e
*relazioni*.

Un'ontologia è una specifica esplicita di una concettualizzazione. Essa fornisce
un insieme di primitive rappresentazionali (che formano il vocabolario) con le
quali è possibile modellare un dominio di conoscenza. Tali primitive sono
*classi* e *relazioni* e tramite esse è possibile rappresentare diverse
situazioni che coinvolgono diverse entità/individui appartenenti alle classi.
L'insieme di primitive e di rappresentazioni di situazioni forma una *Knowledge
Base*, essa è quindi composta da:

* Componente Terminologica (ontologia): indipendente da una particolare
  situazione. Specifica i termini che rappresentano la formalizzazione del
  dominio. 
* Componente Asserzionale: riflette specifiche situazioni, rappresentate per
  mezzo dei termini dell'ontologia.

> La semantica riguarda il "ciò che è", il che coincide con ciò che riguarda le
> ontologie stesse.

## Design di Ontologie
Una buona parte del design di ontologie si concentra nel determinare se due
classi sono in relazione di sottoclasse tra di loro o meno. Un criterio per fare
ciò è l'*identity criteria*. Un criterio di identità sono le condizioni che
servono a stabilire l'uguaglianza di due entità. Ad esempio, una durata è uguale
ad un'altra se sono entrambe lunghe uguali, per cui il criterio di identità
sarà: *stessa lunghezza*. Se due classi non hanno lo stesso criterio di
identità, allora non possono essere in relazione di sottoclasse tra loro.

## Ontologie Fondazionali
Le ontologie fondazionali sono ontologie che catturano un insieme di distizioni
base valide in vari domini. Formalizzano in qualche senso la conoscenza di senso
comune, di base, sulla quale tutta la conoscenza più specifica si basa. Esistono
diverse ontologie fondazionali sviluppate in vari periodi come risultato di vari
sforzi di ricerca, quali DOLCE, SUMO e CYC.

DOLCE segue un approccio moltiplicativo, secondo il quale diverse entità possono
essere co-localizzate nello stesso istante di tempo e nello spazio. Questo
perchè ad esempio il vaso e la terracotta sono due istanze che sono
co-localizzate dallo stesso spazio-tempo, ma non sono la stessa cosa. 
DOLCE si basa su una distinzione fondamentale tra:

* *Enduranti* (entità): oggetti che esistono completamente nel tempo, cambiando
  proprietà nel tempo ma pur sempre mantenendo la propria identità. 
* *Perduranti* (eventi): oggetti che accadono, si svolgono o sviluppano nel
  tempo estendendosi accumulando diverse parti temporali.

In DOLCE la relazione principale tra enduranti e perduranti è quella di
*partecipazione*: un endurante *"vive"* nel tempo, partecipando in qualche
perdurante.
La cosa interessante è che i perduranti hanno una locazione temporale ben
definita, mentre la locazione spaziale no. Essa è appunto definita
indirettamente dalla locazione spaziale dei partecipanti. La stessa cosa succede
con gli enduranti, però con la locazione temporale.

Un'altra caratteristica principale di DOLCE sono le **qualità**, cioè delle
entità di base che possiamo percepire o misurare quali forme, colori, grandezze,
odori, ecc..
La differenza tra qualità e proprietà è che le prime sono particolari, legate
alle singole entità, mentre le seconde sono universali, cioè condivise da tutti
gli individui che fanno parte della stessa classe.
Da ciò ne segue che due individui non possono avere la stessa qualità.

Un'altra peculiarità di DOLCE è che si distingue tra le *qualità* (es. il colore
di una specifica rosa) e il loro *valore* (es. una particolare gradazione di
rosso). Quest'ultimo è detto *quale*, e descrive la posizione di una qualità
individuale all'interno di un certo spazio concettuale. Ad esempio, quando
diciamo che due rose hanno lo stesso colore, intendiamo che le loro qualità (che
sono distinte), hanno la stessa posizione all'interno dello spazio colori (che
in questo caso è lo spazio concettuale).
Questa differenza permette di rappresentare la relazione che esiste tra concetti
espressi come aggettivi e concetti espressi come nomi.

# Rappresentazioni Strutturate
La rappresentazione strutturata della conoscenza nasce dall'esigenza di
rappresentare la conoscenza del mondo in cui un sistema intelligente deve
operare. Per soddisfare questa esigenze, un sistema di rappresentazione
strutturata deve fornire:

* Un **linguaggio di rappresentazione**, che definisce le strutture sintattiche
  per la rappresentazione delle informazioni.
* Un **insieme di regole** di manipolazione delle struttura sintattiche in
  accordo con il loro significato.

Vediamo quindi alcuni sistemi di rappresentazione strutturata visti.

## Reti Semantiche
Sono una classe di sistemi di rappresentazione che adottano una struttura a
grafo (*rete*) in cui i *nodi* rappresentano *concetti*, mentre gli *archi*
rappresentano *proprietà* dei concetti.

L'istanza più semplice di questa classe di sistemi sono i *grafi relazionali*.
Essi permettono di descrivere le relazioni tra le diverse *entità* del grafo. In
questo grafo i diversi nodi rappresentano le *entità*, collegate tra loro da
*archi* etichettati in modo da esplicitare la *relazione* che intercorre tra le
due entità collegate. Dal punto di vista formale, i grafi relazionali
implementano un sottoinsieme del calcolo dei predicati del primo ordine: gli
archi rappresentano i *predicati*, e i nodi i *termini*.


