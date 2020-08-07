#lang Racket
 (define (memo-proc proc)
   (let ((already-run? false)( result false))
     (lambda ()
       (if (not already-run?)
           (begin (set! result (proc))
                  (set! already-run? true)
                  result
                  )
            result
           )
       )
     )
   )
(define (delay exp)
  (memo-proc (lambda () exp))
  )

(define (stream-car stream) (car stream))
(define (stream-cdr stream) (force (cdr stream)))


(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))
      )
  )

(define (force delayed-object)
  (delayed-object)
  )
(define (cons-stream a b) (cons a (delay b)))
(define (stream-enumerate-interval low high)
  (if (> low high)
      null
      (cons-stream
        low  
        (stream-enumerate-interval (+ low 1) high)
       )
      )
  )
(define the-empty-stream '())
(define (stream-null? stream) (null? stream) )
;习题3.50




