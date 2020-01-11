#lang racket
(define (rand m)
  (define x 100)
  (cond ( (eq? m 'generate)    
      (set! x (random 1 100))
      x
      )
      ((eq? m 'reset)
       (lambda (new) (set! x new) ))
      (else (error "error input"))
     )
        
    
  )
;(rand 'generate)
;((rand 'reset) 42 )