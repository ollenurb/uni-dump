(defmodule UNCERTAINTY (export ?ALL))

; represents an hypothesis that the agent believes with a certain degree
(deftemplate UNCERTAINTY::hypothesis
  (slot x)
  (slot y)
  (slot CF (type FLOAT) (range -1.0 +1.0))
)

(defrule UNCERTAINTY::combine-certainties-both-positive (declare (auto-focus TRUE))
  ?factl <- (hypothesis
    (x ?x)
    (y ?y)
    (CF ?c1&:(>= ?c1 0))
  )
  ?fact2 <- (hypothesis
    (x ?x)
    (y ?y)
    (CF ?c2&:(>= ?c2 0))
  )
  (test (neq ?factl ?fact2))
=>
  (retract ?factl)
  (bind ?c3 (- (+ ?c1 ?c2) (* ?c1 ?c2)))
  (modify ?fact2 (CF ?c3))
)

(defrule UNCERTAINTY::combine-certainties-both-negative
        (declare (auto-focus TRUE))
    ?factl <- (hypothesis
        (x ?x)
        (y ?y)
        (CF ?c1&:(< ?c1 0)))
    ?fact2 <- (hypothesis
        (x ?x)
        (y ?y)
        (CF ?c2&:(< ?c2 0)))
    (test (neq ?factl ?fact2))
=>
    (retract ?factl)
    (bind ?c3 (+ (+ ?c1 ?c2) (* ?c1 ?c2)))
    (modify ?fact2 (CF ?c3)))

(defrule UNCERTAINTY::combine-certainties-pos-neg
        (declare (auto-focus TRUE))
    ?factl <- (hypothesis
            (x ?x)
            (y ?y)
            (CF ?c1&:(>= ?c1 0)))
    ?fact2 <- (hypothesis
            (x ?x)
            (y ?y)
            (CF ?c2&:(< ?c2 0)))
    (test (neq ?factl ?fact2))
=>
    (retract ?factl)
    (bind ?c3 (/ (+ ?c1 ?c2) (- 1 ?c2)))
    (modify ?fact2 (CF ?c3)))

(defrule UNCERTAINTY::combine-certainties-neg-pos
        (declare (auto-focus TRUE))
    ?factl <- (hypothesis
        (x ?x)
        (y ?y)
        (CF ?c1&:(< ?c1 0)))
    ?fact2 <- (hypothesis
        (x ?x)
        (y ?y)
        (CF ?c2&:(>= ?c2 0)))
    (test (neq ?factl ?fact2))
=>
    (retract ?factl)
    (bind ?c3 (/ (+ ?c1 ?c2) (- 1 ?c1)))
    (modify ?fact2 (CF ?c3)))

