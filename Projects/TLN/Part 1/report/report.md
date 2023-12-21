---
title: "Esercitazione di Tecnologie del Linguaggio Naturale - Parte Prima (prof. Mazzei)"
author:
    - Brunello Matteo (mat. 858867)
    - Caresio Lorenzo (mat. 836021)
date: "Settembre 2023"
papersize: a4paper
geometry: "left=3cm,right=3cm,top=3cm,bottom=3cm"
output: pdf_document
header-includes:
    - \usepackage{setspace}
    - \usepackage{svg}
    - \usepackage{float}
    - \usepackage{caption}
    - \usepackage{subcaption}
---

## 1A. Algoritmo CKY {#1a-algoritmo-cky}

### Strutture dati e rappresentazione

Per l'implementazione dell'algoritmo abbiamo in primo luogo definito la tipologia di struttura dati sulla quale CKY dovrà operare. Nello specifico, abbiamo definito la tipologia di cella della
matrice (triangolare) che utilizzerà CKY: il contenuto di ogni cella deve permettere di tener traccia delle varie regole considerate dall'algoritmo.

Ciò è fondamentale poiché ci permetterà in seguito di fare backtracking
e ottenere così le realizzazioni dei vari alberi di parsificazione. Per
questa ragione abbiamo definito ogni cella della matrice come una lista
di `Entry`. Il tipo `Entry` è un [tipo
somma](https://en.wikipedia.org/wiki/Tagged_union) che può essere
`Terminal` oppure `NonTerminal`. Il primo rappresenta una regola che ha
come conseguente un terminale, mentre il secondo rappresenta una regola
con due non-terminali come conseguente (queste sono infatti le uniche
due tipologie di regole ammesse in una grammatica in *Chomsky Normal Form*, prerequisito di CKY).
Questi due non-terminali sono dei puntatori associati a loro volta ad
altre `Entry` presenti all\'interno della matrice. Come si vedrà in
seguito, queste associazioni verranno poi costruite durante
l\'esecuzione dell\'algoritmo.

### Implementazione

Dopo aver definito la tipologia di struttura dati, è utile inoltre
introdurre alcune funzioni di supporto che implementano alcune
operazioni ad alto livello che compaiono nella definizione
dell\'algoritmo. Più nel dettaglio, definiamo due funzioni
rispettivamente per:

1.  Trovare nella grammatica tutte le regole consistenti con il
    terminale dato (`find_consistent_terminal`)
2.  Trovare nella grammatica tutte le regole consistenti con due non-terminali dati (`find_consistent_nonterminal`)

\small

``` python
def find_consistent_terminal(grammar: nltk.grammar.CFG, terminal: str):
  return map(lambda x: Terminal(x.lhs(), terminal), grammar.productions(rhs = terminal))

def find_consistent_nonterminal(grammar: nltk.grammar.CFG, b: NonTerminal, c: NonTerminal):
  result = list()

  for production in grammar.productions():
    if(len(production.rhs()) == 2):
      (b_i, c_i) = production.rhs()
      # Check for all possible entries in both sets
      for entry_b in b:
        for entry_c in c:
          if b_i == entry_b.get_value() and c_i == entry_c.get_value():
            result.append(NonTerminal(production.lhs(), entry_b, entry_c))

  return result
```
\normalsize

L\'implementazione dell\'algoritmo diventa a questo punto molto
semplice, poiché segue direttamente dalla definizione in pseudocodice
data dal libro. Si noti che nell\'implementazione seguente gli indici
sono stati rivisti poiché nello pseudocodice la lista delle parole
inizia con l\'indice $1$, mentre in Python con l\'inidice $0$.

\small

``` python
def cky_parse(words: List[str], grammar: nltk.grammar.CFG) -> List[List[Entry]]:

  table = [[[] for i in range(len(words))] for j in range(len(words))]

  for j in range(0, len(words)):
    table[j][j].extend(find_consistent_terminal(grammar, words[j]))
    for i in range(j, -1, -1):
      for k in range(i, j):
        table[i][j] += find_consistent_nonterminal(grammar, table[i][k], table[k+1][j])

  return table
```

\normalsize

Per definizione, l\'algoritmo ritorna una tabella che rappresenta tutte
le possibili derivazioni degli alberi di parsificazione. Si avranno
tanti alberi tante quante saranno le produzioni con antecedente $S$
(*start symbol*) presenti nella cella alla posizione
$[0,\: len(words)]$. Naturalmente, se tale produzione non compare in
quella posizione, la grammatica non copre la frase. Possiamo sfruttare
questo fatto per verificare se una frase sia coperta o meno dalla
grammatica.

\small

``` python
def is_covered(words, grammar):
  table = cky_parse(words, grammar)
  for entry in table[0][len(words) - 1]:
    if entry.is_start():
      return True
  return False
```
\normalsize

## 1B. Grammatica L1 {#1b-grammatica-l1}

Riportiamo di seguito la grammatica L1 come fornita dal Jurafsky & Martin (J&M). Nella nostra implementazione abbiamo deciso di sfruttare la classe `CFG` del modulo `nltk.grammar`, così da poter sfruttare una rappresentazione comune e ben testata. Per il funzionamento dell'algoritmo CKY è necessario che la grammatica sia in CNF, e così viene riportata di seguito:

- $\textrm{S} \to \textrm{NP VP}$
- $\textrm{S} \to \textrm{X1 VP}$
- $\textrm{X1} \to \textrm{Aux NP}$
- $\textrm{S} \to book \mid include \mid prefer$
- $\textrm{S} \to \textrm{Verb NP}$
- $\textrm{S} \to \textrm{X2 PP}$
- $\textrm{S} \to \textrm{Verb PP}$
- $\textrm{S} \to \textrm{VP PP}$
- $\textrm{NP} \to I \mid she \mid me$
- $\textrm{NP} \to TWA | Houston$
- $\textrm{NP} \to \textrm{Det Nominal}$
- $\textrm{Nominal} \to book \mid flight \mid meal \mid money \mid morning$
- $\textrm{Nominal} \to \textrm{Nominal Noun}$
- $\textrm{Nominal} \to \textrm{Nominal PP}$
- $\textrm{VP} \to book \mid include \mid prefer$
- $\textrm{VP} \to \textrm{Verb NP}$
- $\textrm{VP} \to \textrm{X2 PP}$
- $\textrm{X2} \to \textrm{Verb NP}$
- $\textrm{VP} \to \textrm{Verb PP}$
- $\textrm{VP} \to \textrm{VP PP}$
- $\textrm{PP} \to \textrm{Preposition NP}$
- $\textrm{Det} \to that \mid this \mid the \mid a$
- $\textrm{Noun} \to book \mid flight \mid meal \mid money \mid morning$
- $\textrm{Verb} \to book \mid include \mid prefer$
- $\textrm{Pronoun} \to I \mid She \mid Me$
- $\textrm{Aux} \to does$
- $\textrm{Preposition} \to from \mid to \mid on \mid near \mid through$

Per coprire tutte le frasi assegnate (si veda la sezione successiva) si
è dovuta espandere la grammatica fornita dal J&M, nello
specifico per la frase *does she prefer a morning flight*, dove la
costruzione *morning flight* non veniva coperta dalla grammatica
originale.

### Copertura

Una volta definito l'algoritmo di parsing e la grammatica è possibile verificare la copertura delle frasi date, qui riportate:

- *Does she prefer a morning flight*
- *Book the flight through Houston*
- *Book the flight through Houston to book*

Alle due fornite ne è stata aggiunta una terza, volutamente non coperta dalla grammatica definita sopra. È possibile verificare la copertura di queste frasi con la funzione da noi implementata `is_covered`, che ricordiamo si basa anch'essa sull'utilizzo di CKY.

\small
::: {.output .stream .stdout}
    [COVERED]: 	 "does she prefer a morning flight"

    [COVERED]: 	 "book the flight through Houston"

    [NOT COVERED]: 	 "book the flight through Houston to book"
:::

\normalsize

### Alberi di parsificazione

Precedentemente è stato discusso di come l\'algoritmo CKY ritorni in
forma tabellare tutti i possibili alberi di parsificazione. Grazie
all\'implementazione di `Entry` è possibile estrarre tutti gli alberi
validi seguendo il percorso dei vari *backpointers* con una visita in
profondità, partendo dai non-terminali $S$ presenti nella cella a
coordinate $[0,\: len(words)]$.

\small
``` python
def get_parsing_trees(words, grammar):

  parsing_trees = []
  table = cky_parse(words, grammar)

  for entry in table[0][len(words) - 1]:
    # Found an 'S' entry
    if entry.is_start():
      parsing_tree = []
      evaluation_stack = [entry]
      # Find the tree
      while evaluation_stack:
        current_node = evaluation_stack.pop(-1)
        match current_node:
          case NonTerminal(value = non_terminal, left = left_ptr, right = right_ptr):
            parsing_tree.append(current_node)
            evaluation_stack.append(left_ptr)
            evaluation_stack.append(right_ptr)
          case Terminal():
            parsing_tree.append(current_node)
      # Add the tree
      parsing_trees.append(parsing_tree)

  return parsing_trees
```
\normalsize

Di seguito gli alberi di parsificazione ottenuti per le due frasi date (essendo la terza frase non coperta dalla grammatica, non ha alberi di parsificazione corrispondenti).

\begin{figure}[H]
    \centering
    \def\svgwidth{6cm}
    \input{g1.pdf_tex}
\end{figure}

\begin{figure}[H]
    \centering
    \def\svgwidth{6cm}
    \input{g2.pdf_tex}
\end{figure}

\begin{figure}[H]
    \centering
    \def\svgwidth{6cm}
    \input{g3.pdf_tex}
\end{figure}

\begin{figure}[H]
    \centering
    \def\svgwidth{6cm}
    \input{g4.pdf_tex}
\end{figure}

Si noti come per frasi sintatticamente ambigue, gli alberi di
parsificazione sono molteplici.

## 1C. Grammatica Klingon {#1c-grammatica-klingon}

Proponiamo ora una grammatica per la lingua Klingon. La metodologia
seguita è stata quella di partire creando inizialmente le regole
terminali, per poi successivamente creare le regole di composizione
grammaticale secondo il Klingon Dictionary.

Per questa ragione, la grammatica ottenuta è molto ristretta, poiché
copre solamente le frasi fornite. Secondo una prima analisi, è stata
quindi ottenuta la seguente grammatica formale (non in CNF):

-   $S \to \textrm{VP NP}$
-   $S \to \textrm{VP Pronoun}$
-   $S \to \textrm{NP VP}$
-   $S \to \textrm{NP Pronoun}$
-   $VP \to \textrm{NP VP}$
-   $VP \to Dajatlh'a' \mid vIlegh \mid jIHtaH$
-   $NP \to \textrm{Noun}$
-   $NP \to \textrm{Noun} \: \textrm{Noun}$
-   $NP \to \textrm{Pronoun}$
-   $Noun \to pa'Daq \mid puq \mid tlhIngan \mid Hol$
-   $Pronoun \to jIH \mid maH$

Rispetto all\'Inglese, il Klingon è una lingua con *word-order* più
frequente oggetto-verbo-soggetto, da questo la presenza di regole di
riscrittura con VP come primo non-terminale (rispetto a quelle della
grammatica L1 Inglese, dove si ha una maggior frequenza di NP come primo
elemento).

Altro tratto caratteristico del Klingon è la mancanza del verbo *essere*
(cfr. Klingon Dictionary, §6.3), dove però i pronomi possono essere
usati come verbi. Così la frase *tlhIngan maH* (corrispondente
all\'Inglese *We are Klingon*) è composta semplicemente da un sostantivo
e da un pronome. Sempre da questo esempio è possibile notare un\'altra
caratteristica tipica del Klingon: la mancanza di aggettivi.

Siccome CKY necessita però della grammatica in CNF, la riporteremo in
questa forma seguendo la metodologia di trasformazione proposta dal
libro.

- $\textrm{S} \to \textrm{VP NP}$
- $\textrm{S} \to \textrm{VP Pronoun}$
- $\textrm{S} \to \textrm{NP VP1}$
- $\textrm{S} \to \textrm{NP Pronoun}$
- $\textrm{VP} \to \textrm{NP VP1}$
- $\textrm{NP} \to pa'Daq \mid puq \mid tlhIngan \mid Hol \mid jIH \mid maH$
- $\textrm{NP} \to \textrm{Noun Noun}$
- $\textrm{Noun} \to puq \mid tlhIngan \mid Hol$
- $\textrm{Pronoun} \to jIH \mid maH$
- $\textrm{VP1} \to Dajatlh'a' \mid vIlegh | jIHtaH$

Il terminale VP1 corrisponde ai verbi, si è scelta però questa
denominazione rispetto a quella di *Verb* o *V* in quanto i verbi
denotati da VP1 non sono semplici verbi ma contengono inoltre particelle
e suffissi tipiche del Klingon.

### Copertura

Di seguito le quattro frasi su cui si è basato lo sviluppo della grammatica visto sopra:

- *tlhIngan Hol Dajatlh'a'* (*Do you speak Klingon?*)
- *puq vIlegh jIH* (I see the child)
- *pa'Daq jIHtaH* (*I'm in the room*)
- *tlhIngan maH* (*We are Klingon!*)

Così come in precedenza, è possibile utilizzare la funzione `is_covered` da noi implementata per verificare la copertura su queste quattro frasi in Klingon.

\small
::: {.output .stream .stdout}
    [COVERED]: 	 "tlhIngan Hol Dajatlh'a'"

    [COVERED]: 	 "puq vIlegh jIH"

    [COVERED]: 	 "pa'Daq jIHtaH"

    [COVERED]: 	 "tlhIngan maH"
:::
\normalsize

### Alberi di parsificazione

Di seguito gli alberi di parsificazione ottenuti per le quattro frasi date.

\begin{figure}[H]
    \centering
    \begin{subfigure}[b]{0.3\textwidth}
    \def\svgwidth{3cm}
    \input{g5.pdf_tex}
    \end{subfigure}
    \begin{subfigure}[b]{0.3\textwidth}
    \def\svgwidth{3cm}
    \input{g6.pdf_tex}
    \end{subfigure}
    \begin{subfigure}[b]{0.3\textwidth}
    \def\svgwidth{3cm}
    \input{g7.pdf_tex}
    \end{subfigure}
\end{figure}

\begin{figure}[H]
    \centering
    \begin{subfigure}[b]{0.3\textwidth}
    \def\svgwidth{2.7cm}
    \input{g8.pdf_tex}
    \end{subfigure}
    \begin{subfigure}[b]{0.3\textwidth}
    \def\svgwidth{2.7cm}
    \input{g9.pdf_tex}
    \end{subfigure}
\end{figure}
