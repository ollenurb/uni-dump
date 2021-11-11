\newpage
# Modelli a Regole
## Apprendimento di liste di regole
* Una regola si manifesta come un'implicazione logica. Piu' di preciso e'
  formata da un *antecedente* e da una *conseguenza*. La conseguenza e'
  l'assegnamento della classe, mentre l'antecedente e' una congiunzione logica
  di vincoli sugli attributi.
* Una serie di regole puo' essere vista concettualmente anche nel modo seguente

```
if Literal1 then class=X
else if Literal2 then class=Y
else ...
...
else class=Default
```

>*"Se un determinato letterale (Literal1) e' soddisfatto da una determinata
istanza, allora predico la classe X"*

* La procedura per imparare un insieme di regole e' riassumibile essenzialmente
  in 3 passi fondamentali:
    1. Si costruisce il *corpo* (antecedente) della regola, andando ad
       aggiungere letterali in congiunzione tra loro. Proprio come succedeva per
       gli alberi, il *corpo* della regola andra' ad identificare un *segmento*
       nello spazio degli esempi. Per scegliere tra le alternative possibili, si
       utilizza la *copertura*, cioe' la dimensione del segmento delle istanze
       identificato dal corpo, che deve essere la piu' grande possibile e con
       *purezza* massima.
    2. Si selezione poi una label che sara' inserita come *testa* (conseguenza)
       della regola (`Class = label`)
    3. Il segmento delle istanze coperto dalla *testa* della regola viene
       eliminato dal dataset di train, ripartendo infine dal punto 1.

* Questa procedura genera una lista (o sequenza) di regole

