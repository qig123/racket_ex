#lang Racket
(require "star.rkt")
(require "number_cans.rkt")
(provide operator)
(provide  1st-sub-exp)
(provide 2st-sub-exp)
(print-as-expression #f)
(define numbered?2
  (lambda (aexp)
    (cond
      ((atom? aexp)
        (cond
         ((or ( eq? '+ aexp ) (eq? '× aexp ) ( eq? '↑ aexp ) ( number? aexp ) ( eq? 'quote aexp ) ) #t)
         (else #f)
          )
       )
      (else
       (cond
         ((null? aexp) #t)
         (else
          (and (numbered?2 (car aexp))   (numbered?2 (cdr aexp))  )
          )
         )
       )
    )
  ))
( define x (quote (3 - 4 ↑  (+ 5 6))))
(define y (quote (3 + 4 × +)))
(define z  (quote '(+ 5 5) ) )
(define m  (quote  (× 5 5) ) )
(define numbered?
  (lambda (aexp)
    (cond
      ((atom? aexp) (number? aexp))
      (else
       (and (numbered? (car aexp))
            (numbered? (car (cdr (cdr aexp))))
            )
       )
      )
    )
  )
(define value
  (lambda (nexp)
    (cond
      ((atom? nexp) nexp)
      ((eq? (operator nexp) (quote ＋))
       (＋ (value (1st-sub-exp nexp)) (value (2st-sub-exp nexp)))
       )
      ((eq? (operator nexp) (quote ×))
       (× (value (1st-sub-exp nexp)) (value (2st-sub-exp nexp)))
       )
      (else
       (÷ (value (1st-sub-exp nexp)) (value (2st-sub-exp nexp)))
       )
      )
    )
  )
(define 1st-sub-exp
  (lambda (aexp)
    (car (cdr aexp)))
  )
(define 2st-sub-exp
  (lambda (aexp)
    (car (cdr (cdr aexp)))
    )
  )
(define operator
  (lambda (aexp)
    (car aexp)
    )
  )
(define sero?
  (lambda (n)
    (null? n)
    )
  )
(define edd1
  (lambda (n)
    (cons (quote ()) n)
    )
       )
(define zub1
  (lambda (n)
    (cdr n)
    )
  )
(define g (quote (＋ 3 (＋ 5 6))))

