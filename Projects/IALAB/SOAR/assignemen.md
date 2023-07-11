# Intelligenza Artificiale e Laboratorio (UNITO) - AA 2022-23

## SOAR - Assignment (Lieto)

Si richiede di implementare un agente intelligente sviluppato tramite l'architettura cognitiva SOAR in grado di risolvere il seguente problema (per comodità nominato *ESCAPE*) tramite apprendimento per rinforzo (**reinforcement learning**).

L'agente SOAR è prigioniero in un ambiente dove l'unica via d'uscita è una finestra in vetro posta a $3.5$ metri di altezza (l'agente è un robot di altezza $150$ cm). La finestra in vetro è blindata ma ha un punto debole alle estremità. Questo vuol dire che, se colpita con precisione alle estremità, il vetro si può frantumare. Tuttavia l'agente all'inizio della sua esecuzione non lo sa e deve apprendere questa conoscenza.

L'agente ha a disposizione i seguenti oggetti che potrebbero tornargli utili per realizzare il suo obiettivo: una molla, una rametto in legno, ciottoli e pietre. Due tronchi d'albero dello stesso diametro da $1$ metro di altezza ciascuno. L'agente può decidere di creare nuovi oggetti a partire da quelli che ha a disposizione ma parte da una tabula rasa (non sa quale combinazione va bene). Nel corso dei suoi tentativi di interazione imparerà i seguenti rinforzi: (Molla $+$ Rametto di legno) $= +1$ (Pietre $+$ Rametto di legno) $= -1$ (Pietre $+$ Molla) $= -1$. Altre possibili rinforzi frutto della vostra fantasia possono essere inseriti nel programma.
