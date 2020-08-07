#lang racket
;make joint accounts
;Define a procedure make-joint that ..
;Make-joint should take three arguments.The first is a password-protected
;The Second argument must match the password
(define (make-account balance password)
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
       (( not(eq? input-password  password ) )  (error "Incorrect password") )
         ((eq? m 'withdraw) withdraw)
         ((eq? m 'deposit) deposit)
         (else
              (error "Unkonw request -- MAKE-ACCOUNT" m)))) 
  dispatch)
(define peter-acc (make-account 100 'open-sesame))
(define (make-joint account operation-password new-password )
  (define (dispatch  input-password  m)
  (cond
    ((not (eq? operation-password 'open-sesame )) (error "Incorrect password"))
    ((not (eq? input-password 'rosebud )) (error "Incorrect password"))
    ((eq? m 'withdraw) (peter-acc operation-password 'withdraw ))
    ((eq? m 'deposit) (peter-acc operation-password 'deposit))
    (else
       (error "Unkonw request -- MAKE-ACCOUNT" m)))) 
  dispatch
  )
(define paul-acc (make-joint peter-acc 'open-sesame 'rosebud))
;Test ((peter-acc 'open-sesame 'withdraw) 40)
;((paul-acc 'rosebud 'withdraw) 40)
;----------------------
;(+ (f 0) (f 1)) =0 ----0+0=0===f0=0 f1=0-----
;(+ (f 1) (f 0)) =1=====1+0=1====f1=0 f0=1------
;得出f1=0, f0要有2个状态
(define (g )
  (define s 0)
  (define (h x)
      (if (= x 1) (begin (set! s 1) 0) (+ s x))
    )
   h
  )
(define f (g))  \
     
;---------
(define f2
    (lambda (first-value)
        (set! f2 (lambda (second-value) 0))
        first-value))


