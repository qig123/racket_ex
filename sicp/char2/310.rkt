#lang racket
(define (make-withdraw initial-amount)
  (let ((balance initial-amount))
    (lambda (amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance
                 )
          "Insufficient funds"
          )
      )
    )
  )

(define (make-withdraw2 initial-amount)
    ((lambda (balance)
    (lambda (amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance
                 )
          "Insufficient funds"
          )
      ) ) initial-amount)
    
  )
(define w1 (make-withdraw2 100) )
(define s1 (make-withdraw 100) )