> *La motivazione del passo 3 e' perche' questo tipo di algoritmi e' di tipo
*greedy*, cioe' viene scelta sempre la scelta ottimale. Se non si eliminassero
le istanze coperte dalla regola appena appresa, l'agoritmo sceglierebbe di nuovo
la stessa (siccome e' sempre quella migliore)*
 
* Le regole apprese mediante il metodo descritto devono essere interpretate
  nello stesso ordine in cui sono state apprese
* Un'altra differenza tra l'apprendimento di modelli a regole e modelli ad
  albero e' che nei modelli ad albero si usa una misura di purezza che considera
  *tutti i valori possibili di una feature* utilizzando una media pesata, mentre
  nei modelli a regole si utilizza una misura di purezza sui singoli vincoli dei
  letterali
* Come gia' visto anche, i modelli a regole rispetto i modelli ad albero,
  utilizzano anche la *copertura* del segmento come euristica di scelta delle
  regole
  
\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\SetKwInOut{Input}{Input}\SetKwInOut{Output}{Output}
\Input{Labelled training data $D$}
\Output{Rule list $R$}
\BlankLine
{$R \leftarrow \emptyset$ \;}
\While{$D \neq \emptyset$}{
    {$r \leftarrow LearnRule(D)$\;}
    {append $r$ to the end of $R$\;}
    {$ D \leftarrow D \ \{x \in D \; | \; x\text{ is covered by } r\}$}
}
\Return $R$\;
\caption{LearnRuleList(D) - learn an ordered list of rules}
\end{algorithm} 

\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\SetKwInOut{Input}{Input}\SetKwInOut{Output}{Output}
\Input{Labelled training data $D$}
\Output{rule $r$}
\BlankLine
{$b \leftarrow true$ \;}
{$L \leftarrow$ set of available literals \;}
\While{not $Homogeneous(D)$}{
    {$l \leftarrow BestLiteral(D, L)$\;}
    {$b \leftarrow b \land l$\;}
    {$ D \leftarrow \{x \in D \; | \; x\text{ is covered by } b\}$}
    {$ L \leftarrow L \ \{l' \in L \; | \; l'\text{ uses same feature as }l\}$}
}
{$C \leftarrow Label(D)$ \;}
{$R \leftarrow$ if $b$ then $Class=C$ \;}
\Return $r$\;
\caption{LearnRule(D) - learn a single rule}
\end{algorithm} 

* Un *feature tree* con branching a destra (*se falso, considera la prossima
  foglia*) corrisponde ad una lista di regole a letterali singoli

> *Liste di regole ereditano la proprieta' degli alberi di decisione di avere
una coverage curve **convessa** nel training set*

* Anche in questo caso e' possibile ordinare le regole secondo probabilita'
  empirica, ottenendo un ranker
* L'ordine delle probabilita' empiriche associate ad ogni regola (l'ordine di
  ranking) e' diverso dall'ordine appreso dall'algoritmo di inferenza
* *Per la dimostrazione vedere esempio sulle slides che dimostra che nel ROC
  plot la curva con AUC massima e' quella ordinata secondo le prob. emp.*

## Apprendere insiemi non ordinati di regole
* In linea di massima, gli algoritmi per l'apprendimento di insiemi di regole
  funzionano in questo modo:
    1. Si seleziona la classe che si vuole apprendere
    2. Si selezionano i *corpi* delle regole che coprono la piu' grande
       porzione, cioe' quelli che comprendono piu' esempi della classe scelta.
       In altri termini, si sceglie la regola con la precisione piu' alta
       rispetto alla classe scelta
  
* Questi passaggi producono un insieme di regole. Non c'e' nessun motivo di
  ordinarle dal momento che coprono gli esempi della stessa classe.
* La differenza degli *insiemi* rispetto alle *liste* di regole, e' che nel
  primo caso le regole sono *applicate contemporaneamente* e non in sequenza
  come nel secondo. Per questa ragione hanno una capacita' espressiva maggiore
  con la conseguenza di riuscire ad esprimere segmenti piu' fini, composti da
  istanze raggiunte da molteplici regole.

\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\SetKwInOut{Input}{Input}\SetKwInOut{Output}{Output}
\Input{Labelled training data $D$}
\Output{Rule set $R$}
\BlankLine
{$R \leftarrow \emptyset$ \;}
\For{every class $C_i$}{
    {$D_i \leftarrow D$ \;} 
    \While{$D_i$ contains examples of class $C_i$}{
        {$r \leftarrow LEarnRuleForClass(D_i, C_i)$\;}
        {$R \leftarrow R \cup \{ r \}$\;}
        {$D_i \leftarrow D_i \ \{ x \in C_i | x \text{ is covered by } r \}$\;}
    }
}
\Return $R$\;
\caption{LearnRuleSet(D) - learn an unordered set of rules}
\end{algorithm} 
  

\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\SetKwInOut{Input}{Input}\SetKwInOut{Output}{Output}
\Input{Labelled training data $D_i$; class $C_i$}
\Output{rule $r$}
\BlankLine
{$b \leftarrow true$ \;}
{$L \leftarrow $ set of available literals \;}
\While{not $Homogeneus(D)$}{
    {$l \leftarrow BestLiteral(D, L, C_i)$\;}
    {$b \leftarrow b \land l$\;}
    {$D \leftarrow \{ x \in D \; | \; x \text{ is covered by } b\}$\;}
    {$L \leftarrow L \ \{ l' \in L \; | \; l' \text{ uses same feature as }l\}$\;}
}
{$r \leftarrow$ if $b$ then $Class = C_i$ \;}
\Return $r$\;
\caption{LearnRuleForClass($D_i, C_i$) - learn a single rule for the given class}
\end{algorithm} 

### Miopia
* Il problema nell'usare la *precisione* come euristica di ricerca e' che tende
  a concentrarsi troppo a cercare le regole con precisione piu' alta, senza
  considerare altre regole, potrebbero avere una precisione complessiva piu'
  grande mediante opportune estensioni (cioe' con l'aggiunta di una disgiunzione
  nel passo successivo)
* Succede perche' l'algoritmo non e' in grado di "*vedere*" e quindi considerare
  anche il livello successivo del prossimo passo
* Questo problema e' detto *miopia* della precisione, ed e' risolubile
  applicando una correzione di Laplace  
* Applicando la correzione di Laplace si simulano delle imprecisioni nella
  copertura delle regole fatte di un solo antecedente, in modo da rendere valide
  anche le regole che non sarebbero considerate diversamente dall'algoritmo
* Un'altro metodo consisterebbe nell'impiego di algoritmi con approccio beam
  search, che tengono in memoria $k$ candidati migliori al posto di uno, in modo
  da tenere aperto un numero maggiore di alternative

> *La correzione di Laplace aggiunge un esempio positivo ed un esempio negativo
nel conteggio della probabilita' empirica*
$$
\dot{p}_i = \frac{n_i^+1}{n_i^+ + 1 + n_i^- + 1} = \frac{n_i^+1}{n_i + 2}
$$

## Insiemi di regole come rankers
* Anche in questo caso, e' possibile ottenere un ranker tramite l'ordinamento
  delle empirical probabilities
* Una particolare attenzione deve essere pero' posta alle regole che si attivano
  insieme per una determinata istanza
* Per poter calcolare l'empirical probability di questi casi particolari si fa
  una *micro-average* delle singole empirical probabilities.
    * Ad esempio, supponiamo che ci siano i segmenti $A, B, C$, ognuno
      identificato da una regola
    * Alcune regole potrebbero attivarsi insieme, generando i segmenti $AB, BC$
    * Per calcolare la probabilita empirica stimata di $AB$ si fa $\frac{n_A^+ +
      n_B^+}{n_A + n_B}$ (lo stesso vale per $BC$)
* Se si utilizza il modello a stima dell'EP per gli insiemi di istanze coperte
  da piu' regole, la concavita' della curva nel ROC plot non sempre e' garantita

> *In termini di performance i modelli a insiemi di regole sono migliori dei
modelli a liste di regole, poiche' sono in grado di distinguere gli esempi
coperti da una sola regola e gli esempi coperti da piu' regole. Piu' in
generale, un modello a liste di $n$ regole e' in grado di identificare $n$
segmenti nello spazio delle istanze, mentre un modello a insieme di $n$ regole
e' in grado di identificare $2^n$ segmenti.*

> ***ATTENZIONE**: Anche se i modelli a insiemi di regole sono piu' espressivi,
non sempre possono risultare in una curva di coverage convessa. Questo perche'
la stima dei segmenti sovrapposti potrebbe non essere precisa abbastanza.*

* Cosa succederebbe se in un modello a insieme di regole due regole che
  predicono due classi differenti si attivassero insieme per la stessa istanza?
    * Si sceglie la regola mediante il criterio della massima verosimiglianza:
      si sceglie quella che copre piu' istanze, quindi quella con la
      probabilita' piu' alta
    * In caso le alternative fossero sovrapposte allora si utilizza la stima
      vista in precedenza (si fa la micro average)

## Subgroup Discovery
* I modelli a regole possono essere anche utilizzati per descrivere
  ***sottogruppi***
* Un sottogruppo e' un sottoinsieme nello spazio delle istanze (alternativamente
  sono mappe $\hat{g}: \mathscr{X} \rightarrow \{ true, false \}$)
