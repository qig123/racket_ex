#lang racket
;序对的过程表达2
(define (cons2 x y)
  (lambda (m) (m x y))
  )
(define (car z) (z (lambda (p q) p)))
(define (cdr z) (z (lambda (p q)q)))
;请证明，如果将a和b的序对表示为乘积2^a ,3^b对应的整数，我们就可以只用非负整数和算术运算
;表示序对，请给出对应的过程cons car cdr的定义
(define (cons3 a b)(* (expt 2 a) (expt 3 b)))
;(define (cons3 a b) (lambda (a b) (* (expt 2 a) (expt 3 b))))
;(define (car3 z)( log((/ z (expt 3 b)) 2 )))
(define (car3 z) (if (= 0 (remainder z 2)) (+ 1 (car3 (/ z 2))) 0) )

