# Resolution

## Da CNF a 3CNF

**Definizione**: Una formula e' in 3CNF sse e' in CNF e ogni disgiunzione ha
esattamente 3 letterali.

**Algoritmo** (*Costruzione di formule in 3CNF*): La formula in CNF data in
input $S$, potrebbe avere diverse forme, per cui l'algoritmo di ottiene per
costruzione sui diversi casi. Sappiamo che per definizione di formula in CNF, la
formula in input $S = \{C_1, \dots, C_n\}$, in cui il singolo $C_i = \{ l_i^1
\lor l_i^2 \lor \dots \lor l_i^{n_i} \}$. Non sappiamo quanti letterali
contengono le singole clausole, per cui facciamo distinzione in base al valore
di $n_i$:

1. Se $n_i = 1$, crea due nuovi atomi $p_i^1, p_i^2$ che non occorrono in
   nessuna clausola, e rimpiazza $C_i$ con
   $$
   (l_i \lor p_i^1 \lor p_i^2) \land
   (l_i \lor \neg p_i^1 \lor p_i^2) \land
   (l_i \lor \neg p_i^1 \neg \lor p_i^2)
   $$

2. Se $n_i = 2$, crea un nuovo atomo $p_i^1$ che non occorre in nessuna
   clausola, e rimpiazza $C_i$ con
   $$
   (l_i^1 \lor l_i^2 \lor p_i^1) \land
   (l_i^1 \lor l_i^2 \neg p_i^1)
   $$

3. Se $n_i > 3$, crea due nuovi atomi $p_i^1, p_i^2, \dots, p^i_{n-3}$ che non
   occorrono in nessuna clausola, e rimpiazza $C_i$ con
   $$
   (l_i^1 \lor l_i^2 \lor p_i^1) \land
   (\neg p_i^1 \lor l_i^3 \lor p_i^2) \land \dots \land
   (\neg p_{n-3}^i \lor l_i^{n-1} \lor l_i^n)
   $$

**Teorema**: L'algoritmo termina per una qualsiasi formula di lunghezza finita

**Dimostrazione**: Sia $|S|_3$ il numero di clausole con piu' di 3 letterali
in $S$. Ogni volta che vado a fare una trasformazione, o $|S|_3$ rimane
invariato (*applicazione regola 1 e 2*), oppure diminuisce fino a raggiungere lo
$0$. $\blacksquare$

**Teorema 4.13** (*Adeguatezza*): Sia $A$ una formula in CNF e $A'$ una formula
in 3CNF costruita a partire da $A$ dall'algoritmo 4.12. Allora $A$ e'
soddisfacibile sse $A'$ e' soddisfacibile. Inoltre, la lunghezza di $A'$ (il
numero di simboli da cui e' composta) e' *polinomiale* rispetto alla lunghezza
di $A$. 

## Risoluzione

**Definizione** (*Regola di Risoluzione*): Siano $C_1$ e $C_2$ clauselo tali per
cui $l \in C_1$ e $l^C \in C_2$. Tali clausole sono dette **conflittuali**,
nella coppia di letterali complementari $l, l^C$. I *risolvente* di $C_1$ e
$C_2$ e' la clausola $C$:
$$
Res(C_1, C_2) (C_1 - \{l\}) \cup (C_2 - \{l^C\})  
$$
le clausole $C_1$ e $C_2$ sono dette *genitori* di $C$.

**Lemma 4.16**: Se due clausole hanno un conflitto in piu' di un letterale, il
loro risolvente e' una clausola triviale

**Teorema 4.17**: Il risolvente $C$ e' soddisfacibile se e solo se le clausole
*genitrici* $C_1$ e $C_2$ sono entrambi soddisfacibili


