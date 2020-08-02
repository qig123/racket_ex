#lang Racket
(require "friends.rkt")
(require "star.rkt")
(require "lambda.rkt")
(define set1 '(1 2 4 5))
(define set2 '(3 7))
(define et (build set1 set2))
(define entry1 '((appetizer entree beverage) (food tastes good)))
(define A '(((entree dessert) (spaghetti spumoni))
            ((appetizer entree beverage) (food tastes good))
            ))
(define B '(((y z) ((8) 9)) ))
(define lookup-in-entry
  (lambda (name entry entry-f)
    (lookup-in-entry-help name
                          (first entry1)
                          (second entry1)
                          entry-f)
    )
  )
(define lookup-in-entry-help
  (lambda (name names values entry-f)
    (cond
      ( (or (null? names )  (null? values)) 5)
      ((eq? name (car names)) (car values) )
      (else
      (lookup-in-entry-help name (cdr names) (cdr values) entry-f))
      )
    )
  )
(define f
  (lambda (x)
    (* x x)
    ) 
  )
;(lookup-in-entry 'entree et f)
(define lookup-in-table
  (lambda (name table table-f)
    (cond
     ((null? table) (table-f name))
     ;((atom?  (lookup-in-table-help name (first (car table)) (second (car table)) table-f)) (car  (second (car table)) ))
     (else (lookup-in-entry name (car table) (lambda (name) (lookup-in-table name (cdr table) table-f))))
     )
    )
  )
      

(define lookup-in-table-help
  (lambda (name names values table-f)
    (cond
      ( (null? names )   (table-f name))
      ((eq? name (car names) ) (car values) )
      (else
      (lookup-in-table-help name (cdr names) (cdr values) table-f)))))
;(cons  ( cons 'a ( cons 'b  (cons 'c (quote ())) ))  (quote ()) )
(define atom-to-action
  (lambda (e)
    (cond
      ((number? e) *const)
      ((eq?  e #t) *const)
      ((eq? e #f) *const)
      ((eq? e (quote cons)) *const)
      ((eq? e (quote car)) *const)
      ((eq? e (quote cdr)) const)
      ((eq? e (quote null?)) *const )
      ((eq? e (quote eq?) ) *const)
      ((eq? e (quote atom?) ) *const)
      ((eq? e (quote zero?) ) *const)
      ((eq? e (quote add1?) ) *const)
      ((eq? e (quote sub1?) ) *const)
      ((eq? e (quote number?) ) *const)
      (else
       *identifier
       )
      )
    )
  )
(define *const
  (lambda (e talbe)
    (cond
      ((number? e) e)
      ((eq? e #t) #t )
      ((eq? e #f) #f)
      (else
       (build (quote primitive) e)
       )
      )
    )
  )
(define list-to-action
  (lambda (e)
    (cond
      ((atom? (car e))
       (cond
         ((eq? (car e) (quote quote)) *quote)
         ((eq? (car e) (quote lambda)) *lambda)
         ((eq? (car e) (quote cond)) '*cond)
         (else
          ('*application)
          )
         )
       )
      (else
       ('*application)
       )
      )
    )
  )
(define value
  (lambda (e)
    (meaning e (quote ()))
    )
  )
(define meaning
  (lambda (e table)
    ((expression-to-action e) e table)
    )
  )
(define expression-to-action
  (lambda (e)
    (cond
      ((atom? e) (atom-to-action e))
      (else
       (list-to-action e)
       )
      )
    )
  )
(define *quote
  (lambda (e table)
    (text-of e)
    )
  )
(define text-of
  (lambda (e)
    second
    )
  )
(define *identifier
  (lambda (e table)
    (lookup-in-table e table initial-table)
    )
  )
(define initial-table
  (lambda (name)
    (car (quote()))
    )
  )
(define *lambda
        
  (lambda (e table)
    (build (quote non-primitive) (cons table (cdr e)))
    )
  )
(define talbe-of first)
(define formals-of second)
(define body-of third)

