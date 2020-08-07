#lang Racket
(provide cons-stream)
(provide stream-car)
(provide stream-cdr)
;把计算的行为保存为数据
(define (memo-proc proc)
  (let ((already-run? false) (result false))
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
   (memo-proc  (lambda () exp) ))
  
(define (force delayed-object)
  (delayed-object))
(define (sqr x) (* x x))

(define (cons-stream a b)
             (cons a (delay b))
             )
(define (stream-car x) (car x))
(define (stream-cdr x) (force (cdr x)))

(define (stream-null? stream) (null? stream))
(define (stream-filter pred stream)
  (cond
    ((stream-null? stream) null)
    ((pred (stream-car stream))
     (cons-stream (stream-car stream)
                  (stream-filter pred (stream-cdr stream))
                  )
     )
    (else
     (stream-filter pred (stream-cdr stream))
     )
    )
  )

(define (stream-enumerate-interval low high)
  (if (> low high)
      null
      (cons-stream
       low
       (stream-enumerate-interval (+ low 1) high)
       )
      )
  )
;ref操作
(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))
      )
  )
;(stream-ref one-to-ten 2)
(define (stream-for-each proc s)
  (if(stream-null? s)
     'done
     (begin (proc (stream-car s))
            (stream-for-each proc (stream-cdr s)))
      )
  )
(define (display-line x)
  (newline)
  (display x)
  )
(define (display-stream s)
  (stream-for-each display-line s)
  )


(define one-to-ten (stream-enumerate-interval 1 10))
(define one-to-two (stream-enumerate-interval 1 2))
;利用map内部实现的可变参数功能
(define (stream-map proc . list-of-stream)
  (if (null? (car list-of-stream))
      null
      (cons-stream
       (apply proc (map stream-car list-of-stream))
       (apply stream-map
              (cons proc (map stream-cdr  list-of-stream))
              )
       )
      )
  )
;
(define (show x)
  (display-line x)
  x
  )
;(define x (stream-map show (stream-enumerate-interval 0 10)))
(define sum 0)
(define (accum x)
  (set! sum (+ x sum))
  sum
  )
;(define seq (stream-map accum (stream-enumerate-interval 1 20)))
;(define y (stream-filter even? seq))
;(define z (stream-filter (lambda (x) (= (remainder x 5) 0)) seq))
;(stream-ref y 7)
;(display-stream z)








