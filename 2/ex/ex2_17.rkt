#lang racket
(define list1 (list 1 2 3 5 6))
(define list2 (list 1 2 ))
(define list3 (list 1 ))
(define list4 (list 1 2 3 ))
;(last-pair list2)
;ex-2.17
(define (last-pair lst)
  (if (null? (cdr lst)) 
       lst
      (last-pair (cdr lst))
   )
  )

;(reserve list2)
;ex-2.18
(define (reserve lst)
  (define (reserve-iter lst result)
    ( if (null? lst)
         result
         (reserve-iter (cdr lst) (cons (car lst) result))
     )
    )
  (reserve-iter lst '())
  )
  