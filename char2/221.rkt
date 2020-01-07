#lang racket
(define (square-list items)
  (if (null? items)
      null
      (cons  (sq (car items))  (square-list (cdr items)))
      )
  )
(define (sq x) (* x x))
(define lt (list 1 2 3))

(define (map proc items)
  (if (null? items)
      null
      (cons (proc (car items))  (map proc (cdr items)))
      )
  )

