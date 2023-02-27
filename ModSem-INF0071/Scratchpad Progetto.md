## Scratchpad Progetto
* Opere musicali (ma dal punto di vista tecnico)
    * Informazioni tecniche riguardanti l'armonia dell'opera

### Tassonomia delle classi
Siccome e' quasi impossibile classificare completamente opere di tipo musicale
secondo un framework rigido, si e' scelto di rappresentare solamente alcuni
aspetti di esse. Il framework scelto comprende la seguente tassonomia di classi. 

- Thing
    - Composizione ([Bib](https://it.wikipedia.org/wiki/Forma_(musica)))
        - Monopartita
        - Bipartita
        - Tripartita
        - Organico
            - Sonata
            - Concerto
            - Duo
            - Trio
            - Quartetto
            - Quintetto
            - ecc
        - Libera
            - Notturno
            - Improvviso
            - Fantasia
        - Polifonica
            - Fuga
            - Canone
    - Tonalita' (Classi Enumerate)
        - Maggiore
        - Minore
    - Compositore
    - Corrente Artistica (Classe Enumerata?)
        * Barocco
        * Romanticismo
        * Moderna
    - Genere
        - Da Camera
            - Solista
        - Orchestrale

## Notes
* Classificazione automatica una delle ragioni possibili per il progetto
* Classe Definita:
    * EquivalentOf
    * Hanno condizioni necessarie e sufficienti
* Classi Primitive con condizioni:
    * SubClassOf
    * Hanno solo condizioni necessarie
    * Non permettono di collocare individui nelle classi in modo automatico
    * Sono in grado di individuare inconsistenze riguardo gli individui
* SubpropertyOf: (chain)
    * Permette di fare la composizione funzionale posto che il range e dominio
      delle property coincidano
* 


