#lang sicp

(define one-four (list 2 3))
(define (sq x) (* x x))
(define test 3)


;缩放
(define (scale_list items factor)
  (if (null? items) nil ( cons (*(car items) factor)( scale_list (cdr items) factor )))

  )
(define (map2 items proc)  (if (null? items) nil ( cons (proc(car items) )( map2 (cdr items) proc ))))
(define test2 (lambda (x) (/ x 2)))

;
(define (scale-list items factor)
  (map2  items (lambda (x) (* x factor)))
  )


