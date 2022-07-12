\newpage
# Introduzione all'analisi numerica 

L'analisi numerica e' la materia o branca della matematica che si occupa della definizione e
l'analisi di algoritmi per la risoluzione di *problemi* matematici in cui sono coinvolte variabili
reali o complesse.  
La soluzione di tali problemi rappresenta un'approssimazione della soluzione reale del problema.

Lo studio degli errori costituisce una parte importante dell'analisi numerica, poiche' condizionano in 
modo diretto la qualita' della soluzione.
Una tipologia di errore ineliminabile e' quella degli **errori sperimentali**, cioe' tutti quegli errori 
che dipendono dalle condizioni dell'esperimento in cui sono stati raccolti i dati e dalla precisione
finita degli strumenti con cui e' stata effettuata la misurazione. 
Altre tipologie di errore possono essere gli **errori di troncamento**, **errori di arrotondamento**, e 
gli **errori di discretizzazione** che sono introdotti quando i dati sono rappresentati con un numero
finito di cifre. 

## Buona posizione e condizionamento 
Tale modello e' costituito da un insieme di formule che descrivono il comportamento del fenomeno
sotto studio. Spesso il fenomeno da studiare e' profondamente complesso, per cui anche il suo
modello matematico sara' tale. Per questa ragione le equazioni e formule del modello risultano
essere troppo complicate per 
essere risolte con metodi diretti, e in questi casi si preferisce associare al modello matematico un 
**modello numerico**. 
Il fine del modello numerico e' quello di ottenere una forma del modello matematico particolarmente adatta 
per la risoluzione mediante calcolatore. Questa forma si ottiene introducendo delle semplificazioni o 
approssimazioni nel modello matematico di partenza. 

Un determinato problema numerico viene detto **ben posto** quando questo possiede una e una sola soluzione 
che dipende con *continuita' dai dati*. In caso contrario viene detto **mal posto**. 

Esempi di problemi mal posti possono essere:  

1. Trovare $x \in \mathbb{R}$ che soddisfa l'equazione $x^2+1=0$ (*la soluzione non esiste*) 
2. Trovare $x, y \in \mathbb{R}$ che soddisfano l'equazione $x+y=1$ (*manca l'unicita'*)  

Ma cosa significa *con continuita' dai dati*? Semplicemente significa che se ho un determinato 
dato $d' \neq d$ in input a cui corrisponde una determinata soluzione $x' \neq x$, allora se 
$d' \rightarrow d$ risulta che $x' \rightarrow x$.
Quando questo accade si dice che il *problema numerico* in questione e' *stabile* cioe' che piccole 
perturbazioni sui dati in ingresso non influenzano in modo significativo la soluzione (dati in uscita). 

Nell'analisi numerica spesso si vogliono avere delle stime qualitative sui modelli numerici che indichino 
quanto la soluzione venga influenzata dai dati perturbati in input.   
Questa caratterizzazione viene detta **condizionamento del problema** ed e' definita come:  

>***Definizione**: Sia $\delta d$ una perturbazione dei dati $d$ di un problema e sia $\delta x$ la 
>corrispondente perturbazione sulla sua soluzione $x$. Sia inoltre $\left \| \cdot \right \|$ una qualsiasi 
>norma vettoriale. Il **numero di condizionamento assoluto** $K=K(d)$ e' definito dalla relazione:
>$$
>\left \| \delta x \right \| \leq K \left \| \delta d \right \|
>$$
>mentre per il **numero di condizionamento relativo** $k = k(d)$:*
>$$
>\frac{\left \| \delta x \right \|}{\left \| x \right \|} 
\leq k \frac{\left \| \delta d \right \|}{\left \| d \right \|}
>$$

Il condizionamento misura quindi **quanto** un errore sui dati possa essere amplificato nei risultati. 
Piu' tale numero e' grande piu' risulta essere amplificato l'errore nei risultati. 

## Algoritmi 
>***Definizione**: Un **algoritmo** e' una sequenza univoca di un numero finito di operazioni elementari 
>che stabilisce come calcolare la soluzione di un problema assegnati certi dati iniziali.*

Un algoritmo e' detto **stabile** quando al tendere delle operazioni all'infinito, la soluzione tende a 
quella reale. E' detto **instabile** quando gli errori si propagano in modo incontrollato man mano che 
l'algoritmo viene eseguito producendo un risultato diverso da quello reale. 
La complessita' di un algoritmo numerico e' calcolata in flops (*Floating Points Operations Per Second*), 
cioe' in numero di operazioni in virgola mobile necessarie a risolvere il problema numerico che risolve 
l'algoritmo. 
E' utile anche dare una definizione di errore relativo e assoluto per gli algoritmi numerici: 

>***Definizione**: Siano $a$ il valore esatto della soluzione di un problema e $a^*$ il valore perturbato 
>di $a$, **l'errore assoluto** di un algoritmo e' definito come
>$$ \varepsilon = \left | a - a^* \right | $$
>mentre **l'errore relativo** e' definito come *
>$$ \rho =\frac{\left | a - a^* \right |}{ \left | a \right | } $$

L'errore relativo fornisce informazioni sul numero di cifre significative esatte in $a^*$ (cioe' quelle a
partire dalla prima cifra diversa da $0$)
