#lang Racket
;define递归的版本
 (define fac
   (lambda (n)
      (cond
      ((= 0 n) 1)
      (else
       (* n (fac (- n 1)))
       )
      )
     )
   )
;匿名递归的一个例子
  (lambda (n self )
    (cond
      ((= 0 n) 1)
      (else
       (* n (self (- n 1) self))
       )
      )
  )
;匿名递归的一个例子:求list长度
 (lambda (l self)
    (cond
     ((null? l) 0)
     (else (+ 1 (self (cdr l) self)))))
;改为一个参数
(lambda (self)
  (lambda (l)
    (cond
      ((null? l) 0)
      (else (+ 1 ((self self) (cdr l))))
      )
    )
  )
;上述lambda应用到自身就会产生一个能计算list的过程
((lambda (self)
  (lambda (l)
    (cond
      ((null? l) 0)
      (else (+ 1 ((self self) (cdr l))))
      )
    )
  )
 (lambda (self)
  (lambda (l)
    (cond
      ((null? l) 0)
      (else (+ 1 ((self self) (cdr l))))
      )
    )
  )
 )
;f_gen
;变形(self-self  用g代替)
((lambda (self)
  (lambda (l)
    (cond
      ((null? l) 0)
      (else (+ 1 ((self self) (cdr l))))
      )
    )
  )
 (lambda (self)
   ((lambda (g)
  (lambda (l)
    (cond
      ((null? l) 0)
      (else (+ 1 (g (cdr l))))
      )
    )) (self self))
  )
 )

(lambda (v) ((f f) v))



 
