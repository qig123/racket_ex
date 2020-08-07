#lang racket
(require "../../little/star.rkt")
(define append
  (lambda (x y)
    (if (null? x) y
        (cons (car x) (append (cdr x) y))
        )
    )
  )
;ex 3.16
(define (count-pairs2 x )
  (cond
    ((not (pair? x)) '())
    (else
       ( cons (cons x (count-pairs2 (car x))) (count-pairs2 (cdr x))) 
     )
    )
  )
(define remove-list
  (lambda (x)
    (cond
      ((null? x) '())
      (else
       (cons (car (car x))  (remove-list (cdr x)))
       )
      )
  ))
(define length
  (lambda (l)
    (cond
       ((null? l) 0)
       (else
        (+ 1 (length (cdr l))))
      )
    )
  )
;test (length (filter  (append (car  (count-pairs2 z1 ))  (cdr  (count-pairs2 z1 )))))
(define accumulate
  (lambda (x)
    (let ((temp (count-pairs2 x) ))
        (filter (append (car temp) (cdr temp)))
      )
    )
  )



;把所有是pair的数据保存到list中,
;'((((a b c) a b c) ((a b c)) ((b c)) ((c))) ((a b c)) ((b c)) ((c)))
;过滤重复的元素
(define  filter
  (lambda ( lst)
    (cond
       ((null? lst) '())
       ((repeat? (car lst) (cdr lst)) (filter (cdr lst)))
       (else
        (cons (car lst) (filter  (cdr lst)) )
        )
      )
    )
  )
(define repeat?
  (lambda (e lst)
    (cond
      ((null? lst) #f)
      (else
       (or  (eqlist?  e   (car lst)) (repeat? e (cdr lst)))
       )
      )
    )
  )
(define Z  '( (1) (1 3) (1) (2 6)))
;(filter Z)
;(repeat? (car Z) (cdr Z))
;;(filter (count-pairs2 z1 ))
(define (count-pairs x)
  (length (accumulate x))
  )

;tes
(define x '(  (c d ) ( b f)  (  e f)))
(define y '( a b c))
(define s (list 'a 'b ))
(define z1 (cons s s))
(define x2 (list 'a 'b))
(define z2 (cons x2 x2))
;ex3.17Devise a correct version of the count-pairs procedure of exercise 3.16 that
;returns the number of distinct pairs in any structure.
;creat structure

(define A  (list (list 1 3) (list 1) (list 5)))
(define B '(1))
;(let ((x (cons 1 2)))   (cons x x))  ; 带有重复指针的序对
 (define (count-pairs3 x) 
   (let ((encountered '())) 
     (define (helper x) 
       (if (or (not (pair? x)) (memq x encountered)) 
         0 
         (begin 
           (set! encountered (cons x encountered)) 
           (+ (helper (car x)) 
              (helper (cdr x)) 
              1)))) 
   (helper x))) 