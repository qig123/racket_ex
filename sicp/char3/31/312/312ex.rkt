#lang racket
(require "312demo.rkt")
;这里可以再抽象一下,用point
(define x1 0)
(define x2 0)
(define y1 0)
(define y2 0)
(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))
    )
  )
;这里产生随机数的问题,用random-in-range产生的随机数不够好,比如5到8, 只有6,7这2个数,我们要想办法让产生的随机数足够多
;利用(random)产生浮点数的随机,number= low +(random)*(high -low)
(define (random-in-range2 low high)
  (let ((range (- high low)))
    (+ low (* (random) range ))
    )
  )
(define in-region?
  (lambda ()
       ( <= ( + (expt (random-in-range2 x1 x2) 2) (expt (random-in-range2 y1 y2) 2)) (expt ( / (- x2 x1) 2) 2)))
    )
(define in-cricle?
  (lambda ()
       ( <= ( + (expt (random) 2) (expt (random) 2)) 1)
    ))

(define (estimate-integral p  x1-input x2-input y1-input y2-input  trials )
  (begin  (set! x1  x1-input)
          (set! x2  x2-input)
          (set! y1  y1-input)
          (set! y2  y2-input)
          ( * (* (- x2 x1) (- y2 y1)) (monte-carlo trials p))
          )
  )
;test (estimate-integral in-cricle?  0 10000 0 10000  100000 )
; (estimate-integral in-cricle?  2 8 4 10  10000 )
;( /  (estimate-integral in-cricle?  2 8 4 10  1000000 ) 9.0 )
(define (estimate-pi2 trials)
    ( * 4.0 (estimate-integral in-cricle?  0 1 0 1  trials ))
  )
;Ex3.6 Design a new rand procedure

(define (rand )
  (define current-value 1 )
  (define (generate)
    (lambda () (begin (set! current-value (rand-update current-value)) current-value) )
    )
  (define reset 
     (lambda (new)
       (set!  current-value new)
       )
    )
  
  (define (dispatch m)
   (cond
      ((eq? m 'generate) ((generate)) )
      ((eq? m 'reset)  reset  )
      (else
       (error "Input Error")
       )
      ))
  dispatch
  )

(define rand-object1 (rand))
;(rand-object1 'generate)
;Test  (rand 'generate)
(define current-value2 1 )
(define reset 
     (lambda (new)
       (begin (set!  current-value2 new) new)
       )
    )
 (define (generate)
    (lambda () (begin (set! current-value2 (rand-update current-value2)) current-value2) )
    )
(define (rand2 m)
  (cond
     ((eq? m 'generate) ((generate)) )
     ((eq? m 'reset)  reset  )
     (else
       (error "Input Error")
       )
    )
  )
;一个很好的例子, 用let创建新环境,但是新环境里面的state,要再全个方法使用,只能把方法写在内部
 (define rand3 
   (let ((x 1)) 
     (define (dispatch message) 
       (cond ((eq? message 'generate) 
               (begin (set! x (rand-update x)) 
                      x)) 
             ((eq? message 'reset) 
               (lambda (new-value) (set! x new-value))))) 
     dispatch)) 