#lang Racket
(define new-withdraw
        (let ((balance 100))
          (lambda (amount)
            (cond
              ((>= balance amount)
               (begin (set! balance (- balance amount))
                      balance
                      )
               )
              (else "Insufficient funds")
              )
            )
          )
        )