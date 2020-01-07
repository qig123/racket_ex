#lang racket
(define (make-withdraw balance)
  (lambda (amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount)) balance)
        ("Insufficient funds")
        )
    )
  )
;过程相等 /error 带参数
(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance
               )
        ("Insufficient funds")
        )
    )
  (define (deposit amount)
    (set! balance  (+ balance amount))
    balance
    )
  (define (dispatch m)
    (cond ( (eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknow request -- make-account" m))
          )
    )
  dispatch
  )
(define (t e) (error "is err" e))
(define (x ) (+ x 5) )


