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
(define entry-f
  (lambda (name) name)
  )
(define lookup-in-entry-help
  (lambda (name names values entry-f)
    (cond
      ( ( begin  (print (car names)) (display "\n") (eq? (car names) name)) (car values))
      (else
       (lookup-in-entry-help name (cdr names) (cdr values) (lambda () 5))
       )
      )
    )
  )
;(  lookup-in-entry  entry1  'entree entry-f  )