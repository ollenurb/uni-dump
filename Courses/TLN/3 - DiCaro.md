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
        * Metodi Estrat. Vale in sostanza quel che avete appreso (e non solo)
all’interno di questo corso.
Con la Formal Concept Analysis (otivi;
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
