#lang racket
(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))
  ))
(define X   (mcons 'a  (mcons 'b null)))
(define Y  ( mcons 'c (mcons 'd null)))
(define (append! x y)
  (set-mcdr! (last-pair! x) y)
  x
  )
(define (last-pair! x)
  (if (null? (mcdr x))
      x
      (last-pair! (mcdr x))
  ))
(define append
  (lambda (x y)
    (if (null? x) y
        (mcons (mcar x) (append (mcdr x) y))
        )
    )
  )
(define (make-cycle x)
  (set-mcdr! (last-pair! x) x )
  x
  )
;if x =(a b)
(define z2 (mcons (mcons 'a (mcons 'b '()))   (mcons 'a (mcons 'b '())) ))
(define s (mcons 'a (mcons 'b '())))
(define z1 (mcons s s))


(define z4 (mcons s (mcdr s)))
;(define z5 (mcons s z5))
(define (set-to-wow! x)
  (set-mcar! (mcar x) 'wow)
  x; a='wow
  )
(define (count-pairs x)
  (if  (not (mpair? x))
      0
      (+ (count-pairs (mcar x))
         (count-pairs (mcdr x))
         1
      )
  ))
(define z3 (mcons 'a (mcons 'b (mcons 'c null))))
(define z5 (mcons z3  z3))
(define z-never (make-cycle z3) )




