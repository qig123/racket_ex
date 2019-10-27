#lang sicp
;(define test_newline newline )测试cond
(define (for-each2 p lst)
  (cond ((not (null? lst)) (p (car lst)) (for-each2 p (cdr lst)))
  ))
;注意test和test2的区别，test是过程，test2只是给4关联一个名字
(define (test) 4)
(define test2 4)
(define (input_tip) (display "输入x的绝对值是:"))
(define (abs2 x) (cond ((= x 0) (input_tip) (newline)  x)
                       ((< x 0) (input_tip)(- 0 x))
                       (else (input_tip) x)
                       ))
