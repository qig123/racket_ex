#lang racket
;ex 3.16
(define (count-pairs2 x)
  (if  (not (pair? x))
      0
      (+ (count-pairs2 (car x))
         (count-pairs2 (cdr x))
         1
      )
  ))
;tes
(define x '(  (c d ) ( b f)  (  e f)))
(define y '( a b c))
(define s (list 'a 'b 'c))
(define z1 (cons s s))
;ex3.17Devise a correct version of the count-pairs procedure of exercise 3.16 that
;returns the number of distinct pairs in any structure.
(define (count-pairs x  count-list)
  (cond
    ( (not (pair? x))  0)
    ( (in-list? x count-list) 0)
    (else
      (+ (count-pairs (car x) (list count-list x) )
         (count-pairs (cdr x) (list count-list x) )
         1
         )
     )
    )
  )
(define (in-list? target l)
  (cond
    ((null? l) #f)
    (else
       (or (eqlist? target (car l)) (in-list? target (cdr l)))
     )
    )
  )
(define (eqlist? x y)
   (cond
     (( and (null? x) (null? y) ) #t)
     ((or (null? x) (null? y)) #f)
     (else
      (and ( eq? (car x) (car y)) (eqlist? (cdr x) (cdr y)))
      )
     )
  )
;
(define A  (list (list 1 3) (list 1) (list 5)))
(define B '(1))