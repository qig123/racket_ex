#lang racket
;(cons (list 1 2) (list 3 4))
;这个结构有3个对象，一个元素是表(list 1 2)，另外2个元素是数字3,4
;这种结构可以认为是树，
(define x (cons (list 1 2) (list 3 4)))
(define y (list 1 2 3 4))
(define z (list 1 3 (list 5 7) 9))
(define q (list (list 7)))
(define s (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
;迭代计算长度
(define (len2 lst)
   (define (iter lst result)   (cond ( (null? lst) result ) (else  ( iter (cdr lst) (+ 1 result) ))))

     (iter lst 0)
  )
;递归计算长度
(define (len3 lst)
  (if (null? lst) 0 (+ 1 (len3 (cdr lst))))
  )
;递归计算序对的序对的 这种数据结构的书的叶子
(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))
        )
  )
;get z 7
;(car (cdr (car (cdr (cdr z)))))
;get q 7
;(car (car q))
;get s 7
;(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr s)))) )) )) ))) )

