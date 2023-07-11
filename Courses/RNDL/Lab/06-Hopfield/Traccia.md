# Laboratorio - Reti di Hopfield

### Domande
1. Eseguire la demo almeno 1 volta provando vari livelli di corruzione dei
   pattern
2. L’output è sempre quello atteso ? Perché?
3. Commentare le varie fasi della demo.
4. Cosa c’è in `hop_data`?
5. Qual è la dimensione della rete?
6. Dove sono memorizzati i pesi della rete?
7. Quale formato hanno gli input e gli output?
8. Cosa fa `hop_flip`?
9. Dove avviene la fase di storage e come è implementata?
10. Dove avviene la fase di withdrawal e come è implementata?
11. Quante volte al massimo è eseguito l’update dell’attivazione di un neurone?
    E’ corretto porre un limite?
12. In `hop_test` cosa sono le variabili nv e ch?

### Risposte
1. _
2. No. Dipende ovviamente dal livello di confusione che scegliamo. Questo
   perche' se lo stato iniziale e' troppo diverso da quello che ci attendiamo,
   e' molto piu' probabile che la rete ricada in uno stato stabile differente.
3. La demo e' divisa in diverse fasi:
    * Carica i dati delle memorie fondamentali da `hop_data` (una matrice che
      contiene nelle righe le memorie fondamentali)
    * Visualizza i dati delle memorie fondamentali all'utente
    * Salva le memorie fondamentali di `hop_data` nella rete calcolandone i pesi
      con `hop_stor`
    * Richiedi all'utente quale delle memorie corrompere e di quanto (in
      percentuale)
    * Itera applicando la regola di update del neurone fino a quando non si
      arriva ad uno stato stabile della rete
4. Come detto, c'e' la matrice che contiene le memmorie fondamentali nelle righe
5. $12 \times 10 = 120$
6. Nella variabile `W`
7. In input c'e' una matrice $8 x 120$ di memorie fondamentali, mentre in output
   c'e' una matrice $12 \times 10$
8. Per ogni elemento della diagonale principale del pattern, ne scambia il
   numero con il suo opposto con probabilita' data dall'utente (`seed`)
9. Avviene in `hop_stor`
    * Dato un pattern, inizialmente crea una matrice di 0 con dimensione pari a
      $n \times n$, dove $n$ e' la grandezza del pattern (120)
    * Con un ciclo va a iterare tutte le coppie possibili di neuroni, applicando
      la regola di update vista a lezione.
10. Avviene in `hop_test`
    * Quello che fa e' essenzialmente applicare la regola di update in modo
      casuale
11. $1000$ volte. In realta' e' sicuro che convergera', ma non sappiamo in
    quante iterazioni, per cui da una parte e' giusto che ci sia per avere un
    upper bound massimo sul tempo di esecuzione
12. `nv` e' un vettore che indica se e' cambiato lo stato rispetto a quello
    precedente, mentre `ch` e' un vettore che contiene il valore atteso dei
    neuroni se si applicasse la regola di update
