#lang racket
;分析序对的概念,如果一个东西，能把2个对象组合在一起，而且这个东西能分别取到这2个对象，
;那么这个东西可以叫 序对
;不用任何数据结构，只使用过程就能实现序对
(define (cons2 x y)
  (define (dispatch m)
    (cond ((= m 0) x)((= m 1) y)(else (error "Argument not 0 or 1 --
CONS" m)))

    )
  dispatch
  

  )

(define (car2 z) (z 0))
(define (cdr2 z)(z 1))