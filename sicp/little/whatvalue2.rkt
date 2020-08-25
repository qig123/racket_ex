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
(define T1  '( ((entree dessert)
(spaghetti spumoni))
((appetizer entree beverage)
(food tastes good))) )
(define lookup-in-entry
  (lambda (name entry entry-f)
    (lookup-in-entry-help name
                          (first entry)
                          (second entry)
                          entry-f)
    )
  )
(define entry-f
  (lambda (name) name)
  )
(define lookup-in-entry-help
  (lambda (name names values entry-f)
    (cond
      ((null? names) (entry-f 'fail))
      ( ( begin  (print (car names)) (display "\n") (eq? (car names) name)) (car values))
      (else
       (lookup-in-entry-help name (cdr names) (cdr values) entry-f)
       )
      )
    )
  )
;(lookup-in-entry-help  'entree (first entry1) (second entry1) (lambda (x) x))
;(  lookup-in-entry  entry1  'entree entry-f  )
;(  lookup-in-table 'entree T1   (lambda (x) x) )
;(lookup-in-entry 'entree (car T1)  (lambda (x) x))
(define extend-table cons)
(define lookup-in-table
  (lambda (name table table-f)
          (cond
            ((null? table) (table-f name))
            (else
             (lookup-in-entry name (car table) (lambda (name) (lookup-in-table name (cdr table) table-f)))))
             )
            )
          
  
