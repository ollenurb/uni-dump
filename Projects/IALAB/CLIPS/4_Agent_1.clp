(defmodule INIT  
  (import MAIN ?ALL)
  (import ENV ?ALL)
  (import UNCERTAINTY ?ALL)
  (export ?ALL)
)

; ============ Facts template definitions ============
(deftemplate agent-state
  (slot initialized (default FALSE))
)

(deftemplate fire-hypothesis
  (slot x)
  (slot y)
  (slot prob)
)

; Local (to the agent) version of k-per-row and k-per-col
(deftemplate local-k-per-row
  (slot row)
  (slot num)
)

(deftemplate local-k-per-col
  (slot col)
  (slot num)
)

(deftemplate uncertain-per-col
  (slot col)
  (slot num)
)

(deftemplate uncertain-per-row
  (slot row)
  (slot num)
)

(deftemplate considered
  (slot type (allowed-values fire count uncertain update guess))
  (slot step (default 0))
  (slot id)
)

(deffacts initial-facts
  ; Agent state
  (agent-state (initialized FALSE))
  ; Uncertain Rows
  (uncertain-per-row (row 0) (num 10))
  (uncertain-per-row (row 1) (num 10))
  (uncertain-per-row (row 2) (num 10))
  (uncertain-per-row (row 3) (num 10))
  (uncertain-per-row (row 4) (num 10))
  (uncertain-per-row (row 5) (num 10))
  (uncertain-per-row (row 6) (num 10))
  (uncertain-per-row (row 7) (num 10))
  (uncertain-per-row (row 8) (num 10))
  (uncertain-per-row (row 9) (num 10))
  ; Uncertain Cols
  (uncertain-per-col (col 0) (num 10))
  (uncertain-per-col (col 1) (num 10))
  (uncertain-per-col (col 2) (num 10))
  (uncertain-per-col (col 3) (num 10))
  (uncertain-per-col (col 4) (num 10))
  (uncertain-per-col (col 5) (num 10))
  (uncertain-per-col (col 6) (num 10))
  (uncertain-per-col (col 7) (num 10))
  (uncertain-per-col (col 8) (num 10))
  (uncertain-per-col (col 9) (num 10))
)

(defrule initialize-local-k-per-row
  (k-per-row (row ?row) (num ?num))
  (not (local-k-per-row (row ?row2 &: (eq ?row ?row2))))
=>
  (assert (local-k-per-row (row ?row) (num ?num)))
)

(defrule initialize-local-k-per-col
  (k-per-col (col ?col) (num ?num))
  (not (local-k-per-col (col ?col2 &: (eq ?col ?col2))))
=>
  (assert (local-k-per-col (col ?col) (num ?num)))
)

(defrule initialization-finished (declare (salience -20)) 
  ?s <- (agent-state (initialized FALSE))
=>
  (modify ?s (initialized TRUE))
  (printout t "[Agent] Initialization finished" crlf)
  (focus AGENT)
)

(defrule initialize-fire-hypothesis (declare (salience -10))
  (local-k-per-col (col ?col) (num ?ncol))
  (local-k-per-row (row ?row) (num ?nrow))
  (uncertain-per-row (row ?row) (num ?nurow &: (neq ?nurow 0)))
  (uncertain-per-col (col ?col) (num ?nucol &: (neq ?nucol 0)))
  (not (fire-hypothesis (x ?row) (y ?col)))
  (agent-state (initialized FALSE))
=>
  (bind ?estimate (/ (+ ?nrow ?ncol) (+ ?nurow ?nucol)))
  (assert (fire-hypothesis (x ?row) (y ?col) (prob ?estimate)))
)

; ============== Agent Module Definition ============== 
(defmodule AGENT
  (import MAIN ?ALL)
  (import ENV ?ALL)
  (import INIT deftemplate ?ALL)
  (export ?ALL)
)

(defrule initialize-agent (declare (salience 100))
  (agent-state (initialized FALSE))
=>
  (focus INIT)
)

; ============== Facts Definitions ============== 

; terminate the game when all guesses are placed
(defrule terminate
  (moves (guesses ?g &: (eq ?g 0)))
  (moves (fires ?f &: (eq ?f 0)))
  (status (step ?s) (currently running))
=>
  (printout t "[Agent] Issuing solve" crlf)
  (assert (exec (step ?s) (action solve)))
  (pop-focus)
)

