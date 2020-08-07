#lang racket
(define (cons x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else ("error ") )
          )
    ) dispatch
  )

(define (car z) (z 0))
(define (cdr z) (z 1))



(define sq (lambda (x) (* x x)))        

(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x))))
  )