* Un sottogruppo puo' essere visto come un sottoinsieme di istanze che
  descrivono qualcosa di differente dal task di origine
  
> Un buon sottogruppo ha una distribuzione di classi molto differente rispetto
alla popolazione di origine

* Il criterio per valutare la bonta' di un sottogruppo e' la ***deviazione
  della distribuzione delle classi rispetto alla popolazione d'origine***
* Per valutare i sottogruppi non si usa a *precisione* ma si usa l'*average
  recall* per evitare qualsiasi tipo di bias verso la classe positiva

* Nello spazio degli esempi i sottogruppi si identificano mediante dei segmenti
  che partono dall'origine. Piu' questi si discostano dalla bisettrice verso
  l'alto, piu' questo indica che il sottogruppo identificato avra' un tasso di
  positivi piu' alto, mentre al contrario se e' discostato verso il basso avra'
  un tasso di positivi molto basso rispetto ai negativi
* Una differenza sostanziale rispetto al task di classificazione e' che nel
  subgroup discovery ci possono essere piu' regole che coprono gli stessi esempi
* Per permettere questo comportamento, non si eliminano piu' gli esempi che sono
  coperti da una regola che e' stata inferita (assegnando un peso = 0) ma si
  *dimezzano* in peso
* L'algoritmo `WeightedCovering(D)` permette di imparare delle regole che si
  sovrappongono tenendo a mente questo principio 
 
\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\SetKwInOut{Input}{Input}\SetKwInOut{Output}{Output}
\Input{Labelled training data $D$, with instance weights initialized to 1}
\Output{Rule list $R$}
\BlankLine
{$R \leftarrow \emptyset$ \;}
\While{some examples in $D$ have weight 1}{
    {$r \leftarrow LearnRule(D)$\;}
    {append $r$ to the end of $R$\;}
    {decrease the weights of examples covered by $r$\;}
}
\Return $R$\;
\caption{WeightedCovering(D) - learn overlapping rules by weighting examples}
\end{algorithm} 

* L'euristica che e' guidata dal peso e' *"nascosta"* all'interno dell'algoritmo
  `BestLiteral(D, L)` 

