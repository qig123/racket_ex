#lang racket
;add-rat is function, number x 分子
；n1/d1+n2/d2=(n1d2+n2d1)/d1d2
(define (add-rat x y)
  (make-rat  (+ (* (number x) (denom y))
                   (*(number y) (denom x)))
             (* (number x) (number y)))
             )
  