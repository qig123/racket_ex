#lang scheme (require rnrs/base-6) (require rnrs/mutable-pairs-6) 
(define (append x y)
  (if (null? x)
      y
      (cons (car x) (append (cdr x) y))
      )
  )
(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x)))
  )

(define (append! x y)
  (set-cdr!  (last-pair x) y)
  x
  )
(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (append x y))
(define w (append! x y))


(define list1 (list 1 2))
(define list2 (list 5 3 4))