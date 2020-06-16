#lang Racket
(define add1
  (lambda (n)
    (+ n 1)
    )
  )
(define sub1
  (lambda (n)
    (- n 1)
    )
  )
(define plus
  (lambda (n m)
    (cond
      ((zero? m) n)
      (else (add1 (plus n (sub1 m))))
      )
    )
  )
(define 0-
  (lambda (n m)
    (cond
      ((zero? m) n)
      (else (sub1 (0- n (sub1 m))))   
      )
    )
  )
(define addtup
  (lambda (tup)
    (cond
      ((null? tup) 0)
      (else
       (plus (car tup) (addtup (cdr tup)))
       )
      )
  ))
(define mul2
  (lambda (n m)
      (cond
        ((zero? m) 0)
        (else (plus n (mul2 n (sub1 m))))
        )
      )
  )