#lang racket
; midpoint
(define (midpoint-segment s)
   (make-point ( mid  (x-point (start-segment s) ) (x-point (end-segment s)) )
               ( mid  (y-point (start-segment s) ) (y-point (end-segment s)))
               )
  )

(define (make-segment s1 s2)
  (cons s1 s2)
  )
(define (start-segment s)
  (car s)
  )
(define (end-segment s)
  (cdr s)
  )

(define (make-point x y )
  (cons x y)
  )
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (make-rectangle w h) (cons w h))
(define (w-rectangle r) (car r))
(define (h-rectangle r) (cdr r))

(define (mid x y) (/ (+ x y) 2))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display "," )
  (display (y-point p))
  (display ")")        
  )