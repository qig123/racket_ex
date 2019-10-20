#lang racket
;zero是一个过程，返回一个过程(接收过程为参数,返回另外一个过程)
(define zero (lambda (f) (lambda (x) x)))
;add-1是一个过程，以n为参数，返回一个过程(参数是过程，返回一个过程(x为参数))
(define (add-1 n) (lambda (f) (lambda (x) (f ((n f) x)))  ))

;add-1(zero)的值就是one
;首先是zero对f求值 ,得到一个过程(lambda (x) x)
;然后上一步得出的过程，再对x求值，这样得到的值是x
;这时候变为((add-1 zero) (lambda (f)  (lambda (x) (f x))))
(define one (lambda (f)  (lambda (x) (f x))))
;two==(add-1 one)
;首先是one对f求值 ,得到一个过程(lambda (x) (f x))
;然后上一步得出的过程，再对x求值，这样得到的值是 (f x)
(define two (lambda (f) (lambda (x) (f (f x)))))