; ================ Update Rules ================

(defrule decrease-local-ks (declare (auto-focus TRUE))
  ?hp <- (hypothesis (x ?x) (y ?y) (CF ?cf &: (eq ?cf 1.0)))
  (not (considered (type count) (id ?id &:(eq ?hp ?id))))
  ?lkr <- (local-k-per-row (row ?x) (num ?nrow))
  ?lkc <- (local-k-per-col (col ?y) (num ?ncol))
=>
  (modify ?lkr (num (- ?nrow 1)))
  (modify ?lkc (num (- ?ncol 1)))
  (assert (considered (type count) (id ?hp)))
)

(defrule decrease-uncertain (declare (auto-focus TRUE))
  ?hp <- (hypothesis (x ?x) (y ?y) (CF ?cf &: (or (eq ?cf 1.0) (eq ?cf -1.0))))
  (not (considered (type uncertain) (id ?id &: (eq ?hp ?id))))
  ?ur <- (uncertain-per-row (row ?x) (num ?nrow))
  ?uc <- (uncertain-per-col (col ?y) (num ?ncol))
=>
  (modify ?ur (num (- ?nrow 1)))
  (modify ?uc (num (- ?ncol 1)))
  (assert (considered (type uncertain) (id ?hp)))
)

; update estimates only during the fire phase
(defrule update-estimate (declare (salience 20))
  (status (step ?s) (currently running))
  (moves (fires ?f &: (> ?f 0)))
  (local-k-per-col (col ?col) (num ?ncol))
  (local-k-per-row (row ?row) (num ?nrow))
  (uncertain-per-row (row ?row) (num ?nurow &: (neq ?nurow 0)))
  (uncertain-per-col (col ?col) (num ?nucol &: (neq ?nucol 0)))
  ?hp <- (fire-hypothesis (x ?row) (y ?col))
  (not (considered (type update) (id ?id &: (eq ?hp ?id)) (step ?s)))
=>
  (bind ?estimate (/ (+ ?nrow ?ncol) (+ ?nurow ?nucol)))
  (assert (considered (type update) (id ?hp) (step ?s)))
  (modify ?hp (prob ?estimate))
)

; ============== Utils ============== 

(defrule print-cell-when-revealed
  (k-cell (x ?x) (y ?y) (content ?content))
=>
  (printout t "[Agent] Got " ?content " in (x: " ?x ", y: " ?y ")" crlf)
)

; ============== Inference Rules ==============

; if there is water, we are 100% sure that there's nothing there
(defrule water-piece (declare (salience 20))
  (k-cell (x ?x) (y ?y) (content water))
=>
  (assert (hypothesis (x ?x) (y ?y) (CF -1.0)))
)

; Sottomarino
(defrule submarine-piece (declare (salience 20))
  (k-cell (x ?x) (y ?y) (content sub))
=>
  (assert (hypothesis (x ?x) (y ?y) (CF 1.0)))
)

; Rules for pieces that are close to borders
(defrule mid-piece-on-horizontal-border (declare (salience 20))
  (k-cell (x ?x) (y ?y &: (or (eq ?y 0) (eq ?y 9))) (content middle))
=>
  (assert (hypothesis (x ?x) (y ?y) (CF 1.0)))
  (assert (hypothesis (x (- ?x 1)) (y ?y) (CF 1.0)))
  (assert (hypothesis (x (+ ?x 1)) (y ?y) (CF 1.0)))
)

(defrule mid-piece-on-vertical-border (declare (salience 20))
  (k-cell (x ?x &: (or (eq ?x 0) (eq ?x 9))) (y ?y) (content middle))
=>
  (assert (hypothesis (x ?x) (y ?y) (CF 1.0)))
  (assert (hypothesis (x ?x) (y (+ ?y 1)) (CF 1.0)))
  (assert (hypothesis (x ?x) (y (- ?y 1)) (CF 1.0)))
)

