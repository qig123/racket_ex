#lang racket
;add-rat is function, number x 分子
;n1/d1+n2/d2=(n1d2+n2d1)/d1d2
(define (add-rat x y)
   (print-rat   (format-rat (make-rat  (+ (* (number x) (denom y))
                   (*(number y) (denom x)))
             (* (denom x) (denom y))) ))

             )

;let use
(define (make-rat x y) (let ((g (gcd x y)))(cons (/ x g) (/ y g))))
(define (number s) (car s))
(define (denom y) (cdr y))

(define (print-rat x)
  (newline)
  (display (number x))
  (display "/")
  (display (denom x))
  )
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))
      )
  )
;define make-art version ,it can handle - flag
;input ,when the art is -, make number is -

(define (format-rat x)
   (if (< (* (denom x) (number x)) 0)
       (make-rat (- 0 (abs (number x))) (abs (denom x)))
       x
       ) 
  )
(define (abs x)
  (if (< x 0) (- x) x)
  )

  