#lang racket
; object is procedure
(define (make-simplified-withdraw balance)
  (lambda (amount)
    (set! balance (- balance amount))
    balance
    )
  )
(define W (make-simplified-withdraw 25))
(define (make-decrementer balance)
  (lambda (amount)
    (- balance amount)
    )
  )

(define D (make-decrementer 25))

