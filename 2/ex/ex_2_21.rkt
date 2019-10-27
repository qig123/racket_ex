#lang sicp

;过程square-list 以一个数值表为参数，返回每个数的平方构成的表
(define (square-list items)
  (if (null? items) nil
      (cons (* (car items) (car items)) (square-list (cdr items)))
  ))
;map
(define (map proc items)
   ( if (null? items) nil (cons (proc (car items)) (map proc (cdr items))))
  )
(define (square-list2 items)
  (map (lambda (x) (* x x)) (list 1 2 3 4))
  )
(define arr (list 1 2 3 4 5 6))
(define (square x) (* x x))
;2-22 重写square-list
(define (square-list3 items)
  (define (iter things answer)
    (if (null? things) answer
        (iter (cdr things) (cons (square (car things)) answer))))
   (iter items nil)

  )

(define (square-list4 items)
  (define (iter things answer)
    (if (null? things) answer
        (iter (cdr things) (cons  answer (square (car things))))))
   (iter items nil)

  )

 ;(define (is_end? items result) ( if (null? items) (car result) (is_end? (cdr items)  items) ))

;返回表中最后一个元素
(define (last-pair items)
  (define (iter things answer)
    (if (null? things) answer (iter (cdr things)  things))
    )
  (iter items (list))
  )
;逆序
(define (reserve2 items)
  (define (iter things answer)
    (if (null? things) answer
        (iter (cdr things) (cons (car things) answer))))
   (iter items nil)

  )
;





