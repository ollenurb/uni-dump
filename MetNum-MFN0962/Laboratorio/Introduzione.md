% Introduzione a matlab
# Introduzione a Matlab

* Definizione vettore: `[lo:step:hi]` 
* Estensione scripts matlab: `.m`
* Commenti: `%`
* Operatore `.` permette di prendere componente per componente in un oggetto iterabile
* Help: `help cmd` 
* Cercare funzioni: `lookfor parameter`
* Attenzione alle radici quadrate che per numerio negativi restituiscono dei *numeri immaginari*
* `plot` per disegnare funzioni (vanno specificati i punti da plottare passandoci dei vettori di valori)
* `fplot` per disegnare funzioni (non richiede i punti da plottare ma funziona in modo *"simbolico"*)
* Definizione matrici: `[r1; r2; ...; rn]`
* `size` ritorna la dimensione dell'oggetto
* `whos` utile per visualizzare gli oggetti nel workspace

**Prelevare valori da oggetti**:

* E' possibile prelevare un solo valore da un oggetto (es `O(1)` preleva il primo valore dell'oggetto `O`)
* Oltre che ad un singolo valore, si possono prelevare piu' valori con lo slicing (es `O(n:m)`, preleva
gli oggetti dalla posizione `n` alla posizione `m` . 
* Si possono combinare tali metodi (es. `A(1:4, 5)` preleva gli elementi le cui righe sono tra 1 e 4 e 
con colonna 5)
* Se si inserisce solo l'operatore `:` senza parametri, si intende l'intero set. (es. corrisponde a 
`lo : hi` dove lo e' l'indice piu' basso e hi e' la dimensione dell'oggetto) 

#### Istruzioni per il controllo di flusso
**If**
```matlab
if (cond) 
    <if-body>
else
    <else-body>
end
```

**For**
```matlab
for x=vector
    <for-body>
end
```

**While**
```matlab
while (cond) 
    <body> 
end
```

**Switch**
```matlab
switch (var)
    case val1 
        <case1-body>
    case val2
        <case2-body>
    ...
    otherwise 
        <otherwise-body>
end
```

# Lezione 2

#### Definizione di funzioni
Le funzioni sono definite come 
```matlab
function [out1, out2, ..., outN] = name(in1, in2, ..., inN)
  % function body
  % at least one out value should be assigned before finishing with end
end
```

Le funzioni possono ritornare piu' di un valore in oputput, quindi le assegnazioni: 

* x = fun (a)
* [x,y] = fun(a,b)
* [x1..xn] = fun(a)

sono tutte valide. 

* `nargin` restituisce i valori passati in input che sono stati valorizzati
* `linspace(lo, hi, n)` costruisce un vettore di `n`(default `=100`) valori random compresi tra `lo` e `hi`. 
* `f = @(var) funexpr` serve a definire funzioni matematiche dove `var` e' la variabile della funzione, 
`funexpr` e' l'espressione della funzione e `f` il nome della funzione.  
Esempio: `f = @(x) cos(x).*sin(x)` il `.` e' necessario quando l'input potrebbe essere anche un vettore



