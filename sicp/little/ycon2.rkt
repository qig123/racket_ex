#lang Racket
;令为P
(lambda self
   (lambda (n)
      (cond
      ((= 0 n) 1)
      (else
       (* n (self (- n 1)))))))

; (self self)
((lambda self
   (lambda (n)
      (cond
      ((= 0 n) 1)
      (else
       (* n (self (- n 1)))))))
 (lambda self
   (lambda (n)
      (cond
      ((= 0 n) 1)
      (else
       (* n (self (- n 1)))))))
 )
;(P (self self))=  power_gen
; 不动点f: power_gen(power_gen)
