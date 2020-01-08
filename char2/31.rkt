#lang racket
;make-acco3.1
(define (make-accumulator sum)
 (lambda (n)
   (begin (set! sum (+ sum n) ) sum)
   )
  )
(define A (make-accumulator 5))
;3.2
(define (make-monitored f)
  (define sum 0)
  
  (lambda (mf)
    (cond ((eq?  mf 'how-many-calls?) sum)
           (else   (begin (set! sum (+ sum 1) ) (f mf)))
          )
    )
)
  
(define s (make-monitored sqrt))