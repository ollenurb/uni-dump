(defmodule INIT
  (import MAIN ?ALL)
  (import ENV ?ALL)
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
  (slot type (allowed-values uncertain update count))
  (slot step (default 0))
  (slot x)
  (slot y)
)

; Represents the belief of the agent with respect to a particular hypothesis
(deftemplate hypothesis
  (slot x)
  (slot y)
  (slot content
    (allowed-values
      ver
      hor
      top
      bot
      right
      left
      sub
      water
      unsure
    )
  )
)

(deftemplate boat-count
  (slot boat (allowed-values battleship cruiser destroyer submarine))
  (slot num)
)

(deftemplate boat-position
  (slot boat (allowed-values battleship cruiser destroyer submarine))
  (slot x)
  (slot y)
)

(deffacts initial-facts
  ; Initialize known boats counts to 0
  (boat-count (boat battleship) (num 0))
  (boat-count (boat cruiser) (num 0))
  (boat-count (boat destroyer) (num 0))
  (boat-count (boat submarine) (num 0))
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

(defrule initialization-finished (declare (salience -20)) 
  ?s <- (agent-state (initialized FALSE))
=>
  (modify ?s (initialized TRUE))
  (printout t "[Agent] Initialization phase finished" crlf)
  (focus AGENT)
)

; ============== Agent Definition ============== 

(defmodule AGENT
  (import MAIN ?ALL)
  (import ENV ?ALL)
  (import INIT ?ALL)
  (export ?ALL)
)

(defrule initialize-agent (declare (salience 100))
  (agent-state (initialized FALSE))
=>
  (focus INIT)
)

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

; update estimates only during the fire phase
(defrule update-estimate (declare (salience 20))
  (status (step ?s) (currently running))
  (moves (fires ?f &: (> ?f 0)))
  (local-k-per-col (col ?col) (num ?ncol))
  (local-k-per-row (row ?row) (num ?nrow))
  (uncertain-per-row (row ?row) (num ?nurow &: (neq ?nurow 0)))
  (uncertain-per-col (col ?col) (num ?nucol &: (neq ?nucol 0)))
  ?fhp <- (fire-hypothesis (x ?row) (y ?col))
  (not (considered (type update) (x ?row) (y ?col) (step ?s)))
=>
  (bind ?estimate (/ (+ ?nrow ?ncol) (+ ?nurow ?nucol)))
  (assert (considered (type update) (x ?row) (y ?col) (step ?s)))
  (modify ?fhp (prob ?estimate))
)

(defrule decrease-local-ks (declare (auto-focus TRUE))
  ?cell <- (hypothesis (x ?x) (y ?y) (content ?content & ver|hor|bot|top|left|right|sub))
  (not (considered (type count) (x ?x) (y ?y)))
  ?lkr <- (local-k-per-row (row ?x) (num ?nrow))
  ?lkc <- (local-k-per-col (col ?y) (num ?ncol))
=>
  (modify ?lkr (num (- ?nrow 1)))
  (modify ?lkc (num (- ?ncol 1)))
  (assert (considered (type count) (x ?x) (y ?y)))
)

(defrule decrease-uncertain (declare (auto-focus TRUE))
  ?cell <- (hypothesis (x ?x) (y ?y) (content ?content & ~unsure))
  (not (considered (type uncertain) (x ?x) (y ?y)))
  ?ur <- (uncertain-per-row (row ?x) (num ?nrow))
  ?uc <- (uncertain-per-col (col ?y) (num ?ncol))
=>
  (modify ?ur (num (- ?nrow 1)))
  (modify ?uc (num (- ?ncol 1)))
  (assert (considered (type uncertain) (x ?x) (y ?y)))
)

; ============== Utils ============== 
(defrule print-cell-when-revealed
  (k-cell (x ?x) (y ?y) (content ?content))
=>
  (printout t "[Agent] Got " ?content " in (" ?x ", " ?y ")" crlf)
)

; ============== Inference Rules ==============

(defrule disambiguate (declare (auto-focus TRUE))
  ?cell1 <- (hypothesis (x ?x) (y ?y) (content unsure))
  ?cell2 <- (hypothesis (x ?x) (y ?y) (content ?content))
  (test (neq ?cell1 ?cell2))
=>
  (retract ?cell1)
)

(defrule disambiguate-2 (declare (auto-focus TRUE))
  ?cell1 <- (hypothesis (x ?x) (y ?y) (content ?c1 & ver|hor))
  ?cell2 <- (hypothesis (x ?x) (y ?y) (content ?c2 & bot|top|left|right|sub))
  (test (neq ?cell1 ?cell2))
=>
  (retract ?cell1)
)

(defrule disambiguate-3 (declare (auto-focus TRUE))
  ?cell1 <- (hypothesis (x ?x) (y ?y) (content water))
  ?cell2 <- (hypothesis (x ?x) (y ?y) (content ?c2 & ver|hor|bot|top|left|right|sub))
  (test (neq ?cell1 ?cell2))
=>
  (retract ?cell1)
)

(defrule remove-dup (declare (auto-focus TRUE))
  ?cell1 <- (hypothesis (x ?x) (y ?y) (content ?c))
  ?cell2 <- (hypothesis (x ?x) (y ?y) (content ?c))
  (test (neq ?cell1 ?cell2))
=>
  (retract ?cell1)
)

; inverse inference Rules (they detect water based on the rules of the game)
(defrule fill-water-horizontal (declare (salience 20))
  (hypothesis (x ?x) (y ?y) (content hor))
=>
  (assert (hypothesis (x (- ?x 1)) (y ?y) (content water)))
  (assert (hypothesis (x (+ ?x 1)) (y ?y) (content water)))
)

(defrule fill-water-vertical (declare (salience 20))
  (hypothesis (x ?x) (y ?y) (content ver))
=>
  (assert (hypothesis (x ?x) (y (- ?y 1)) (content water)))
  (assert (hypothesis (x ?x) (y (+ ?y 1)) (content water)))
)

(defrule fill-water-bot (declare (salience 20))
  (hypothesis (x ?x) (y ?y) (content bot))
=>
  (assert (hypothesis (x ?x)       (y (- ?y 1)) (content water)))
  (assert (hypothesis (x ?x)       (y (+ ?y 1)) (content water)))
  (assert (hypothesis (x (+ ?x 1)) (y (+ ?y 1)) (content water)))
  (assert (hypothesis (x (+ ?x 1)) (y ?y)       (content water)))
  (assert (hypothesis (x (+ ?x 1)) (y (- ?y 1)) (content water)))
)

(defrule fill-water-top (declare (salience 20))
  (hypothesis (x ?x) (y ?y) (content top))
=>
  (assert (hypothesis (x ?x)       (y (- ?y 1)) (content water)))
  (assert (hypothesis (x ?x)       (y (+ ?y 1)) (content water)))
  (assert (hypothesis (x (- ?x 1)) (y (+ ?y 1)) (content water)))
  (assert (hypothesis (x (- ?x 1)) (y ?y)       (content water)))
  (assert (hypothesis (x (- ?x 1)) (y (- ?y 1)) (content water)))
)

(defrule fill-water-right (declare (salience 20))
  (hypothesis (x ?x) (y ?y) (content right))
=>
  (assert (hypothesis (x (- ?x 1)) (y ?y)       (content water)))
  (assert (hypothesis (x (+ ?x 1)) (y ?y)       (content water)))
  (assert (hypothesis (x (+ ?x 1)) (y (+ ?y 1)) (content water)))
  (assert (hypothesis (x ?x)       (y (+ ?y 1)) (content water)))
  (assert (hypothesis (x (- ?x 1)) (y (+ ?y 1)) (content water)))
)

(defrule fill-water-left (declare (salience 20))
  (hypothesis (x ?x) (y ?y) (content left))
=>
  (assert (hypothesis (x (+ ?x 1)) (y ?y)       (content water)))
  (assert (hypothesis (x (- ?x 1)) (y ?y)       (content water)))
  (assert (hypothesis (x (- ?x 1)) (y (- ?y 1)) (content water)))
  (assert (hypothesis (x ?x)       (y (- ?y 1)) (content water)))
  (assert (hypothesis (x (+ ?x 1)) (y (- ?y 1)) (content water)))
)

(defrule fill-water-sub (declare (salience 20))
  (hypothesis (x ?x) (y ?y) (content sub))
=>
  (assert (hypothesis (x (- ?x 1)) (y ?y)       (content water)))
  (assert (hypothesis (x (+ ?x 1)) (y ?y)       (content water)))
  (assert (hypothesis (x ?x)       (y (- ?y 1)) (content water)))
  (assert (hypothesis (x ?x)       (y (+ ?y 1)) (content water)))
  (assert (hypothesis (x (- ?x 1)) (y (- ?y 1)) (content water)))
  (assert (hypothesis (x (- ?x 1)) (y (+ ?y 1)) (content water)))
  (assert (hypothesis (x (+ ?x 1)) (y (- ?y 1)) (content water)))
  (assert (hypothesis (x (+ ?x 1)) (y (+ ?y 1)) (content water)))
)

; if there is water, we are 100% sure that there's nothing there
(defrule water-piece (declare (salience 20))
  (k-cell (x ?x) (y ?y) (content water))
=>
  (assert (hypothesis (x ?x) (y ?y) (content water)))
)

; submarine
(defrule submarine-piece (declare (salience 20))
  (k-cell (x ?x) (y ?y) (content sub))
=>
  (assert (hypothesis (x ?x) (y ?y) (content sub)))
)

; rules for mid piece

; If there is a mid piece and an empty column on its side, we are sure that it
; is placed vertically
(defrule mid-piece-is-vertical (declare (salience 20))
  (k-cell (x ?x) (y ?y) (content middle))
  (local-k-per-col (col ?y) (num ?ncol &: (> ?ncol 3)))
  (or
    (test (or (eq ?y 0) (eq ?y 9))) ; border
    (local-k-per-col (col ?c &: (or (eq ?c (+ ?y 1)) (eq ?c (- ?y 1)))) (num 0))
    (hypothesis (y ?y1 &: (or (eq ?y1 (+ ?y 1)) (eq ?y1 (- ?y 1)))) (x ?x) (content water))
    (local-k-per-row (row ?x) (num ?nrow &: (< ?nrow 3)))
  )
=>
  (assert (hypothesis (x (- ?x 2)) (y ?y) (content unsure)))
  (assert (hypothesis (x (- ?x 1)) (y ?y) (content ver)))
  (assert (hypothesis (x ?x)       (y ?y) (content ver)))
  (assert (hypothesis (x (+ ?x 1)) (y ?y) (content ver)))
  (assert (hypothesis (x (+ ?x 2)) (y ?y) (content unsure)))
)

(defrule mid-piece-is-vertical-cruiser (declare (salience 20))
  (k-cell (x ?x) (y ?y) (content middle))
  (local-k-per-col (col ?y) (num 3))
  (or
    (test (or (eq ?y 0) (eq ?y 9))) ; border
    (local-k-per-col (col ?c &: (or (eq ?c (+ ?y 1)) (eq ?c (- ?y 1)))) (num 0))
    (hypothesis (y ?y1 &: (or (eq ?y1 (+ ?y 1)) (eq ?y1 (- ?y 1)))) (x ?x) (content water))
    (local-k-per-row (row ?x) (num ?nrow &: (< ?nrow 3)))
  )
=>
  (assert (hypothesis (x (- ?x 1)) (y ?y) (content top)))
  (assert (hypothesis (x ?x)       (y ?y) (content ver)))
  (assert (hypothesis (x (+ ?x 1)) (y ?y) (content bot)))
)

(defrule mid-piece-is-horizontal (declare (salience 20))
  (k-cell (x ?x) (y ?y) (content middle))
  (local-k-per-row (row ?x) (num ?nrow &: (> ?nrow 3)))
  (or
    (test (or (eq ?x 0) (eq ?x 9))) ; border
    (local-k-per-row (row ?r &: (or (eq ?r (+ ?x 1)) (eq ?r (- ?x 1)))) (num 0)) ; row below-upside is 0
    (hypothesis (x ?x1 &: (or (eq ?x1 (+ ?x 1)) (eq ?x1 (- ?x 1)))) (y ?y) (content water)) ; adjacent cell below-upside has water
    (local-k-per-col (col ?y) (num ?ncol &: (< ?ncol 3))) ; colum count is 3
  )
=>
  (assert (hypothesis (x ?x) (y (- ?y 2)) (content unsure)))
  (assert (hypothesis (x ?x) (y (- ?y 1)) (content hor)))
  (assert (hypothesis (x ?x) (y ?y)       (content hor)))
  (assert (hypothesis (x ?x) (y (+ ?y 1)) (content hor)))
  (assert (hypothesis (x ?x) (y (+ ?y 2)) (content unsure)))
)

(defrule mid-piece-is-horizontal-cruiser (declare (salience 20))
  (k-cell (x ?x) (y ?y) (content middle))
  (local-k-per-row (row ?x) (num 3))
  (or
    (test (or (eq ?x 0) (eq ?x 9))) ; border
    (local-k-per-row (row ?r &: (or (eq ?r (+ ?x 1)) (eq ?r (- ?x 1)))) (num 0)) ; row below-upside is 0
    (hypothesis (x ?x1 &: (or (eq ?x1 (+ ?x 1)) (eq ?x1 (- ?x 1)))) (y ?y) (content water)) ; adjacent cell below-upside has water
    (local-k-per-col (col ?y) (num ?ncol &: (< ?ncol 3))) ; colum count is 3
  )
=>
  (assert (hypothesis (x ?x) (y (- ?y 1)) (content left)))
  (assert (hypothesis (x ?x) (y ?y)       (content hor)))
  (assert (hypothesis (x ?x) (y (+ ?y 1)) (content right)))
)

(defrule left-piece (declare (salience 20))
  (k-cell (x ?x) (y ?y) (content left))
=>
  (assert (hypothesis (x ?x) (y ?y)       (content left)))
  (assert (hypothesis (x ?x) (y (+ ?y 1)) (content hor)))
  (assert (hypothesis (x ?x) (y (+ ?y 2)) (content unsure)))
  (assert (hypothesis (x ?x) (y (+ ?y 3)) (content unsure)))
)

(defrule right-piece (declare (salience 20))
  (k-cell (x ?x) (y ?y) (content right))
=>
  (assert (hypothesis (x ?x) (y ?y)       (content right)))
  (assert (hypothesis (x ?x) (y (- ?y 1)) (content hor)))
  (assert (hypothesis (x ?x) (y (- ?y 2)) (content unsure)))
  (assert (hypothesis (x ?x) (y (- ?y 3)) (content unsure)))
)

(defrule top-piece (declare (salience 20))
  (k-cell (x ?x) (y ?y) (content top))
=>
  (assert (hypothesis (x ?x) (y ?y)       (content top)))
  (assert (hypothesis (x (+ ?x 1)) (y ?y) (content ver)))
  (assert (hypothesis (x (+ ?x 2)) (y ?y) (content unsure)))
  (assert (hypothesis (x (+ ?x 3)) (y ?y) (content unsure)))
)

(defrule bot-piece (declare (salience 20))
  (k-cell (x ?x) (y ?y) (content bot))
=>
  (assert (hypothesis (x ?x) (y ?y)       (content bot)))
  (assert (hypothesis (x (- ?x 1)) (y ?y) (content ver)))
  (assert (hypothesis (x (- ?x 2)) (y ?y) (content unsure)))
  (assert (hypothesis (x (- ?x 3)) (y ?y) (content unsure)))
)

; More inferences based on the boats
(defrule found-battleship-vertical-1
  (k-cell (x ?x) (y ?y) (content middle))
  (k-cell (x ?x1 &: (eq ?x1 (+ ?x 2))) (y ?y) (content bot))
  ?bc <- (boat-count (boat battleship) (num 0))
=>
  (printout t "[Agent] I have found a battleship in (x: " ?x ", y: " ?y " )" crlf)
  (modify ?bc (num 1))
  (assert (boat-position (boat battleship) (x ?x) (y ?y)))
  (assert (hypothesis (x (- ?x 1)) (y ?y) (content top)))
  (assert (hypothesis (x ?x)       (y ?y) (content ver)))
  (assert (hypothesis (x (+ ?x 1)) (y ?y) (content ver)))
  (assert (hypothesis (x (+ ?x 2)) (y ?y) (content bot)))
)

(defrule found-battleship-vertical-2
  (k-cell (x ?x) (y ?y) (content middle))
  (k-cell (x ?x1 &: (eq ?x1 (- ?x 2))) (y ?y) (content top))
  ?bc <- (boat-count (boat battleship) (num 0))
=>
  (printout t "[Agent] I have found a battleship in (x: " ?x ", y: " ?y " )" crlf)
  (modify ?bc (num 1))
  (assert (boat-position (boat battleship) (x ?x) (y ?y)))

  (assert (hypothesis (x (- ?x 2)) (y ?y) (content top)))
  (assert (hypothesis (x (- ?x 1)) (y ?y) (content ver)))
  (assert (hypothesis (x ?x)       (y ?y) (content ver)))
  (assert (hypothesis (x (+ ?x 1)) (y ?y) (content bot)))
)

(defrule found-battleship-horizontal-1
  (k-cell (x ?x) (y ?y) (content middle))
  (k-cell (x ?x) (y ?y1 &: (eq ?y1 (- ?y 2))) (content left))
  ?bc <- (boat-count (boat battleship) (num 0))
=>
  (printout t "[Agent] I have found a battleship in (x: " ?x ", y: " ?y " )" crlf)
  (modify ?bc (num 1))
  (assert (boat-position (boat battleship) (x ?x) (y ?y)))
  (assert (hypothesis (x ?x) (y (+ ?y 1)) (content right)))
  (assert (hypothesis (x ?x) (y ?y)       (content hor)))
  (assert (hypothesis (x ?x) (y (- ?y 1)) (content hor)))
  (assert (hypothesis (x ?x) (y (- ?y 2)) (content left)))
)

; TODO: There are other cases where we can infer the presence of a battleship
(defrule found-battleship-horizontal-2
  (k-cell (x ?x) (y ?y) (content middle))
  (k-cell (x ?x) (y ?y1 &: (eq ?y1 (+ ?y 2))) (content right))
  ?bc <- (boat-count (boat battleship) (num 0))
=>
  (printout t "[Agent] I have found a battleship in (x: " ?x ", y: " ?y " )" crlf)
  (modify ?bc (num 1))
  (assert (boat-position (boat battleship) (x ?x) (y ?y)))

  (assert (hypothesis (x ?x) (y (+ ?y 2)) (content right)))
  (assert (hypothesis (x ?x) (y (+ ?y 1)) (content hor)))
  (assert (hypothesis (x ?x) (y ?y)       (content hor)))
  (assert (hypothesis (x ?x) (y (- ?y 1)) (content left)))
)

(defrule found-cruiser-horizontal
  (k-cell (x ?x) (y ?y) (content middle))
  (boat-count (boat battleship) (num 1))
  ?bc <- (boat-count (boat cruiser) (num ?n))
  ; rule out the possibility of calling this rule after a battleship
  ; rule has been called
  (not (boat-position (x ?x) (y ?y)))

  ; forces the orientation of the destroyer
  (or
    (hypothesis (x ?x1 &: (eq ?x1 (+ ?x 1))) (y ?y) (content water))
    (hypothesis (x ?x2 &: (eq ?x2 (- ?x 1))) (y ?y) (content water))
    (local-k-per-row (row ?r1 &: (eq ?r1 (+ ?x 1))) (num 0))
    (local-k-per-row (row ?r2 &: (eq ?r2 (- ?x 1))) (num 0))
  )
=>
  (assert (boat-position (boat cruiser) (x ?x) (y ?y)))
  (printout t "[Agent] I have found a cruiser from (x: " ?x ", y: " (- ?y 1) " ) to (x: " ?x ", y: " (+ ?y 1) " )" crlf)
  (modify ?bc (num (+ ?n 1)))
  (assert (hypothesis (x ?x) (y (+ ?y 1)) (content right)))
  (assert (hypothesis (x ?x) (y ?y)       (content hor)))
  (assert (hypothesis (x ?x) (y (- ?y 1)) (content left)))
)

(defrule found-cruiser-vertical
  (k-cell (x ?x) (y ?y) (content middle))
  (boat-count (boat battleship) (num 1))
  ?bc <- (boat-count (boat cruiser) (num ?n))
  (not (boat-position (x ?x) (y ?y)))
  (or
    (hypothesis (x ?x) (y ?y1 &: (+ ?y 1)) (content water))
    (hypothesis (x ?x) (y ?y2 &: (- ?y 1)) (content water))
    (local-k-per-col (col ?c1 &: (+ ?y 1)) (num 0))
    (local-k-per-col (col ?c2 &: (- ?y 1)) (num 0))
  )
=>
  (assert (boat-position (boat cruiser) (x ?x) (y ?y)))
  (printout t "[Agent] I have found a cruiser from (x: " (- ?x 1) ", y: " ?y " ) to (x: " (+ ?x 1) ", y: " ?y " )" crlf)
  (modify ?bc (num (+ ?n 1)))
  (assert (hypothesis (x (- ?x 1)) (y ?y) (content top)))
  (assert (hypothesis (x ?x) (y ?y)       (content ver)))
  (assert (hypothesis (x (+ ?x 1)) (y ?y) (content bot)))
)

; ; if all battleships and cruisers are sunk, then we have found a destroyer 
(defrule found-destroyer-horizontal-right
  (k-cell (x ?x) (y ?y) (content right))
  (or
    (boat-count (boat cruiser) (num 2))
    (hypothesis (x ?x) (y ?y1 &: (eq ?y1 (- ?y 2))) (content water))
  )
  ?bc <- (boat-count (boat destroyer) (num ?n))
  (not (boat-position (x ?x) (y ?y)))
=>
  (modify ?bc (num (+ ?n 1)))
  (assert (boat-position (x ?x) (y ?y) (boat destroyer)))
  (assert (boat-position (x ?x) (y (- ?y 1)) (boat destroyer)))
  (printout t "[Agent] I have found a destroyer from (x: " ?x ", y: " ?y " ) to (x: " ?x ", y: " (- ?y 1) " )" crlf)

  (assert (hypothesis (x ?x) (y ?y)       (content right)))
  (assert (hypothesis (x ?x) (y (- ?y 1)) (content left)))
)

(defrule found-destroyer-horizontal-left
  (k-cell (x ?x) (y ?y) (content left))
  (hypothesis (x ?x) (y ?y1 &: (eq ?y1 (+ ?y 2))) (content water))
  (or
    (boat-count (boat cruiser) (num 2))
    (hypothesis (x ?x) (y ?y1 &: (eq ?y1 (+ ?y 2))) (content water))
  )
  ?bc <- (boat-count (boat destroyer) (num ?n))
  (not (boat-position (x ?x) (y ?y)))
=>
  (modify ?bc (num (+ ?n 1)))
  (assert (boat-position (x ?x) (y ?y)) (boat destroyer))
  (assert (boat-position (x ?x) (y (+ ?y 1))) (boat destroyer))

  (printout t "[Agent] I have found a destroyer from (x: " ?x ", y: " ?y " ) to (x: " ?x ", y: " (+ ?y 1) " )" crlf)
  (assert (hypothesis (x ?x) (y ?y)       (content left)))
  (assert (hypothesis (x ?x) (y (+ ?y 1)) (content right)))
)

(defrule found-destroyer-vertical-top
  (k-cell (x ?x) (y ?y) (content top))
  (hypothesis (x ?x1 &: (eq ?x1 (+ ?x 2))) (y ?y) (content water))
  (or
    (boat-count (boat cruiser) (num 2))
    (hypothesis (x ?x1 &: (eq ?x1 (+ ?x 2))) (y ?y) (content water))
  )
  ?bc <- (boat-count (boat destroyer) (num ?n))
  (not (boat-position (x ?x) (y ?y)))
=>
  (modify ?bc (num (+ ?n 1)))
  (assert (boat-position (x ?x) (y ?y)) (boat destroyer))
  (assert (boat-position (x (+ ?x 1)) (y ?y)) (boat destroyer))

  (printout t "[Agent] I have found a destroyer from (x: " ?x ", y: " ?y " ) to (x: " (+ ?x 1) ", y: " ?y " )" crlf)
  (assert (hypothesis (x ?x) (y ?y)       (content top)))
  (assert (hypothesis (x (+ ?x 1)) (y ?y) (content bot)))
)

(defrule found-destroyer-vertical-bot
  (k-cell (x ?x) (y ?y) (content bot))
  (hypothesis (x ?x1 &:(eq ?x1 (- ?x 2))) (y ?y) (content water))
  (or
    (boat-count (boat cruiser) (num 2))
    (hypothesis (x ?x1 &:(eq ?x1 (- ?x 2))) (y ?y) (content water))
  )
  ?bc <- (boat-count (boat destroyer) (num ?n))
  (not (boat-position (x ?x) (y ?y)))
=>
  (modify ?bc (num (+ ?n 1)))
  (assert (boat-position (x ?x) (y ?y)) (boat destroyer))
  (assert (boat-position (x (- ?x 1)) (y ?y)) (boat destroyer))

  (printout t "[Agent] I have found a destroyer from (x: " ?x ", y: " ?y " ) to (x: " (- ?x 1) ", y: " ?y " )" crlf)
  (assert (hypothesis (x ?x) (y ?y)       (content bot)))
  (assert (hypothesis (x (- ?x 1)) (y ?y) (content top)))
)

; clear hypothesis that are out of bounds
(defrule drop-out-of-bounds (declare (salience 20))
  ?cell <- (hypothesis (x ?x) (y ?y))
  (test (or (or (< ?x 0) (> ?x 10)) (or (< ?y 0) (> ?y 10))))
=>
  (retract ?cell)
)

(defrule remove-cell-on-empty-row (declare (salience 20))
  ?cell <- (hypothesis (x ?x) (content ?content &~ water))
  (k-per-row (row ?x) (num 0))
=>
  (modify ?cell (content water))
)

(defrule remove-cell-on-empty-col (declare (salience 20))
  ?cell <- (hypothesis (y ?y) (content ?content &~ water))
  (k-per-col (col ?y) (num 0))
=>
  (modify ?cell (content water))
)

(defrule remove-uncertain-on-empty-row (declare (salience 20))
  ?cell <- (hypothesis (x ?x) (content unsure))
  (local-k-per-row (row ?x) (num 0))
=> 
  (modify ?cell (content water))
)

(defrule remove-uncertain-on-empty-col (declare (salience 20))
  ?cell <- (hypothesis (y ?y) (content unsure))
  (local-k-per-col (col ?y) (num 0))
=> 
  (modify ?cell (content water))
)

; ============== Firing Strategy ==============

; Don't fire certain hypothesis contents
(defrule filter-known-cell (declare (salience 20))
  (hypothesis (x ?x) (y ?y) (content ?content &~ unsure))
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

(defrule filter-uncertain-col-zero (declare (salience 20))
  (uncertain-per-col (col ?y) (num 0))
  ?fhp <- (fire-hypothesis (y ?y))
=>
  (retract ?fhp)
)

(defrule filter-uncertain-row-zero (declare (salience 20))
  (uncertain-per-row (row ?x) (num 0))
  ?fhp <- (fire-hypothesis (x ?x))
=>
  (retract ?fhp)
)

(defrule filter-already-fired-or-guessed (declare (salience 20))
  (exec (action guess | fire) (x ?x) (y ?y))
  ?fhp <- (fire-hypothesis (x ?x) (y ?y))
=> 
  (retract ?fhp)
)

(defrule generate-fire-when-unsure-on-mid-orientation
  (k-cell (x ?x &: (> ?x 0)) (y ?y &: (< ?y 9)) (content middle))
  (local-k-per-row (row ?x) (num ?nrow &: (>= ?nrow 3)))
  (local-k-per-col (col ?y) (num ?ncol &: (>= ?ncol 3)))
  (not (or
    (hypothesis (y ?y1 &: (or (eq ?y1 (+ ?y 1)) (eq ?y1 (- ?y 1)))) (x ?x) (content water))
    (hypothesis (x ?x1 &: (or (eq ?x1 (+ ?x 1)) (eq ?x1 (- ?x 1)))) (y ?y) (content water))
    (local-k-per-row (row ?r &: (or (eq ?r (+ ?x 1)) (eq ?r (- ?x 1)))) (num 0)) 
    (local-k-per-col (col ?c &: (or (eq ?c (+ ?y 1)) (eq ?c (- ?y 1)))) (num 0))
  ))
=>
  (printout t "[Agent] Trying to disambiguate middle on (x: " ?x ", y: " ?y ")" crlf)
  (assert (fire-hypothesis (x (+ ?x 1)) (y ?y) (prob 1)))
)

(defrule generate-fire-when-unsure-on-right
  (hypothesis (x ?x) (y ?y) (content right))
  (hypothesis (x ?x) (y ?y1 &: (eq ?y1 (- ?y 1))) (content hor))
  (hypothesis (x ?x) (y ?y2 &: (eq ?y2 (- ?y 2))) (content unsure))
=>
  (printout t "[Agent] Trying to disambiguate right on (x: " ?x ", y: " ?y ")" crlf)
  (assert (fire-hypothesis (x ?x) (y ?y2) (prob 1)))
)

(defrule generate-fire-when-unsure-on-left
  (hypothesis (x ?x) (y ?y) (content left))
  (hypothesis (x ?x) (y ?y1 &: (eq ?y1 (+ ?y 1))) (content hor))
  (hypothesis (x ?x) (y ?y2 &: (eq ?y2 (+ ?y 2))) (content unsure))
=>
  (printout t "[Agent] Trying to disambiguate left on (x: " ?x ", y: " ?y ")" crlf)
  (assert (fire-hypothesis (x ?x) (y ?y2) (prob 1)))
)

(defrule generate-fire-when-unsure-on-top
  (hypothesis (x ?x) (y ?y) (content top))
  (hypothesis (x ?x1 &: (eq ?x1 (+ ?x 1))) (y ?y) (content ver))
  (hypothesis (x ?x2 &: (eq ?x2 (+ ?x 2))) (y ?y) (content unsure))
=>
  (printout t "[Agent] Trying to disambiguate top on (x: " ?x ", y: " ?y ")" crlf)
  (assert (fire-hypothesis (x ?x2) (y ?y) (prob 1)))
)

(defrule generate-fire-when-unsure-on-bot
  (hypothesis (x ?x) (y ?y) (content bot))
  (hypothesis (x ?x1 &: (eq ?x1 (- ?x 1))) (y ?y) (content ver))
  (hypothesis (x ?x2 &: (eq ?x2 (- ?x 2))) (y ?y) (content unsure))
=>
  (printout t "[Agent] Trying to disambiguate bot on (x: " ?x ", y: " ?y ")" crlf)
  (assert (fire-hypothesis (x ?x2) (y ?y) (prob 1)))
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
  (printout t "[Agent] Firing (" ?x ", " ?y ", " ?p1 ")" crlf)
  (pop-focus)
)

; ; ============== Finish Phase ==============

; transform the most likely hypothesis into a guess. it matches iff there
; exists an hypothesis such that no other hypothesis exists with a higher content
; value (which is the definition of maximum value)
(defrule transform-sure-to-guess (declare (salience -10))
  ?cell <- (hypothesis (x ?x) (y ?y) (content ?content & ver|hor|bot|top|left|right|sub))
  (status (step ?s) (currently running)) ; the game must be running
  (moves (fires 0))
  (moves (guesses ?g &:(> ?g 0)))
=>
  (assert (exec (step ?s) (action guess) (x ?x) (y ?y)))
  (printout t "[Agent] Placing (sure) guess (x: " ?x ", y: " ?y ", c: " ?content ")" crlf)
  (retract ?cell)
  (pop-focus)
)

(defrule transform-unsure-to-guess (declare (salience -10))
  (not (hypothesis (content ?content & ver|hor|bot|top|left|right|sub)))
  ?cell <- (hypothesis (x ?x) (y ?y) (content unsure))
  (status (step ?s) (currently running)) ; the game must be running
  (moves (fires ?f &: (eq ?f 0)))
  (moves (guesses ?g &:(> ?g 0)))
=>
  (assert (exec (step ?s) (action guess) (x ?x) (y ?y)))
  (printout t "[Agent] Placing (unsure) guess (x: " ?x ", y: " ?y ")" crlf)
  (retract ?cell)
  (pop-focus)
)

(defrule fill-remaining-guesses-with-most-probable
  (not (hypothesis (content ?content &~water)))
  (status (step ?s) (currently running))
  (moves (fires ?f &: (eq ?f 0)))
  (moves (guesses ?g &:(> ?g 0)))
  ?fhp <- (fire-hypothesis (x ?x) (y ?y) (prob ?p1))
  (not (fire-hypothesis (prob ?p2 &: (> ?p2 ?p1))))
=>
  (assert (hypothesis (x ?x) (y ?y) (content unsure)))
  (printout t "[Agent] Generating unsure guess (x: " ?x ", y: " ?y ", p: " ?p1 ")" crlf)
  (retract ?fhp)
)
