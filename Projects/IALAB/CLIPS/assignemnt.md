# Intelligenza Artificiale e Laboratorio (UNITO) - AA 2022-23

## Clips - Assignment (Micalizio)

L'obiettivo del progetto è quello di sviluppare un sistema esperto che giochi ad una versione semplificata della famigerata Battaglia Navale. Il gioco è nella versione *in-solitario*, per cui c'è un solo giocatore (il vostro sistema esperto) che deve indovinare la posizione di una flotta di navi distribuite su una griglia $10 \times 10$. Come di consueto le navi da individuare sono le seguenti:

- $1$ corazzata da $4$ caselle
- $2$ incrociatori da $3$ caselle ciascuno
- $3$ cacciatorpedinieri da $2$ caselle ciascuno
- $4$ sottomarini da $1$ casella ciascuno

Le navi saranno, ovviamente, posizionate in verticale o in orizzontale e deve esserci almeno una cella libera (cioè con dell'acqua) tra due navi. Per rendere più semplice il problema, il contenuto di alcune celle sarà noto fin dall'inizio. Inoltre, in corrispondenza di ciascuna riga e colonna sarà indicato il numero di celle che contengono navi. Ad esempio, la seguente situazione rappresenta un possibile stato iniziale del problema.

Sapete quindi che in posizione $[7, 1]$ c'è dell'acqua, in posizione $[6, 5]$ c'è un sottomarino, in posizione $[5, 10]$ c'è un pezzo di nave che probabilmente continuerà nelle celle subito sopra e subito sotto. Sapete inoltre, che nella prima riga due celle sono occupate da una nave, mentre nella prima colonna sono $5$, ecc.

Il vostro sistema esperto avrà quattro possibili azioni:

- `fire x y`
- `guess x y`
- `unguess x y`
- `solve`

L'azione `fire` è l'equivalente di un'azione percettiva e vi permette di vedere il contenuto della cella $[x, y]$.

L'azione `guess` serve per indicare che il vostro sistema esperto ritiene ci sia una nave in posizione $[x, y]$. Questa azione è da considerarsi un'ipotesi, per cui è ritrattabile in un momento successivo, cioè il vostro sistema esperto potrebbe tornare sui suoi passi con il comando `unguess`.

Il comando solve è da usarsi solo quando il vostro sistema esperto ritiene di aver risolto il gioco, l'azione termina il gioco attivando il calcolo del punteggio secondo la seguente formula:

$(15∗gok +20∗sink)−(10 gko+10∗safe+20∗nf +20∗ng)$

dove:

- $gok$ è il numero di celle guessed corrette
- $sink$ è il numero di navi totalemente affondate
- $gko$ è il numero di celle guessed errate
- $safe$ è il numero di celle che contengono una porzione di nave e che sono rimaste inviolate (né guessed né fired)
- $nf$ è il numero di fire non usate
- $ng$ è il numero di guess non usate

Per rendere le cose un po' più interessanti, avete solamente 5 fire a disposizione. Inoltre, in un dato momento non possono esserci più di venti caselle marcate *guessed*. Lo scopo del gioco è quindi marcare tutte le caselle che contengono una nave come guessed, o eventualmente averle colpite con fire.

### Riassumendo

L'obiettivo del gioco è di annotare come *guessed* le venti caselle sotto cui si trovano le navi. Notate che dove marcare come guessed anche una cella che avete osservato con una fire e in cui avete trovato una porzione di nave. Solo in questo modo il punteggio sarà calcolato correttamente.

Dovete implementare almeno due varianti di giocatore che seguano due strategie diverse da mettere poi a confronto.
