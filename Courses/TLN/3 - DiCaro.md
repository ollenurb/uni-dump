# 3 - Di Caro

## 1. Introduzione
* Semantica Computazionale (varie tipologie di semantica)
    * Lessicale;
    * Formale;
    * Statistica;
    * Linguistico-Distribuzionale.
* Origini del trattamento del linguaggio naturale (QA)

## 2. Significato del Significato
* Definizioni di base
    * Lessico; 
    * Sintassi;
    * Semantica;
    * Pragmatica;
    * Ambiguità;
    * Polisemia;
    * Omonimia.
* Teorie del significato delle parole (word meaning)
* Triangolo semiotico
* Multilinguismo
    * Opportunità;
    * Sfide.
* Granularità semantica e task associati
* Word Sense Disambiguation
    * Problematiche.
* Word Sense Induction
    * Valutazione (*pseudoword*).
* WSD vs WSI
* Ricerca onomasiologica

## 3. Costruzione del significato
* Pustejovsky (*Generative Lexicon*)
    * Strutture;
    * Qualia Roles;
* Hanks (*Valenze*)
    * Valenza, Slot e Semantic Types;
    * Problematiche;
* Affordance Linguistiche
    * Patterns Generativi.
        * Come rappresentano una concettualizzazione;
        * Vantaggi.

## 4. Text Mining
* Definizione
* Rappresentazione Vettoriale (VSM)
* Cosine Similarity
* Metodi Statistici
    * Frequenza;
    * TF-IDF;
    * Co-Occorrenza.
* Applicazioni
    * Tag Clouds;
    * Tag Flakes;
    * Document Clustering;
    * Document Classification;
    * Document Segmentation (topic modelling sequenziale e intra-documentale);
        * Algoritmo di Text Tiling.
    * Document Summarization;
        * Metodi Estrattivi;
        * Metodi Astrattivi;
        * Metriche di valutazione.
    * Information Retrieval.

## 5. Semantica Distribuzionale
* Perchè utilizzare matrici
    * Problemi delle matrici (*word order*, *composizional*)
* Tecniche e operazioni
    * Normalizzazione;
    * Denormalizzazione.
* Varie configurazioni matriciali (e tasks in cui sono utilizzate)
    * Term-Document;
    * Term-Context;
    * Co-occurrence (?);
    * Pair-Pattern.
* Perchè la similarità è importante
* Metriche di similarità
    * Semantic Similarity;
    * Semantic Relatedness/Attributional Similarity;
    * Taxonomical Similarity;
    * Relational Similarity;
    * Semantic Association.

## 6. Semantica Documentale
* Topic Modelling
    * Problematica.
* Latent Semantic Analysis
    * Matrici in output;
    * Concetti Latenti e cosa catturano;
    * Vantaggi (3);
    * Problemi (2).
* Text Visualization
    * Parallel Coordinates;
    * RadViz;
        * Problematica.
    * HeatMaps;
    * Correlation Circle.

## 7. Text2Everything
* Meccanismi di apprendimento per modelli
    * Apprendimento Supervisionato;
    * Apprendimento Semi-Supervisionato;
    * Apprendimento Debole-Supervisionato;
    * Apprendimento Auto-Supervisionato;
    * Apprendimento per Rinforzo.
* Pre-training e Fine-Tuning
    * Definizione;
    * Tipologie di pre-training.
        * Masked Language Modeling (MLM);
        * Denoising Autoencoder (DAE);
        * Replaced Token Detection (RTD);
        * Next Sentence Prediction (NSP);
        * Sentence Order Prediction (SOP).
* Pre-Trained Language Models;
    * Modelli Aperti e Chiusi.
* Reinforcement Learning from Human Feedback (RLHF);
    * Problematiche.
* Constitutional AI
    * Efficacia vs Innocuità.

