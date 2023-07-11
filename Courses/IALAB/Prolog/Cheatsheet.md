# Prolog Cheatsheet

### Misc
* `:set filetype=prolog` force Prolog filetype (in nvim)
* `swipl filename.pl` open the interpreter with `filename.pl` KB loaded
* `['filename.pl']` loads the KB from the interpreter
* `halt.` exits the interpreter
* `trace` enter debug (tracing) mode
* `nodebug` exit debug mode
* `;` see next possibility

* Predicati utili:
    * `member(M, List).`
        - Ritorna true se M e' istanziato con una costante ed e' in List.
        - Se M e' una variabile, la unifica con la prossima occorrenza di M nella Lista.
    * `select(M, List, Remainder).`
        - Rimuove M da List e unifica la rista rimanente con Remainder
    * `ground(X).`
        - Restituisce `true` se `X` e' un termine istanziato (eg. `X=1`)
    * `findall(X, pred(X), Risultato).`
        - Trova tutti i valori assegnabili a X che rendendono vero il predicato
          `pred` e li assegna alla variabile `Risultato`
    * `statistics(cputime, TStart).`
        - Istanzia TStart con il timestamp attuale
    * `assert(pred(something)).`
        - Asserisce che `pred(something)` e' vero e lo aggiunge alla base di
          conoscenza
    * `asserta(pred(something)).`
        - Inserisce *in testa* predicato, cioe' prima di tutte le clausole dello
          stesso tipo
    * `assertz(pred(something)).`
        - Inserisce *in coda* il predicato, cioe' dopo tutte le clausole dello
          stesso tipo
    * `retract(pred(something)).`
        - Rimuove `pred(something)` dalla base di conoscenza
    * `retractall(pred(_)).`
        - Rimuove tutti i fatti `pred(_)` dalla base di conoscenza

### Syntax
* `/==` not equals
* `Variables` first letter uppercase
* `terms` lowercase

