#lang racket
;(make-rat <n> <d>)返回一个有理数，分子是整数n,分母是整数d
;(number <x>) 返回有理数<x> 的分子)
;(denom <x>)返回有理数<x>分母

;有理数加法
(define (add-rat x y)
  (make-rat (+ (* (number x) (denom y))
               (* (number y)(denom x)))
            (* (denom x) (denom y))))
;有理数减法
(define (sub-rat x y)
  (make-rat (- (* (number x)(denom y))(*(number y)(denom x)))
            (* (denom x) (denom y))
            )
  )
;有理数乘法
(define (mul-rat x y)
  (make-rat  (* (number x)(number y))
             (* (denom x)(denom y))
             )
  )
;有理数除法
(define (div-rat x y)
  (make-rat (*(number x)(denom y))(* (denom x)(number y)))
  )
;有理数相等
(define (equal-rat? x y)
  (= (*(number x)(denom y))(*(denom x)(number y)))
  )

;有理数构造
(define (make-rat n d) (let ((g (gcd n d)))(cons (/ n g) (/ d g))))
;获取有理数分子
(define (number x) (car x))
;获取有理数分母
(define (denom x) (cdr x ))

