# Laboratorio Backpropagation

### Esercizi

1. Qual'e' lo scopo del controllo eseguito dal primo `if`?
2. Cosa contengono le matrici A e B? Ed a quali valori sono inizializzate?
3. Cosa contiene la variabile `q` al termine di ogni ciclo `while`?
4. Qual'e' la funzione della variabile `ciclo`?
5. Quale variabile contiene i segnali d'errore $\delta$ relativi alle unita' di
   uscita?
6. Quale variabile contiene i segnali d'errore $\delta$ relativi alle unita'
   hidden?
7. Identificare i vari fattori che costituiscono i segnali d'errore delle unita'
   hidden e di uscita
8. Si provino a variare gli iperparametri in modo tale da ottenere una corretta
   classificazione delle due classi

### Soluzioni

1. Controllare che la matrice di dati in input (il dataset) abbia tanti quanti
   esempi quante sono le righe della matrice target
2. `A` e' una matrice `nhid`x`n_features` che contiene i pesi dei neuroni hidden 
3. `q` contiene ad ogni iterazione lo scarto quadratico medio rispetto
   all'intero dataset `Inp`
4. `ciclo` e' una variabile booleana che dice se continuare a iterare o meno 
5. I segnali $\delta$ rispetto ai neuroni di *output* sono rappresentati dalla
   variabile `DOut`
6. I segnali $\delta$ rispetto ai neuroni di *hidden* sono rappresentati dalla
   variabile `DYhid`
7. Essenzialmente, $DOut_j = e^{(k)}_j \cdot y_j \cdot (1 - y_j)$ dove $y_j$ e'
   l'output del neurone di output *j-esimo*
8. `ND`
