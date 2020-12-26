% Introduzione al corso di metodi numerici

# Introduzione al corso di metodi numerici

**Analisi Numerica**: Riguarda lo sviluppo e l'analisi di algoritmi per risolvere problemi dove vengono coinvolte variabili reali o complesse.   
Le variabili reali o complesse coinvolte sono dati affetti da errori (e quindi delle approssimazioni dei dati reali), i quali possono essere categorizzati in due categorie: 

* **Errori sperimentali**: derivanti dagli strumenti di misurazione e da fattori riguardanti le circostanze in cui sista misurando la grandezza 
* **Errori di arrotondamento**: derivanti da rappresentazioni di numeri infiniti in numeri finiti (es. quando si rappresenta un numero reale in un calcolatore, si introduce implicitamente un errore, proprio per la natura finita della variabile in cui si vuole rappresentare il valore) 

Siccome la natura di certi errori e' ineliminabile, l'algoritmo risultante sara' un'approssimazione del modello.  
Si puo' quindi parlare di:  

* **Algoritmo finito**: quando l'algoritmo termina in una serie di passaggi finita (risultato = numero finito).
* **Algoritmo infinito**: quando l'algoritmo approssima alla soluzione man mano che crescono le iterazioni ma non finisce (risultato = limite di una successione).   

Nei casi in cui l'algoritmo sia finito e' possibile studiare la propagazione degli errori che sono stati introdotti (errori sperimentali e di arrotondamento) nell'approssimazione del modello 
Lo studio in casi di algoritmi infiniti riguarda gli errori di troncamento (cioe' troncamento di una soluzione infinita) e gli errori di discretizzazione (dovuti al passaggio da un modello infinito a un modello discreto). 

## Buona posizione e condizionamento 

**Modello Matematico**: Complesso di formule che descrivono un comportamento.  

**Modello Numerico**: Modello matematico in cui sono state introdotte delle semplificazioni approssimazioni. 
