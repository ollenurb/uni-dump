# Linked Data

* La finalita' dei linked data e' di permettere a dati provenienti da sorgenti diverse di essere
  collegati e interrogati
* Piu' precisamente e' un *metodo* per *pubblicare dati strutturati* in modo che possano essere
  collegati e diventare piu utili attraverso queries semantiche
* Si basa sulle tecnologie standard del Web quali HTTP, RDF e URI, opportunamente estese per
  condividere informazioni leggibili automaticamente dai computer
* I principi cardine dei linked data sono riassumibili in 4 punti:
    1. Ogni entita' e' identificata da un URI
    2. L'URI deve essere un URI HTTP in modo che le entita' possano essere dereferenziate
       (*dereferenziare = fornire informazioni sulla risorsa*)
    3. Fornire informazioni sulla risorsa utilizzando standard quali SPARQL, RDF, ecc
    4. Riferirsi sempre alle altre entita' facendo riferimento ai loro URI HTTP quando si pubblicano
       i dati sul Web

## Linked Data Platform

* Secondo la raccomandazione *Linked Data Platform 1.0*, una LDP consiste nell'uso del protocollo
  HTTP per l'accesso, la modifica, la creazione e la cancellazioni di risorse presenti in servers
  che espongono le loro risorse come Linked Data.
* Una linked data platform rende accessibili i propri dati esponendo un'endpoint REST API
* (**N.B** Lo chiede all'esame) Esistono 3 tipologie di links nelle triple RDF:
    1. *Relationships Links*: punta a oggetti che sono presenti eventualmente in altre sorgenti di
       dati
    2. *Identity Links*: punta uno o piu' URI che fungono da alias in altre sorgenti di dati per
       identificare la stessa entita' URI. La loro funzione e' particolarmente utile per
       l'allineamento di termini con altre basi di conoscenza 
    3. *Vocabulary Links*: puntano alle definizioni dei termini del vocabolario

## Query federate

* Permettono di selezionare i dati da differenti datasource per poi combinarli insieme
* Integrato in SPARQL 1.1, attraverso l'estensione `SERVICE`
* E' possibile utilizzare `OPTIONAL` anche sul servizio esterno per poter selezionare i dati solo se
  sono presenti

