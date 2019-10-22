#lang sicp
(define one-through-four (list 1 2 3 4))
(define (test x) (* x x))
(define (list-ref items n)
  (if (= n 0) (car items) (list-ref (cdr items (- n 1))))
  )