; General rules
(defrule mid-piece (declare (salience 20))
  (k-cell (x ?x &: (and (> ?x 0) (< ?x 9))) (y ?y &: (and (> ?y 0) (< ?y 9))) (content middle))
  (local-k-per-row (row ?x) (num ?nrow &: (>= ?nrow 3)))
  (local-k-per-col (col ?y) (num ?ncol &: (>= ?ncol 3)))
  (not (local-k-per-col (col ?c &: (or (eq ?c (+ ?c 1)) (eq ?c (- ?c 1)))) (num 0)))
  (not (local-k-per-row (row ?r &: (or (eq ?r (+ ?r 1)) (eq ?r (- ?r 1)))) (num 0)))
=>
  (assert (hypothesis (x ?x) (y ?y) (CF 1.0)))
  ; Horizontal
  (assert (hypothesis (x (- ?x 1)) (y ?y) (CF 0.5)))
  (assert (hypothesis (x (- ?x 2)) (y ?y) (CF 0.25)))
  (assert (hypothesis (x (+ ?x 1)) (y ?y) (CF 0.25)))
  (assert (hypothesis (x (+ ?x 2)) (y ?y) (CF 0.25)))
  ; Vertical
  (assert (hypothesis (x ?x) (y (- ?y 1)) (CF 0.5)))
  (assert (hypothesis (x ?x) (y (- ?y 2)) (CF 0.25)))
  (assert (hypothesis (x ?x) (y (+ ?y 1)) (CF 0.25)))
  (assert (hypothesis (x ?x) (y (+ ?y 2)) (CF 0.25)))
)

(defrule mid-piece-horizontal (declare (salience 20))
  (k-cell (x ?x &: (and (> ?x 0) (< ?x 9))) (y ?y &: (and (> ?y 0) (< ?y 9))) (content middle))
  (local-k-per-row (row ?x) (num ?nrow &: (>= ?nrow 3)))
  (local-k-per-col (col ?y) (num ?ncol &: (< ?ncol 3)))
=>
  (assert (hypothesis (x ?x) (y ?y) (CF 1.0)))
  ; Horizontal
  (assert (hypothesis (x ?x) (y (- ?y 1)) (CF 1.0)))
  (assert (hypothesis (x ?x) (y (+ ?y 1)) (CF 1.0)))
  (assert (hypothesis (x ?x) (y (- ?y 2)) (CF 0.5)))
  (assert (hypothesis (x ?x) (y (+ ?y 2)) (CF 0.5)))
)

(defrule mid-piece-vertical (declare (salience 20))
  (k-cell (x ?x &: (and (> ?x 0) (< ?x 9))) (y ?y &: (and (> ?y 0) (< ?y 9))) (content middle))
  (local-k-per-row (row ?x) (num ?nrow &: (< ?nrow 3)))
  (local-k-per-col (col ?y) (num ?ncol &: (>= ?ncol 3)))
=>
  (assert (hypothesis (x ?x) (y ?y) (CF 1.0)))
  (assert (hypothesis (x (- ?x 1)) (y ?y) (CF 1.0)))
  (assert (hypothesis (x (+ ?x 1)) (y ?y) (CF 1.0)))
  (assert (hypothesis (x (- ?x 2)) (y ?y) (CF 0.5)))
  (assert (hypothesis (x (+ ?x 2)) (y ?y) (CF 0.5)))
)

; If there is a mid piece and an empty column on its side, we are sure that it
; is placed vertically
(defrule mid-piece-vertical-empty-cols-4 (declare (salience 20))
  (k-cell (x ?x &: (and (> ?x 0) (< ?x 9))) (y ?y &: (and (> ?y 0) (< ?y 9))) (content middle))
  (local-k-per-col (col ?y) (num ?ncol &: (> ?ncol 3)))
  (local-k-per-col (col ?c &: (or (eq ?c (+ ?y 1)) (eq ?c (- ?y 1)))) (num 0))
=>
  (assert (hypothesis (x ?x) (y ?y) (CF 1.0)))
  (assert (hypothesis (x (- ?x 1)) (y ?y) (CF 1.0)))
  (assert (hypothesis (x (+ ?x 1)) (y ?y) (CF 1.0)))
  (assert (hypothesis (x (- ?x 2)) (y ?y) (CF 0.5)))
  (assert (hypothesis (x (+ ?x 2)) (y ?y) (CF 0.5)))
)

