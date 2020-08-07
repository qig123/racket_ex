#lang racket
(define (make-account balance pwd )
  
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
   (define (dipatch2 p m )
    (cond
      ((eq? p pwd)  (dispatch m) )
          (else "Incorrect password")
          )
    )
  (define (dispatch m )
    (cond   
           ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknow request -- make-account" ))
          )
    )
     dipatch2
  )
(define (make-joint acc pwd newpwd)

   (lambda (p m)
     (cond ((eq? newpwd p)  (acc pwd m))
           (else "error newpwd error")
           )
     )
  )
(define peter-acc (make-account 100 '123456))
(define paul-acc
 (make-joint peter-acc '123456 '12)
  )
;test data ((acc '123456 'withdraw) 40)  ((acc '1234566 'deposit) 40)
;(acc '123456 40) ;(make-joint acc '123456 newpwd)
;((peter-acc '123456 'withdraw) 40)
;((paul-acc '12 'withdraw) 40)