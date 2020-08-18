#lang racket
;ex 3.16
(define (count-pairs x)
  (if  (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1
      )
  ))
;tes
(define x '(  (c d ) ( b f)  (  e f)))
(define y '( a b c))