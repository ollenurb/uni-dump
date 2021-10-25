# Modelli a Regole
## Modelli a regole ordinate in liste
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

* La procedura per imparare un insieme di regole e' riassumibile essenzialmente
  in 3 passi fondamentali:
    1. Si costruisce il *corpo* (antecedente) della regola, andando ad
       aggiungere letterali in forma congiuntiva. Proprio come succedeva per gli
       alberi, il *corpo* della regola andra' ad identificare un *segmento*
       nello spazio degli esempi. Per scegliere tra le alternative possibili, si
       utilizza la *copertura*, cioe' la dimensione del segmento delle istanze,
       che deve essere la piu' grande possibile e con *purezza* massima.
    2. Si selezione poi una label che sara' inserita come *testa* (conseguenza)
       della regola (`Class = label`)
    3. Il segmento delle istanze coperto dalla *testa* della regola viene
       eliminato dal dataset di train, ripartendo infine dal punto 1. Questo
       perche' questo tipo di algoritmi e' di tipo *greedy*, cioe' viene scelta
       sempre la scelta ottimale. Se non si eliminassero le istanze coperte
       dalla regola appena appresa, l'agoritmo sceglierebbe di nuovo la stessa
       (siccome e' sempre quella migliore).
* Questa procedura genera una lista (o sequenza) di regole

> Le regole apprese mediante il metodo descritto devono essere interpretate
nello stesso ordine in cui sono state apprese

* Differenza tra l'apprendimento di modelli a regole e modelli ad albero:
    * Nei modelli ad albero si usa una misura di purezza per *entrambi* i figli
      di un nodo padre utilizzando una media pesata
    * Nei modelli a regole, si utilizza una misura di purezza sulle singole
      regole


