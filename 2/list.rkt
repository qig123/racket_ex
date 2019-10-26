#lang sicp
;常规的程序设计技术
(define one-through-four (list 1 2 3 4))
(define (test x) (* x x))
;表操作：按索引取值
(define (list-ref items n)
  (if (= n 0) (car items) (list-ref (cdr items )(- n 1))))
  
(define squares (list 1 4 9 16 25))
(define odds (list 1 3 5 7 9 11))
;计算长度
(define (length items)
  (if (null? items) 0 (+ 1 (length (cdr items))))
  )
;迭代计算长度
(define (length2 items)
  (define (length-iter a count)
    (if (null? a) count (length-iter (cdr a) (+ 1 count)))
    )
  (length-iter items 0)
  )
;在向下cdr表的过程中，向上cons出一个结果表， append
(define (append2 list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append2 (cdr list1) list2)))
  )
;变换表
(define (scale-list items factor)
  (if (null? items)
        nil
        (cons (* (car items) factor) (scale-list (cdr items) factor))))
;map继续抽象
(define (map proc items)
  (if (null? items) nil (cons (proc (car items)) (map proc (cdr items) )))
  )
;用map定义scale list
(define (scale-list2 items factor)
  (map (lambda (x) (* x factor)) items))


  