(defrule mid-piece-vertical-empty-cols-3 (declare (salience 20))
  (k-cell (x ?x &: (and (> ?x 0) (< ?x 9))) (y ?y &: (and (> ?y 0) (< ?y 9))) (content middle))
  (local-k-per-col (col ?y) (num ?ncol &: (eq ?ncol 3)))
  (local-k-per-col (col ?c &: (or (eq ?c (+ ?y 1)) (eq ?c (- ?y 1)))) (num 0))
=>
  (assert (hypothesis (x ?x) (y ?y) (CF 1.0)))
  (assert (hypothesis (x (- ?x 1)) (y ?y) (CF 1.0)))
  (assert (hypothesis (x (+ ?x 1)) (y ?y) (CF 1.0)))
)

(defrule mid-piece-horizontal-empty-rows-4 (declare (salience 20))
  (k-cell (x ?x &: (and (> ?x 0) (< ?x 9))) (y ?y &: (and (> ?y 0) (< ?y 9))) (content middle))
  (local-k-per-row (row ?x) (num ?nrow &: (> ?nrow 3)))
  (local-k-per-row (row ?r &: (or (eq ?r (+ ?x 1)) (eq ?r (- ?x 1)))) (num 0))
=>
  (assert (hypothesis (x ?x) (y ?y) (CF 1.0)))
  (assert (hypothesis (x ?x) (y (- ?y 1)) (CF 1.0)))
  (assert (hypothesis (x ?x) (y (+ ?y 1)) (CF 1.0)))
  (assert (hypothesis (x ?x) (y (- ?y 2)) (CF 0.5)))
  (assert (hypothesis (x ?x) (y (+ ?y 2)) (CF 0.5)))
)

(defrule mid-piece-horizontal-empty-rows-3 (declare (salience 20))
  (k-cell (x ?x &: (and (> ?x 0) (< ?x 9))) (y ?y &: (and (> ?y 0) (< ?y 9))) (content middle))
  (local-k-per-row (row ?x) (num ?nrow &: (> ?nrow 3)))
  (local-k-per-row (row ?r &: (or (eq ?r (+ ?x 1)) (eq ?r (- ?x 1)))) (num 0))
=>
  (assert (hypothesis (x ?x) (y ?y) (CF 1.0)))
  (assert (hypothesis (x ?x) (y (- ?y 1)) (CF 1.0)))
  (assert (hypothesis (x ?x) (y (+ ?y 1)) (CF 1.0)))
)

(defrule left-piece (declare (salience 20))
  (k-cell (x ?x) (y ?y) (content left))
=>
  (assert (hypothesis (x ?x) (y ?y) (CF 1.0)))
  (assert (hypothesis (x ?x) (y (+ ?y 1)) (CF 1.0)))
  (assert (hypothesis (x ?x) (y (+ ?y 2)) (CF 0.25)))
  (assert (hypothesis (x ?x) (y (+ ?y 3)) (CF 0.25)))
)

(defrule right-piece (declare (salience 20))
  (k-cell (x ?x) (y ?y) (content right))
=>
  (assert (hypothesis (x ?x) (y ?y) (CF 1.0)))
  (assert (hypothesis (x ?x) (y (- ?y 1)) (CF 1.0)))
  (assert (hypothesis (x ?x) (y (- ?y 2)) (CF 0.25)))
  (assert (hypothesis (x ?x) (y (- ?y 3)) (CF 0.25)))
)

(defrule top-piece (declare (salience 20))
  (k-cell (x ?x) (y ?y) (content top))
=>
  (assert (hypothesis (x ?x) (y ?y) (CF 1.0)))
  (assert (hypothesis (x (+ ?x 1)) (y ?y) (CF 1.0)))
  (assert (hypothesis (x (+ ?x 2)) (y ?y) (CF 0.25)))
  (assert (hypothesis (x (+ ?x 3)) (y ?y) (CF 0.25)))
)

(defrule bot-piece (declare (salience 20))
  (k-cell (x ?x) (y ?y) (content bot))
=>
  (assert (hypothesis (x ?x) (y ?y) (CF 1.0)))
  (assert (hypothesis (x (- ?x 1)) (y ?y) (CF 1.0)))
  (assert (hypothesis (x (- ?x 2)) (y ?y) (CF 0.25)))
  (assert (hypothesis (x (- ?x 3)) (y ?y) (CF 0.25)))
)

