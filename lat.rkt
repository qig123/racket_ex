#lang Racket
(define (lat? l)
  (cond ((null? l) #t) 
        ((atom? (car l)) (lat? (cdr l)) )
        (else #f)
        )
  )
(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))

  ))
(define member?
  (lambda (a lat)
    (cond  ((null? lat) #f)
           (else (or (eq? (car lat) a)
                     (member? a (cdr lat))
                     ))
           )
    )
  )
(define rember2
  (lambda (a lat)
    (cond
      ((null? lat) '())
      (else (cond ((eq? (car lat) a) (cdr lat))
                  (else ( cons (car lat) (rember2 a (cdr lat))))
             ))
      )
    ))
(define firsts
  (lambda (l)
    (cond
      ((null? l) '())
      (else (cons
             (car(car l))
             (firsts (cdr l))
             ))
      )
    )
  )
;'((a b) (c d) (e f))
;(firsts '((a b) (c d) (e f)))
(define insertR2
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) old) (cons (car lat) (insertR2 new old (cons new (cdr lat)))))
      (else (cons (car lat) (insertR2 new old (cdr lat))))
          )
    )
  )

;(insertR 'e 'd '(a b c d  f g d h))
;(insertR  'topping 'fudge '(ice cream with fudge for dessert))
(define subst
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      (else (cond
              ((eq? (car lat) old) (cons new (cdr lat)))
             (else 
                   (cons (car lat) (subst new old (cdr lat)))
                    )
             ))
      )
    )
  )
;(subst 'topping 'fudge '(ice cream with fudge for dessert) )
(define rember
  (lambda (a lat)
    (cond
      ((null? lat) '())
      (else
       (cond
         ((eq? a (car lat)) (cdr lat))
         (else (cons (car lat) (cdr lat)))
         )
       )
      )

    )
  )
;(rember 'bacon '(bacon lettuct and tomato))