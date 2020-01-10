#lang racket
; midpoint
;ex (print-point (midpoint-segment (make-segment (make-point 0 0 ) (make-point 1 1 ))))


(define (midpoint-segment s)
   (make-point ( mid  (x-point (start-segment s) ) (x-point (end-segment s)) )
               ( mid  (y-point (start-segment s) ) (y-point (end-segment s)))
               )
  )
(define (distance-segment x y)
   (sqrt ( + (sq ( - (x-point x) (x-point y) )) (sq ( - (y-point x) (y-point y) ) )))
  )
(define (sq x) (* x x))

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


(define (r-circumference r)
   (+ (* 2 (distance-segment   (start-segment (w-rectangle r))   (end-segment (w-rectangle r))  ) )
      (* 2 (distance-segment   (start-segment (h-rectangle r))   (end-segment (h-rectangle r))  ))
      )
  )
(define (r-area r)
   (* (w-rectangle r) (h-rectangle r) )
  )



(define (mid x y) (/ (+ x y) 2))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display "," )
  (display (y-point p))
  (display ")")        
  )