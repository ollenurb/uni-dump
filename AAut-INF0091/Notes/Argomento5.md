/newpage
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

## Liste di regole come rankers 
> *Liste di regole ereditano la proprieta' degli alberi di decisione di avere
una coverage curve **convessa** nel training set*

* L'ordine delle probabilita' empiriche associate ad ogni regola (l'ordine di
  ranking) e' diverso dall'ordine appreso dal modello
* *Vedere esempio sulle slides che dimostra che nel ROC plot la curva con AUC
  massima e' quella ordinata secondo le prob. emp.*
