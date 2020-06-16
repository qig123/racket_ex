#lang Racket
(define (self-evaluating? exp)
  (cond ((number? exp) true)
        ((string? exp) true)
        (else false)
        )
  )
;疑惑，lisp里面有variable这d
(define (variable? exp) (symbol? exp))
(define (quoted? exp) (tagged-list? exp 'quote))
(define (tagged-list? exp tag)
  (if (pair? exp)
      (eq? (car exp) tag)
      false
      )
  )