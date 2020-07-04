#lang Racket
(require "star.rkt")
(print-as-expression #f)
(define A '(apple peaches apple plum))
(define B '(apple peaches pears plum))
(define C '(apple peach pear peach plum apple lemon peach))
(define D '(5 chicken wings))
(define E '(5 hamburgers 2 pieces fried chicken and light duckling wings))
(define F '(4 pounds of horseradish))
(define G '(four pounds chicken and 5 ounces horseradish))
(define H '(6 large chickens with wings))
(define I '(6 chickens with large wings))
(define J '(stewed tomatoes and macaroni))
(define K '(macaroni and cheese))
(define A1 '(stewed tomatoes and macaroni casserole))
(define A2 '(macaroni and cheese))
(define A3 '((a b c) (c a d e) (e f g h a b)))
(define A4 '((6 pears and) (3 peaches and 6 peppers) (8 pears and 6 plums)(and 6 prunes with some apples)))
;判断是否是集合
(define set!
  (lambda (l)
    (cond
      ((null? l) #t)
      (else
       (and (help (car l) (cdr l)) (set! (cdr l)))
       )
      )
    )
  )
(define help
  (lambda (a l)
    (cond 
    ((null? l) #t)
    ((equal? a (car l)) #f)
    (else
     (and (car l) (help a (cdr l)))
     )
     )
    )
  )
(define help2
  (lambda (a l)
    (cond 
    ((null? l) (quote ()))
    ((eq? a (car l)) (help2  a (cdr l)))
    (else
     (cons (car l) (help2 a (cdr l)))
     )
     )
    )
  )
(define sum
  (lambda (a b)
    (cond
      ((> a b) 0)
      (else  (+ a (sum (+ a 1) b)) )
      )
    )
  )
;去除集合中重复元素
(define makeset
  (lambda (lat)
    (cond
      ((null? lat) (quote ()))
      (else
        (cons (car lat) (makeset  (help2  (car lat)(cdr lat))))
      )
       )
      )
  )
;remove same atom
(define multirember
  (lambda (a lat)
    (cond
      ((null? lat) (quote ()))
      (else
       (cond
         ((eq? (car lat) a) ( multirember a (cdr lat)))
         (else
          (cons (car lat) ( multirember a (cdr lat)))
          )
         )
       )
      )
    )
  )
(define haveelement?
  (lambda (a l)
    (cond 
    ((null? l) #f)
    ( (equal? a (car l)) #t )
    (else
       (haveelement? a (cdr l))
     )
     )
    )
  )
(define subset?
  (lambda (set1 set2)
    (cond
      ((null? set1) #t)
      (else
       (and ( haveelement? (car set1) set2) (subset? (cdr set1) set2))
       )
      )
    )
  )
(define eqset?
  (lambda (set1 set2)
    (and (subset? set1 set2) (subset? set2 set1))   
    )
  )
(define intersect?
 (lambda (set1 set2)
   (cond
      ((null? set1) #f)
      (else
       (or ( haveelement? (car set1) set2) (intersect? (cdr set1) set2))
       )
      )
   )
 )
(define subset
  (lambda (set1 set2)
    (cond
       ((null? set1) set2)
       (else
        (cons (car set1) (subset (cdr set1) set2))
        )
      )
    )
  )
(define intersect
  (lambda (set1 set2)
    (cond
      ((null? set1) (quote ()))
      (else
       (cond
         ((haveelement? (car set1) set2) (cons (car set1) (intersect (cdr set1) set2)))
         (else
          ( intersect  (cdr set1) set2)
          )
         )
       )
      )
    )
  )
(define union2
  (lambda (set1 set2)
    (makeset (subset set1 set2))
    )
  )
(define union
  (lambda (set1 set2)
    (cond
      ((null? set1) set2)
      ( (haveelement? (car set1) set2) (union (cdr set1)  set2))
      (else
       (cons (car set1) (union (cdr set1) set2))
       )
     )
  ))
(define intersectall
  (lambda (l-set)
    (cond 
    ( ( null? (cdr l-set)) (car l-set))
    (else
     ( intersect (car l-set) (intersectall (cdr l-set)))
     )                                                                                                                                                                                                                                                )
      )  
    )
(define a-pair2?
  (lambda (l)
    (cond
      ((null? l) #f )
      (else
       ( and (and (is-sexp? (car l)) (is-sexp? (cdr l))) (is-sexp? (cdr (cdr l))))
       )
      )
    )
  )
(define a-pair?
  (lambda (x)
    (cond
      ((atom? x) #f)
      ((null? x) #f)
      ((null? (cdr x)) #f)
      ((null? (cdr (cdr x))) #t)
      (else #f)
      )
    )
  )
 (define is-sexp?
   (lambda (exp)
     (cond
       ((null? exp) #t)
       (else
        (or (atom? exp) (list? exp))
        )
       )
     )
        )
(define first
  (lambda (p)
    (car p)
    )
  )
(define second
  (lambda (p) (car (cdr p)))
  )
(define third
  (lambda (l)
    (car (cdr (cdr l)))
    )
  )
(define build
  (lambda (s1 s2)
    (cons s1 (cons s2 (quote ())))
    )
  )
(define firsts
  (lambda (l)
    (cond
      ((null? l) (quote ()) )
      ((null? (cdr l)) ( cons (car (car l)) (quote ())))
      (else
       (cons (car (car l)) (firsts (cdr l)))
       )
      )
    )
  )
; (fun? '((8 3) (4 2) (7 6) (6 2) (3 4)))
(define F1 '((a b) (c d) (e f)))
(define F2 '((five plums) (four) (eleven green orange)))
(define F3 '((8 3) (4 2) (7 6) (6 2) (3 4)))
(define F4 '((8 a) (pumpkin pie) (got sick)))
(define F5 '((8 a) ))
(define fun? 
  (lambda (rel)
       (set! (firsts rel))
       )
    )
(define revrel2
  (lambda (rel)
    (cond
      ((null? (cdr rel)) ( cons  (build  (second (first rel))  (first (first rel)) ) (quote ()) ))
      (else
        (cons (build  (second (first rel))  (first (first rel)) )  (revrel2 ( cdr rel)))
       )
      )
    )
  )
(define revpair
  (lambda (pair)
    (build (second pair) (first pair))
    )
  )
(define revrel
  (lambda (rel)
    (cond
      ((null? rel) (quote ()))
      (else
       (cons (revpair (car rel)) (revrel (cdr rel)))
       )
      )
    )
  )
(define one-to-one?
  (lambda (fun)
    (fun? (revrel fun))
    )
  )
  


       