#lang racket
(define n -1)
(define (f x)
    
   (cond ((= x 0) (+ n x))
        
         (else (begin (set! n (- x 1)) x))
  )
  )
; (else (begin ( (set! x (- x 2)) (+ x 0) )))
;(+ (f 0) (f 1))  (+ (f 1) (f 0))

(define (f2 x)
    
   (cond ((= x 0) (+ 0 x))
        
         (else (begin (set! x (- x 1)) (+ x -1)))
  )
  )
;(+ (f2 0) (f2 1))  (+ (f2 1) (f2 0))
(define f3
  (lambda (first-value)
    (set! f3 (lambda (sec-value) 0))
   first-value
    )
  )