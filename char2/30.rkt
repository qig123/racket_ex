#lang racket
(define new-withdraw
  (let ((balance 100))
    (lambda (amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance
                 )
           ("error")
          )
      )
    )
  )
(define A new-withdraw )

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
 
  (define (dispatch  m)
    (cond ( (eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknow request -- make-account" m))
          )
    )
  dispatch
  )
(define (t e) (error "is err" e))
(define (x ) (+ x 5) )
;
(define (make-account2 balance pwd )
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
   (define (dipatch2 p m)
    (cond ( (eq? p pwd) (dispatch m) )
          (else "Incorrect password")
          )
    )
  (define (dispatch m )
    (cond ( 
           (eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknow request -- make-account" ))
          )
    )
   dipatch2
  )
(define acc (make-account2 100 '123456))
;test data ((acc '123456 'withdraw) 40)  ((acc '1234566 'deposit) 40)

(define (make-account3 balance pwd )
  (define maxinput 7)
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
   (define (dipatch2 p m)
    (cond ( (eq? p pwd) (dispatch m) )
          (else "Incorrect password")
          )
    )
  (define (dispatch m )
    (cond ( 
           (eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknow request -- make-account" ))
          )
    )
   dipatch2
  )


