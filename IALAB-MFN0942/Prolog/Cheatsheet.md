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

### Syntax
* `/==` not equals
* `Variables` first letter uppercase
* `terms` lowercase

