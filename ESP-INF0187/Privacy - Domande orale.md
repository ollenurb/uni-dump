# Privacy - Domande Orale

## Pensa

### Data Regulation Laws
* Privacy by default e by design
* Novità introdotte dal GDPR (pseudononimizzazione, e differenza con l'anonimizzazione),
* Ruoli definiti dal GDPR (titolare del trattamento dei dati, responsabile, data subject)
* Responsibility and Accountability 
* Come bisogna agire in caso di Data Breach
* Trasferimento dati oltre UE - regole tra UE e USA

### Privacy in PDP
* RBAC e ABAC
* Metodi di controllo degli accessi (RBAC e ABAC, XACML, nel caso di due policy che vanno in conflitto, ABAC prevede dei sistemi per risolvere il conflitto?)
* Perché un controllo degli accessi basato sugli attributi è migliore di quello basato sui ruoli
* Esempi di attributi utili ad identificare il contesto per una richiesta di accesso
* Come vengono realizzate le politiche ABAC
* Auditing (obiettivo, principio del GDPR garantito dall'auditing)

### K-Anonimity
* Definizione di K-Anonimity,
* Contesto e Definizione di K-Anonimity, i suoi limiti e un algoritmo a scelta
* Immaginiamo un dataset con informazioni mediche con il pagamento di ticket
  sanitari ed esenzioni ecc. Immaginiamo di voler decidere un valore di k, che
  ragionamento farebbe?
* Quali sono i parametri che prenderebbe in considerazione per la scelta del k
  nella K-Anonimity
* Problemi principali della K-Anonimity (complessità e il fatto che non sempre
  sia possibile distinguere attributi QI da sensibili),
* Linking attack perché lo abbiamo introdotto? Esempi di linking attack che
  abbiamo introdotto? Attraverso quale tipo di attributi avviene?
* Definizione di quasi identifier (QI) ed esempi possibili
* K anonimity abbiamo visto 4 algoritmi fare un discorso sintetico di come
  evolvono gli algoritmi che abbiamo visto, quali aspetti vengono migliorati?
* Come esplorano il reticolo gli algoritmi di Samarati e Incognito
* Secondo lei cosa influisce di più nella complessità del calcolo degli
  algoritmi di K-Anonimizzazione?
* Algoritmo di Mondrian e TopDown
* Come risolve TopDown i problemi di Mondrian?

### Beyond K-Anonimity
* Pur migliorando l’algoritmo di K-Anonimity con tutti gli strumenti che abbiamo
  visto, quali sono i limiti che rimangono in tutti questi tipi di approcci?
* Limiti algoritmi su K-Anonimity (omogeneità)
* L-diversity (attacchi e problemi su l-diversity)
* L-diversity e suoi limiti
* T-closness
* Delta-Presence
* Come fare per risolvere i problemi che sorgono con la t-closeness (usando la
  delta-presence)
* Definizione di delta-presence e del motivo per cui è necessario andare a
  impostare sia delta min che delta max

### Differential Privacy
* Differential privacy
* Differential privacy introduzione breve + quando è possibile usare il
  meccanismo esponenziale e quando invece è necessario farlo (Suppongo che
  quando hai query numeriche poi decidere se utilizzare Laplace o
  esponenziale(quindi possibile), quando hai altri tipi di query (es. Boolean o
  categoriche) sei obbligato ad usare il meccanismo esponenziale(quindi
  necessario). O magari anche quando il rumore di Laplace ti sporcherebbe così
  tanto la risposta da farti avere un utilità bassissima)
* Differential privacy (obiettivo e definizione, meccanismo randomizzato e
  sensitività, meccanismo di Laplace e limiti, sensitività globale e problemi,
  sensitività locale)
* Definizione di Differential Privacy e l'esempio del meccanismo con la monetina
* Meccanismo di Laplace come viene applicato e su quali basi si fonda
* Il meccanismo di Laplace non si può applicare quando la query da un risultato
  non numerico, le viene in mente una situazione in cui il meccanismo di Laplace
  restituisce un risultato che non ha alcun senso nonostante il risultato sia
  numerico
* Meccanismo esponenziale
* Limitazioni della Differential Privacy
* Cosa non assicura la Differential Privacy?
* Differenza tra i due tipi di sensitività
* Sensitività globale: quando è poco utile?
* Local Sensitivity
* Le viene in mente un caso in cui ha molto più senso una sensitività locale
  rispetto ad una globale? (l'esempio della mediana)


### Privacy in Distributed Systems/Environments
* Privacy preserving Data Mining (Principali tecniche, collegamento data
  obfuscation - differential privacy)
* Algoritmi di privacy preserving data mining: Alberi Decisionali approcci per
  la privacy
* Come funziona ID3-delta

### Orale del 11 dicembre 2020

#### Studente 1 - voto 28

1. K-anonimity, cos'è, da cosa ci protegge, definizione formale
2. Secondo lei qual è una probabilità accettabile di successo di un linking
   attack (confidenza minore di 1/k). "No, apetti intendevo, nel senso, qual è
   secondo lei un k accettabile, con che procedimento sceglierebbe un k
   accettabile?".
3. Mi parli dell'algoritmo Incognito
4. Differential Privacy - Quali sono le motivazioni dietro all'introduzione del
   meccanismo esponeziale.
5. Cosa farebbe lei nel progettare un algoritmo che rispetti il meccanismo
   esponenziale? (lode?)
6. Quando siamo obbligati a usare un meccanismo alternativo a Laplace? (lo
   studente non è stato chiaro su questo punto)
7. Metodi di controllo degli accessi, differenze tra RBAC e ABAC, e in quale
   caso utilizzerebbe i due sistemi?

#### Studente 2 - voto 27

1. Secondo lei, qual è la soglia k accettabile per la K-anonimity? il suo
   collega è stato un po' impreciso, come sceglierebeb k? Che ragionamento
   farebbe? (scelta basata sulla variabilità del dominio, numero di attributi
   dei record, attributi QI simili, dimensione del dataset)
2. Il suo collega ha parlato di incognito. Ora, c'è una differenza sostaziale
   tra Samarati ed Incognito, qual'è? (fa fatica a rispondere, Pensa lo aiuta
   con le seguenti domande)
    - che cos'è un QI?
    - Risposta: a Samarati bisogna passargli i QI dall'esterno (o comunque
      costruire/passargli il reticolo). Ingcognito fa tutto da solo data una
      tabella.
3. Differential Privacy: definizione (intuitiva e formale). Affinché il
   meccanismo (qualsiasi) rispetti la DP, il valore di epsilon quale deve
   essere? Nel senso, che valore deve assumere epsilon per garantire la DP?
   (valori molto piccoli) (lo studente ha sbagliato la domanda, ma pensa l'ha
   corretto facendolo ragionare, in modo molto tranquillo)
4. Meccanismo di Laplace (lo studente ha completamente imbroccato la domanda
   dando una definizione diversa ed essendo convinto dell'accuratezza della sua
   risposta, Pensa l'ha corretto)
5. Nel meccanismo di Laplace oltre alla sensitività c'è un altro parametro, mi
   dice qualcosa su di lui? (epsilon)

#### Studente 3 - voto 30

1. K-anonimity, come si superano i limiti dell'homogeny attack e della conoscenza di background? (discorso su l-diversity)
2. Dati i criteri elencati dal collega precedente, come li andrebbe ad usare nell'applicare la k-anonimity? Che ragionamento/analisi applicherebbe? (**analisi del rischio!!** Non l'abbiamo trattato a lezione, ma ti fa ragionare per arrivarci!)
3. DP - la DP gode alcune proprietà utili per progettare un sistema differenzialmente privato, quali sono? (teorema di combinazione delle tecniche di DP)
4. C'è un caso di meccanismo che abbiamo dimostrato la cui dimostrazione è molto semplice, mi sa dire qual'è (meccanismo della monetina)
5. Parlando di DP - il numero di monetine da lanciare a cosa lo associa? C'è un meccanismo più accurato? Le monetine che cosa sono nell'ambito della DP? (simplesso di probabilità)
6. Auditing nel DB, a cosa servono e quale aspetto del GDPR vanno a coprire?

#### Studente 4 - voto 29

1. Delta-presence
2. La delta presence ha un affinità con la DP, in termini di presenza-assenza
   individui nel datset. Mi dica in cosa sono dverse queste due fedinizioni di
   privacy, sia dal punto di vista applicativo che dal punto di vista teorico.
   (DP applicata alla query, Delta-presence a una tabella)
3. DP - Global vs Local Sensitivity
4. Esempio della mediana, le viene in mente qualche esempio pratico in cui ha
   più senso utilizzare la sensitivià locale rispetto alla globale.
5. Metodi per il calcolo della sensitività locale, SOLO NOMI. (PTR, PBLS, Smooth
   Sensitivity)
6. GDPR: mi parli della privacy by design. Mi dice anche i 7 principi cardine su
   cui si basa la Privacy by Design.

#### Studente 5 - voto 30 e lode

1. Privacy Preserving Data Mining, cos'è e quali approcci abbiamo visto (definizione del problema, 3 approcci, metodo di bootstrap)
2. Mi parla di ID3-delta?
3. Pseudonimizzazione nel GDPR
4. Secondo lei come si potrebbe migliorare il GDPR? (domanda molto larga, senza una risposta precisa).

### Orale del 9 giugno 2021

#### Studente 1

1. Privacy by design e privacy by default
2. Introduzione generale al GDPR
3. Linking attack, definizione di "quasi-identifier"
4. K-anonymity
5. Algoritmo di Samarati
6. Discorso generale sul reticolo di generalizzazione utilizzato dall'algoritmo Samarati

#### Studente 2

1. Responsibility & accountability
2. Algoritmo di Mondrian (vuole che gli si parli della discerneability metric, non di NCP!)
3. Limiti degli algoritmi di K-anonymity
4. L-diversity
5. Proprietà che viene sfruttata dagli algoritmi di k-anonymity per implementare la k-diversity

#### Studente 3

1. Pseudonimizzazione, implicazioni con il GDPR
2. A che tipo di dato si applica il GDPR?
3. Algoritmo TopDown
4. Entropy L-diversity
5. Monotonicità L-diversity

#### Studente 4

1. Evoluzione del concetto di privacy nel tempo
2. Problemi della l-diversity
3. T-closeness, Earth Mover Distance
4. Applicabilità degli algoritmi k-anonimi
5. Come scegliere un buon k
6. Definizione generale della differential privacy

#### Studente 5

1. Machine learning e privacy, implicazioni ed uso nel GDPR
2. Secure multiparty computation --> ID3
3. Sensitivity

## Note

Per rispetto verso i miei colleghi ho omesso voti e considerazioni personali nell'ultimo appello, ma confermo la bravura del professor
Pensa a mettere a suo agio gli studenti come già menzionato, buono studio a tutti!
