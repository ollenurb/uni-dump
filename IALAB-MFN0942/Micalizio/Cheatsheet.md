# CLIPS Cheatsheet

## General/Debugging
* `;` comments
* `(exit)`: exit the interpreter
* `(watch/unwatch PARAM)`: enable/disable watching for PARAM changes across
  working memory where PARAM can be either:
    * `facts`: watch for fact changes
    * `activations`: watch rules activations during program execution 
    * `rules`: watch rules during program execution (i.e. which rule gets
      picked for execution)
* `(reset)`: reset the state by clearing the working memory and agenda and
  re-asserting the initial facts
* `(run)`: run the inference engine
* `(printout)`: print to stdout
* `(rules)`: print all the rules inside the KB
* `(ppdefrule <rule-name>)`: print the definition of a specific rule 
* `(agenda)`: prints the content of the ordered list of rules that can be activated
* `(dribble-on/off <filename>)`: enable/disable output redirection to filename
* `(set/remove-break <rulename>)`: enable/disable break on a specific rule
* `(show-breaks)`: show a list of ddefined breaks
* `(load <filename>)`: load the content of a file

## Knowledge Specification

### Facts
* `(<name> <field-1> <field-2> ... <field-n>)`: defines an ordered
  fact
* Define an unordered fact:
    * Slots are specific variables, while multislots signals the presence of one
      or more variables of that kind. We can sort of think of slots as specific
      cases of multislots with cardinality of 1

```lisp
(deftemplate <name> "optional comment"
    (slot <name-1> (type TYPE) (default VALUE) (range MIN MAX)) 
    (slot <name-2>) 
    ...
    (slot <name-n>) 
    (multislot <name> (type TYPE) (cardinality (MIN MAX)))
)
```

* `(deffacts fact-name "Description" (..facts..))`: assert a series of facts
  that are true at the start of the program
* `(reset)`: assert initial facts
* `(assert <fact>+)`: assert a new fact
* `(retract <fact-index>)`: removes a certain fact
* `(facts)`: prints the list of facts that currently are true in WM
* `(modify <fact-index> (<slot-name>, <slot-value>)+)`: removes the original
  fact, then inserts the new fact inside the working memory
* `(duplicate <fact-index> (<slot-name>, <slot-value>)+)`: duplicates the given
  fact

### Rules
* Define a rule where `<patterns>` are the left hand side of the rule and
  `<actions>` are the right hand side of the rule:

```lisp
(defrule <rule name> ["comment"]
<patterns>*     ; (LHS)
=>
<actions>*)     ; (RHS)
```

* `?<bind-name>`: defines a binding in a pattern (LHS) of a rule (with a single
  slot of a fact)
    * Bindings can also be used to access certain facts on the WM, for example:
      `?age <- (age harry 17)`
* `$?<bind-name>`: same as before but matches 0 or more values in a multislot