; clear hypothesis that are out of bounds
(defrule drop-out-of-bounds (declare (salience 20))
  ?hp <- (hypothesis (x ?x) (y ?y))
  (test (or (or (< ?x 0) (> ?x 10)) (or (< ?y 0) (> ?y 10))))
=>
  (retract ?hp)
)

(defrule remove-hypothesis-on-empty-row (declare (salience 20))
  ?hp <- (hypothesis (x ?x) (CF ?cf &: (and (>= ?cf 0) (< ?cf 1))))
  (k-per-row (row ?x) (num 0))
=>
  (modify ?hp (CF -1.0))
)

(defrule remove-hypothesis-on-empty-col (declare (salience 20))
  ?hp <- (hypothesis (y ?y) (CF ?cf &: (and (>= ?cf 0) (< ?cf 1))))
  (k-per-col (col ?y) (num 0))
=>
  (modify ?hp (CF -1.0))
)

; Inverse inference rules
(defrule sub-piece-inverse (declare (salience 20))
  (k-cell (x ?x) (y ?y) (content sub))
=>
  (assert (hypothesis (x (- ?x 1)) (y ?y) (CF -1.0)))
  (assert (hypothesis (x (+ ?x 1)) (y ?y) (CF -1.0)))
  (assert (hypothesis (x ?x) (y (- ?y 1)) (CF -1.0)))
  (assert (hypothesis (x ?x) (y (+ ?y 1)) (CF -1.0)))
  (assert (hypothesis (x (- ?x 1)) (y (- ?y 1)) (CF -1.0)))
  (assert (hypothesis (x (- ?x 1)) (y (+ ?y 1)) (CF -1.0)))
  (assert (hypothesis (x (+ ?x 1)) (y (- ?y 1)) (CF -1.0)))
  (assert (hypothesis (x (+ ?x 1)) (y (+ ?y 1)) (CF -1.0)))
)

(defrule top-piece-inverse (declare (salience 20))
  (k-cell (x ?x) (y ?y) (content top))
=>
  (assert (hypothesis (x (- ?x 1)) (y ?y) (CF -1.0)))
  (assert (hypothesis (x ?x) (y (+ ?y 1)) (CF -1.0)))
  (assert (hypothesis (x ?x) (y (- ?y 1)) (CF -1.0)))
  (assert (hypothesis (x (- ?x 1)) (y (+ ?y 1)) (CF -1.0)))
  (assert (hypothesis (x (- ?x 1)) (y (- ?y 1)) (CF -1.0)))
)

(defrule bot-piece-inverse (declare (salience 20))
  (k-cell (x ?x) (y ?y) (content bot))
=>
  (assert (hypothesis (x ?x) (y (+ ?y 1)) (CF -1.0)))
  (assert (hypothesis (x ?x) (y (- ?y 1)) (CF -1.0)))
  (assert (hypothesis (x (+ ?x 1)) (y ?y) (CF -1.0)))
  (assert (hypothesis (x (+ ?x 1)) (y (+ ?y 1)) (CF -1.0)))
  (assert (hypothesis (x (+ ?x 1)) (y (- ?y 1)) (CF -1.0)))
)

(defrule left-piece-inverse (declare (salience 20))
  (k-cell (x ?x) (y ?y) (content left))
=>
  (assert (hypothesis (x ?x) (y (- ?y 1)) (CF -1.0)))
  (assert (hypothesis (x (+ ?x 1)) (y (- ?y 1)) (CF -1.0)))
  (assert (hypothesis (x (- ?x 1)) (y (- ?y 1)) (CF -1.0)))
  (assert (hypothesis (x (+ ?x 1)) (y ?y) (CF -1.0)))
  (assert (hypothesis (x (- ?x 1)) (y ?y) (CF -1.0)))
)

