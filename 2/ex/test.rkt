#lang racket
(define (first-denomination kinds-of-coins)
  (cond
    ((= kinds-of-coins 1) 1)
    ((= kinds-of-coins 2) 5) 
    )
  )


(define (cc amount kinds-of-coins)
  (cond
    ((= amount 0) 1)
    ((or (< amount 0) (= kinds-of-coins 0)) 0)
    (else
     (
      + (cc amount (- kinds-of-coins 1))
        (cc (- amount  (first-denomination kinds-of-coins))  kinds-of-coins )
      )
     )
    )
  )
;(count-change 100)
(define (count-change amout)
  (cc amout 2)
  )