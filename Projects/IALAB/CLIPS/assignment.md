# Intelligenza Artificiale e Laboratorio - AA

Progetto di Intelligenza Artificiale e Laboratorio
Modulo: Planning e Sistemi a Regole

Colpito e affondato…?


L’obiettivo del progetto è quello di sviluppare un sistema esperto che giochi ad una versione
semplificata della famigerata Battaglia Navale.
Il gioco è nella versione “in-solitario”, per cui c’è un solo giocatore (il vostro sistema esperto) che
deve indovinare la posizione di una flotta di navi distribuite su una griglia 10x10.
Come di consueto le navi da individuare sono le seguenti:
- 1 corazzata da 4 caselle
- 2 incrociatori da 3 caselle ciascuno
- 3 cacciatorpedinieri da 2 caselle ciascuno
- 4 sottomarini da 1 casella ciascuno
Le navi saranno, ovviamente, posizionate in verticale o in orizzontale e deve esserci almeno una
cella libera (cioè con dell’acqua) tra due navi.
Per rendere più semplice il problema, il contenuto di alcune celle sarà noto fin dall’inizio. Inoltre, in
corrispondenza di ciascuna riga e colonna sarà indicato il numero di celle che contengono navi.
Ad esempio, la seguente situazione rappresenta un possibile stato iniziale del problema.