(defrule right-piece-inverse (declare (salience 20))
  (k-cell (x ?x) (y ?y) (content right))
=>
  (assert (hypothesis (x ?x) (y (+ ?y 1)) (CF -1.0)))
  (assert (hypothesis (x (+ ?x 1)) (y (+ ?y 1)) (CF -1.0)))
  (assert (hypothesis (x (- ?x 1)) (y (+ ?y 1)) (CF -1.0)))
  (assert (hypothesis (x (+ ?x 1)) (y ?y) (CF -1.0)))
  (assert (hypothesis (x (- ?x 1)) (y ?y) (CF -1.0)))
)

(defrule mid-piece-inverse (declare (salience 20))
  (k-cell (x ?x) (y ?y) (content middle))
=>
  (assert (hypothesis (x (+ ?x 1)) (y (+ ?y 1)) (CF -1.0)))
  (assert (hypothesis (x (+ ?x 1)) (y (- ?y 1)) (CF -1.0)))
  (assert (hypothesis (x (- ?x 1)) (y (+ ?y 1)) (CF -1.0)))
  (assert (hypothesis (x (- ?x 1)) (y (- ?y 1)) (CF -1.0)))
)

; ============== Firing Strategy ==============

; Don't fire certain cell contents
(defrule filter-known-cell (declare (salience 20))
  (hypothesis (x ?x) (y ?y) (CF ?cf &: (or (eq ?cf 1.0) (eq ?cf -1.0))))
  ?fhp <- (fire-hypothesis (x ?x) (y ?y))
=>
  (retract ?fhp)
)

(defrule filter-known-row (declare (salience 20))
  (local-k-per-col (col ?y) (num 0))
  ?fhp <- (fire-hypothesis (y ?y))
=>
  (retract ?fhp)
)

(defrule filter-known-col (declare (salience 20))
  (local-k-per-row (row ?x) (num 0))
  ?fhp <- (fire-hypothesis (x ?x))
=>
  (retract ?fhp)
)

(defrule fire (declare (salience -10))
  (status (step ?s) (currently running))
  (moves (fires ?f &: (> ?f 0)))
  ?fhp <- (fire-hypothesis (x ?x) (y ?y) (prob ?p1))
  (not (fire-hypothesis (prob ?p2 &: (> ?p2 ?p1))))
  (not (exec (action fire) (x ?x) (y ?y)))
=>
  (assert (exec (step ?s) (action fire) (x ?x) (y ?y)))
  (retract ?fhp)
  (printout t "[Agent] Firing (x: " ?x ", y: "  ?y ", p: " ?p1 ")" crlf)
  (pop-focus)
)

; ; ============== Finish Phase ==============

; transform the most likely hypothesis into a guess. it matches iff there
; exists an hypothesis such that no other hypothesis exists with a higher CF
; value (which is the definition of maximum value)
; TODO (Refactor): use (considered), remove (guessed BOOL)
(defrule most-likely-to-guess (declare (salience -10))
  ?hp1 <- (hypothesis (x ?x1) (y ?y1) (CF ?cf1 &: (> ?cf1 0)))
  (not (hypothesis (x ?x2) (y ?y2) (CF ?cf2 &:(> ?cf2 ?cf1))))
  (status (step ?s) (currently running)) ; the game must be running
  (moves (fires ?f &: (eq ?f 0)))
  (moves (guesses ?g &:(> ?g 0)))
=>
  (assert (exec (step ?s) (action guess) (x ?x1) (y ?y1)))
  (printout t "[Agent] Placing guess (x: " ?x1 ", y: " ?y1 ", cf: " ?cf1 ")" crlf)
  (retract ?hp1)
  (pop-focus)
)

(defrule fill-remaining-guesses-with-most-probable
  (not (hypothesis (CF ?cf &: (> ?cf 0))))
  (status (step ?s) (currently running))
  (moves (fires ?f &: (eq ?f 0)))
  (moves (guesses ?g &:(> ?g 0)))
  ?fhp <- (fire-hypothesis (x ?x) (y ?y) (prob ?p1))
  (not (fire-hypothesis (prob ?p2 &: (> ?p2 ?p1))))
=>
  (assert (exec (step ?s) (action guess) (x ?x) (y ?y)))
  (printout t "[Agent] Creating guess from fire-hypothesis (x: " ?x ", y: " ?y ", p: " ?p1 ")" crlf)
  (retract ?fhp)
  (pop-focus)
)
