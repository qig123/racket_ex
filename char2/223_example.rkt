#lang Racket
(define x (cons (list 1 2) (list 3 4)) )
;叶子的数量
(define (count-leaves x)
  (cond ((null? x) 0)
        (else
         (cond ( (not (pair? x)) 1)
               ( else(+ (count-leaves (car x))
                        (count-leaves (cdr x)))))
               
              )
        )
  )
(define fib
  (lambda (n)
    (cond ((= n 1) 1)
          ((= n 2) 1)
          (else (+ (fib (- n 1)) (fib (- n 2))) )
          )
    )
  )
;所有偶数的fib
(define (make-list n)
  (cond
    ((= n 0) null)
    (else
     (cons n  (make-list (- n 1) ) )
     ))
  )

(define (fore l )
  (cond
    ((null? l) null)
    (else
     (cond
       ((not (even? (car l))) (fore (cdr l)) )
       (else
        (cons (car l) ( fore (cdr l)))
             )
       )
     )
    )
  )
;构造list
(define (enumerate-interval low high)
  (cond
    ((> low high) null)
    (else
     (cons low (enumerate-interval (+ low 1) high)))
     ) 
  )
;过滤满足某个谓词的元素
(define (filter p sequence)
  (cond
    ((null? sequence) null)
    (else
     (cond
       ( (not (p (car sequence))) (filter p (cdr sequence)))
       (else
        (cons (car sequence)
              (filter p (cdr sequence))
              )
        )
       )
     )
        )
  )
;列表元素合并
(define (append2 list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append2 (cdr list1) list2))
      )
  )
;枚举一棵树的所有树叶
(define elist (list 1 (list 2 (list 3 4)) 5))
(define (enumerate-tree tree)
  (cond
   ((null? tree) null)
   (else
    (cond
      ((not (pair? tree)) (list tree)  )
      (else
       (append (enumerate-tree (car tree))
               (enumerate-tree (cdr tree))
               )
       )
      )
    )
    )
  )

;练习233
(define (map p sequence)
  (accumulate
   (lambda (x y)
      (cons (p x) y)
     )
   null
   sequence
   )
  )
(define (sq x) (* x x))
;(append (list 1 2) (list 3 4))
(define (append seq1 seq2)
  (accumulate
   cons
   seq2
   seq1
   )
  )


;计算列表长度
(define (length2 items)
  (if (null? items)
      0
      (+ 1 (length2 (cdr items)))
      )
  )
(define (length sequence)
  (accumulate
   (lambda (x y) (+ 1 y))
   0
   sequence
   )
  )
;累积某个元素
(define (accumulate op initial s)
  (cond
    ((null? s) initial)
    (else
     (op (car s)
         (accumulate op initial (cdr s))
         )
     )
    )
  )
;Horner规则求多项式
(define (horner-eval x cofficient-sequence)
  (accumulate
   (lambda (this-coeff higher-terms)
     (* x )
     )
   0
   coefficient-sequence
   )
  )