## 8. Basicness
* Studio del vocabolario
* Roger Brown - *"How Shall a Thing be Called?"*
* Livello di Base e Livello Avanzato (varie definizioni date da vari ricercatori
  nell'ambito)
    * Ogden vs Brown;
    * Middle Level;
    * Soppravivenza Sociale.
* Domande di ricerca aperte
    * Legame termine-concetto (utilizzo di termini basic come advanced);
    * Soggettività.
* Perchè è importante 

## 9. Ontology Learning e Open Information Extraction
* Ontology Learning
    * Definizione;
    * Problematiche (2);
    * Sottospecificazioni;
        * Ontology Population;
        * Ontology Annotation;
        * Ontology Enrichment.
    * Tasks;
        * Term Extraction;
        * Synonym Extraction;
        * Concept Extraction;
            * Gloss Learning;
            * Lemmas Enumeration.
        * Concept Hierarchies Induction;
        * Relation Extraction;
        * Population;
            * NER;
            * IE.
        * Notazione di Sussunzione (?).
    * Metodi.
        * NLP (Parsing Trees, Statistics, Lexical Resources, ecc..)
        * Formal Concept Analysis (FCA);
        * Deep Learning Based.
* Open Information Extraction;
    * Definizione;
    * Vantaggio;
    * Problemi (3).

## 10. LLMs e Prompting
* LLMs *"Basici"* vs "Instructed"*;
* Cos'è il prompting;
* Principi chiave del prompting (4);
* Strategie di prompting (5);
    * Sequence Instruction;
    * Iterative;
    * Dialogue Based;
    * Step-Based (simile a iterativo);
    * Chain of Thought.
* LLMs Tasks;
    * Summarization;
        * Vantaggi (2).
    * Text Inference;
        * (es.) Sentiment Analysis;
        * (es.) Topic Extraction.
    * Text Transformation;
    * Text Expansion;
        * Temperatura;
    * Search/IR;
        * Time to train problem;
* Aspetti Pratici.
    * Istruzioni;
    * Avoid Negations;
    * Zero-Shot, Few-Shot, CoT.
        
## Soggettività nell'NLP
* Soggettività nella creazione di WordNet (WSD).
* Interpretazione del risultato del Topic Modelling.
* Criterio per stabilire se una risposta è etica o meno (Constitutional AI).
* Definizioni di Similarità.
* Definizioni di Basicness (un termine basic è soggettivo in base alla persona).
* Valutazione e metodi di estrazione delle triple in OIE.

## Definizioni
* **Basicness**: proprietà dei termini facili da imparare, da ricordare e che si
  riferiscono ad un concetto spesso comune a tutti gli altri esseri umani.
* **Genus-Differentia**: definizione *intensionale* composta da due parti:
    * *Genus*: parte della definizione già esistente condivisa da altre
      definizioni. Tutte le definzioni che ricadono nello stesso genus sono
      considerati membri di tale genus.
    * *Differentia*: componente che differenzia la definizione (e il concetto)
      dalle altri membri dello stesso genus.

## Laboratori

### 2. Content to Form 
* Si trasformano le definizioni in liste di sostantivi. 
* Si calcola i genera candidati. Esso essenzialmente è l'insieme dei primi $n$
  sostantivi che occorrono con più frequenza tra tutte le definizioni.
* Per ogni genus candidato, prima si ottengono i synset a cui corrispondono e si
  vanno a vedere tutti gli iponimi di tali synset fino ad un certo livello della
  gerarchia inserendoli in una lista. Poi, per ogni iponimo synset, si vanno a
  prendere:
    * I lemmi;
    * La glossa;
    * Gli esempi.
* Una volta fatto ciò, calcoliamo l'overlap tra ogni iponimo collezionato e la
  definizione del target iniziale (ovviamente si intende materiale lessicale
  lemmatizzato).
* Per ogni forma target, si vanno poi a stampare i primi $n$ iponimi con valore
  più alto di similarità.

### 3. Hanks
* IMPORTANTE: Lavoriamo sulle frasi.
* Per l'implementazione della teoria di Hanks si è scelto il verbo *"to cut"*
  con valenza 2.
* Come corpus si è utilizzata una concatenazione di 3 corpora:
    1. Brown;
    2. Reuters;
    3. Gutenberg project.
* Si filtrano le varie parole che contengono solo la parola *cut*, lemmatizzando
  prima la frase (e quindi normalizzandola).
* Si applica un parsing delle frasi ottenute per vedere in quali il termine
  viene utilizzato come verbo.
* Si selezionano i vari argomenti del verbo controllando l'albero sintattico, in
  modo tale da selezionare solo i verbi con valenza = 2 (Abbiamo gestito
  completamente i casi con valenza 1 e valenza 2 in questa implementazione. I
  verbi ditransitivi non sono specificati quindi i filler degli argomenti con
  $n > 2$ finiscono come filler del secondo argomento. Inoltre, Spacy non
  parsifica verbi ditransitivi).
* Per selezionare i semantic types dei filler trovati, si fa una WSD per
  estrarre il ruolo semantico, utilizzando come contesto la frase. Si utilizza
  poi il *lexname* relativo al senso di WordNet come ruolo semantico.
    * Per rendere più efficiente l'implementazione, i pronomi vengono gestiti
      senza fare WSD (hard coded). Quelli non presenti non sono stati gestiti
      perché troppo ambigui.
* Si vanno a contare quante volte compaiono nel testo i vari significati (quindi
  quante volte il verbo compare con due determinati semantic types). Ovviamente,
  ogni combinazione semantic type e verbo indentifica un senso (cluter).

### 4b. New Language
* Utilizziamo Open Multilingual Wordnet, cioè un progetto di vari WordNet di
  vari lingue.
* Per ogni termine, prendiamo l'insieme di sensi corrispondente. Per ogni senso
  trovato, vado a prendere i lemmi nell'altra lingua $L2$ corrispondenti al
  senso.
* Tra i lemmi che rappresentano il senso ottenuti nell'altra lingua, vado a
  prendere quello meno ambiguo (quello con meno sensi associati).
* Una volta fatto ciò, genero il dizionario concatenando $t$ (il termine
  originale associato ai vari sensi) a $tt$, (il termine meno ambiguo del
  senso). Avrò tante tuple tanti quanti sono i sensi associati a $t$, però
  potrebbe essere che non esistano sensi nell'altra lingua quindi potrei averne
  meno. 
