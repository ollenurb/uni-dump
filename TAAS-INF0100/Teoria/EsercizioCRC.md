% Esercizio CRC cards Cinema - TAAS

**Testo dell'esercizio**:  
Il sistema di \underline{prenotazioni} per i \underline{cinema} dovrebbe
memorizzare le prenotazioni dei \underline{posti a sedere} per più
\underline{sale}. Ogni cinema ha i posti disposti a \underline{file}. I
\underline{clienti} possono prenotare posti a sedere e viene loro comunicato il
numero di fila e il numero di posto. È possibile chiedere la prenotazione di più
posti adiacenti. Ogni prenotazione riguarda un determinato
\underline{spettacolo}. Gli spettacoli hanno date e orari assegnati e hanno
luogo in una sala precisa. Il sistema memorizza il numero di telefono del
cliente.


* `Prenotazione`
    * Responsabilita': Contenere le informazioni relative al posto (e fila) e
      allo spettacolo a cui si riferisce. Infine, contiene anche il cliente che
      ha richiesto la prenotazione.
    * Collaborazione: Spettacolo, Cliente, Posto
* `Cinema`
    * Responsabilita': Contenere i dati relativi alla posizione geografica
      (indirizzo) e informazioni relative alle sale (quali sale, quanti posti)
    * Collaborazione: Sala
* `Posto`
    * Responsabilita': Racchiude i dati di un posto all'interno di una sala,
      identificato mediante numero posto e numero fila. 
    * Collaborazione: Spettacolo, Sala
* `Cliente`:
    * Responsabilita': Contiene le informazioni relative al [cliente](cliente)
    * Collaborazione
* `Spettacolo`:
