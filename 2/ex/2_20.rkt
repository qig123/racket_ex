#lang racket
;
;(same-parity  2 3 4 5 6 7)
;  (cons (car z) (helper x (cdr z)) )
(define (even? x)
  (= (modulo x 2) 0)
  )
(define (same-parity  x . z)
  (define (helper x z even)   
    (if even
        (cond
          ((null? z) '())
          ((even? (car z))  (cons (car z) (helper x (cdr z) even) )  )
          (else
           (helper x (cdr z) even)
           )          
          )
        (cond
          ((null? z) '())
          ((even? (car z)) (helper x (cdr z) even)  )
          (else
            (cons (car z) (helper x (cdr z) even)) 
           )          
          )        
    ))
  (helper x (cons x z) (even? x))
  )