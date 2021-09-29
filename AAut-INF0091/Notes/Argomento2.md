# Oltre la classificazione binaria
* Come gia' accennato, la classificazione multi classe e' un problema di
  classificazione che considera piu' di due classi
* Cosi' come la classificazione, anche gli altri task di scoring, ranking e
  probability estimation possono essere estesi a questa generalizzazione del
  problema

## Estendere la classificazione binaria a multiclasse
* Esistono diversi metodi per combinare diversi calssificatori binari in un
  singolo ***k***-class classifier:
    * *One-versus-rest (unordered)*: viene fatto il training su $k$
      classificatori binari in cui il primo separa la prima classe $C_1$ da
      $C_2, \dots, C_k$, il secondo separa la seconda classe da $C_1, C_3,
      \dots, C_k$ e cosi' via fino alla classe $C_k$. Nella fase di training
      dell'*i-esimo* classificatore, tutte le istanze della classe $C_i$ vengono
      trattate come istanze positive, mentre tutte le altre come negative.
    * *One-versus-rest (fixed order)*: viene fatto il traning su $k-1$
      classificatori binari in base all'ordine di tests stabilito dove il
      classificatore $\hat{c}_i(x)$ separa $C_i$ da $C_{i+1}, \dots, C_n$
    * *One-versus-one (Simmetrico)*: il training viene fatto su $k(k-1)/2$
      classificatori binari, uno per ogni ***coppia di classi*** possibile.
    * *One-versus-one (Asimmetrico)*: il training viene fatto su $k(k-1)$
      classi, uno per ogni ***coppia di classi*** in cui *conta l'ordine*. Non
      molto utilizzata, utilizza piu' classificatori senza un miglioramento
      significativo nelle performances rispetto alla controparte simmetrica
* ***Output code matrix***: E' una matrice in cui la colonna $i$ indica il
  classificatore binario *i-esimo*, mentre le righe indicano le classi $C_i$. E'
  uguale a +1 quando le istanze della classe $C_i$ sono considerate positive dal
  classificatore $\hat{c}_i$. -1 negative, 0 non sono considerate.
* Per classificare gi esempi, si costruisce un vettore $w(x) = (\hat{c}_1(x),
  \dots, \hat{c}_n(x))$, contenente l'output degli $n$ classificatori binari
  sull'istanza $x$
* Nei casi in cui $d_i = d_j$ per un qualsiasi $i, j$, si puo' utilizzare uno
  *scoring classifier* al posto di un classificatore, prendendo come buona la
  scelta con score massimo. In questo caso la possibilita' che si verifichi la
  situazione descritta sarebbe drasticamente ridotta.
* Per decodificare il vettore $w$ in una classe, il classificatore calcola la
  distanza tra $w$ e $c_j$ (dove $c_{j}$ e' la *j-esima* riga dell'output code
  matrix), calcolando per ogni riga $d(w, c) = \sum_i(1-w_i c_i)/2$.
  Infine, ritorna la classe corrispondente a quella con la distanza minima
  (in altri termini, ritorna $argmin_j d(w, c_j)$).
  Il processo di utilizzare la matrice come lookup table e' detto *decoding
  process*.
* Nello schema *one-vs-rest* il singolo classificatore vede dei datasets
  molto sbilanciati, per cui avendo pochi esempi positivi il classificatore
  avra' piu' difficolta' a trovare la correlazione tra i dati nella fase di
  apprendimento

## Regressione
* Un ***function estimator*** anche chiamato ***regressore*** e' una mappa
  $\hat{f}(x): \mathscr{X} \rightarrow \mathbb{R}$. (Si noti che a differenza di
  cio' che e' stato visto fin'ora, il numero delle classi non e' piu' finito)
* Il task della regressione e' quello di imparare da una serie di esempi
  (*punti*) del tipo $(x_i, f(x_i))$ il valore dell'approssimazione reale di $f$
* Per ottenere un regressore che approssimi meglio l'andamento dei dati, si
  possono utilizzare:
    * ***Polinomi interpolanti di grado $n$***: hanno $n+1$ parametri (il valore di
      $n$ incognite + il valore di una costante) e sono sempre in grado di
      interpolare $n+1$ punti
    * ***Funzioni a tratti***: un modello costituito da $n$ funzioni ha tratti
      ha complessivamente $2n-1$ parametri ed e' sempre in grado di interpolare
      $n$ punti
  Per evitare l'overfitting, il numero di parametri stimati dai dati deve essere
  considerevolmente piu' piccolo del numero di datapoints.
* Diversamente dai problemi di classificazione, la **loss function** non e'
  applicata al ***margine*** ma ai ***residui*** $f(x) - \hat{f}(x)$.
  Tipicamente, una loss function e' simmetrica rispetto all'asse $x$ (dal
  momento che vorremmo minimizzare il discostamento in termini di valore
  assoluto).
* Tipicamente la scelta di una loss function ricade sullo scarto quadratico dal
  momento che non si vuole che gli scarti negativi e positivi molto simili si
  cancellino tra di loro. Il problema e' che bisogna fare attenzione nei casi in
  cui ci siano outliers molto grandi dal momento che la funzione e' molto
  sensibile in questi casi
* ***Bias variance dilemma***: Un modello a bassa complessita' soffre meno delle
  variazioni random nei dati, ma potrebbe introdurre un bias sistematico che non
  puo' essere risolto nemmeno con grandi quantita' di dati. Questo perche' una
  precisione migliore puo' essere raggiunta solamente mediante l'aggiunta di
  piu' parametri. D'altra parte, un modello ad alta complessita', eliminerebbe
  tale bias a costo di introdurre piu' errori non sistematici dovuti all'elevata
  varianza introdotta. Questo puo' essere visto formalmente dal momento che
  vale la relazione
  $$
  \mathbb{E}[(f(x) - \hat{f}(x))^2] =
  \underbrace{(f(x) - \mathbb{E}[\hat{f}(x)])^2}_{Bias^2} +
  \underbrace{\mathbb{E}[(\hat{f}(x) - \mathbb{E}[\hat{f}(x)])^2]}_{Varianza}
  $$
* **Varianza**: Errore dovuto al fatto che il modello si e' conformato troppo ai
  dati del test set, modellando anche le conseguenti fluttuazioni random dei
  suoi dati (*overfitting*)
* **Bias**: Errore dovuto al fatto che il modello, avendo pochi parametri, non
  riesce ad esprimere bene la correlazione tra i dati (*underfitting*)

## Predictive vs Descriptive learning
* Descriptive learning e' il task che concerne l'apprendimento di un modello che
  *descriva* i dati.
* In questo senso, l'ouput del processo di apprendimento e del problema di
  apprendimento sono lo stesso: il modello stesso. (ad esempio, prima l'ouput
  del problema di apprendimento era una label, score, probabilita' ecc..)

### Clustering
* ***Predictive clustering***: Apprendere una funzione di labelling $l$ da dati
  **non etichettati**. Cosi' come un classificatore, anche un cluster e' una
  mappa $\hat{q}(x): \mathscr{X} \rightarrow \mathscr{L}$

