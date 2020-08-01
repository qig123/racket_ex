#lang racket
;an accumulator is a procedure that is called repeatedly
;with a single numeric argument and accumulates its arguments
;into a sum.Each time it is called, it returns the current
;accumulated sum.Write a procedure make-accumulator that
;generates accumulators, each maintaining an independent sum.
;The input to make-accumulator should specify the initial
;value of the sum;
;for example
;(define A (make-accumulator 5))
;(A 10) 15
;(A 10) 25
(define ( make-accumulator sum)
  (lambda (input)
    (begin (set! sum (+ sum input)) sum)))
(define A (make-accumulator 5))
;-----------------------------------------
;In software-testing applications, it is useful to be able to count the number of times a given procedure is called during the course of a computation.
; Write a procedure make-monitored that takes as input a procedure, f, that itself takes one input.
;The result returned by make-monitored is a third procedure, say mf,
;that keeps track of the number of times it has been called by maintaining an internal counter.
;If the input to mf is the special symbol how-many-calls?, then mf returns the value of the counter.
;If the input is the special symbol reset-count, then mf resets the counter to zero.
;For any other input, mf returns the result of calling f on that input and increments the counter.
;For instance, we could make a monitored version of the sqrt procedure:
;(define s (make-monitored sqrt))
;(s 100) 10
;(s 'how-many-calls?)
(define (make-monitored f)
  (define acc 0)
  (define (counter)
     (begin (set! acc (+ acc 1)) acc) 
    )
  (define (mf m)
    (cond
    ((eq? m 'how-many-calls?) acc)
    ((eq? m 'reset-count) (begin (set! acc 0) acc))
    (else
     (begin (counter) (f m))
     ))
    )
  mf
  )
(define s (make-monitored sqrt))
;------------------------------
;Modify the make-account procedure so that is created password-protected accounts.That is, make-account should take a symbol as an additional argument, as in
;(define acc (make-account 100 'secret-password))
;The resulting account object should process a request only if it is accompanied by the password with which the account was created, and should otherwise return a complaint:
;((acc 'secret-password 'withdraw) 40)  60
;((acc 'some-ohter-passwrod 'deposit ) 50)  "Incorrect password"
(define (make-account balance password)
  (define error-count 0)
  (define max-error 7)
  (define (counter-error)
     (begin (set! error-count (+ error-count 1)) error-count) 
    )
  (define (morethan?) (>= error-count max-error) )
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
                 balance
                 )
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  
  (define (dispatch input-password m)
    (cond
      (( not(eq? input-pas sword password ) )  (begin (counter-error) (if (morethan?)  (error "call-the-cops")   (error "Incorrect password")) ))
      (else
       (begin (set! error-count 0 )
              (cond
                 ((eq? m 'withdraw) withdraw)
                 ((eq? m 'deposit) deposit)
                 (else
                  (error "Unkonw request -- MAKE-ACCOUNT" m))))
                )
              )
       ) 
  dispatch)
(define acc (make-account 100 'secret-password))
;-------------------------------------------
;modify the make-account procedure of exercise 3.3 by adding antoher
;local state variable so that, if an account is accessed more than
;seven consecutive times with an incorrect password, it invokes
;the procedure call-the-cops
;-- See the answer to the previous question --

