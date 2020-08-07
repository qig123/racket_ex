#lang racket
(provide monte-carlo )
(provide rand-update )
(define random-init 1)
(define (rand-update x)
  (+ (* x 2) 3)
  )
(define rand
  (let ((x random-init))
    (lambda () (begin (set! x (rand-update x)) x) )
    )
  )
(define (estimate-pi trials)
  (sqrt (/ 6.0 (monte-carlo trials cesaro-test)))
  )
(define (cesaro-test)
  (=  (gcd (rand) (rand)) 1)
  )
(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond
      ((= trials-remaining 0) (/ trials-passed trials))
      ((experiment) (iter (- trials-remaining 1) (+ trials-passed 1)))
      (else
       (iter (- trials-remaining 1) trials-passed)
       )
      )
    )
  (iter trials 0)
  )
;-------------------------------
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







