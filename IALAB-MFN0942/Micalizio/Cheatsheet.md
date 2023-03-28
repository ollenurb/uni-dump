# CLIPS Cheatsheet

* `;` comments
* `(exit)`: exit the interpreter
* `(deffacts fact-name "Description" (..facts..))`: assert a series of facts
  that are true at the start of the program
* `(assert <fact>+)`: assert a fact
* `(retract <fact-index>)`: removes a fact
* `(facts)`: prints a list of facts

* The following snippet defines a rule where `<patterns>` are the left hand side
  of the rule and `<actions>` are the right hand side of the rule

```lisp
(defrule <rule name> ["comment"]
<patterns>* 
=>
<actions>*)
```

* `(watch PARAM)`: watches for PARAM changes across working memory where PARAM
  can be either:
    * `facts`: watch for fact changes
    * `activations`: watch for rule activations
    * `rules`: watch for rule changes
* `(modify <fact-index> (<slot-name>, <slot-value>)+)`: removes the original
  fact, then inserts the new fact inside the working memory
* `(duplicate <fact-index> (<slot-name>, <slot-value>)+)`: duplicates the given
  fact
* `(reset)`: resets the 
* `(run)`: run the inference engine which tries to apply all the rules until it
  reaches some final fact
