#lang Racket
(require "number_cans.rkt")
(provide equal?)
(provide atom?)
(define y  '(((tomato sauce)) ((bean) sauce)  (and ((flying)) sauce)   ))
(define x '((coffee) cup ((tea) cup) (and (hick)) cup))
(define z '((how much (wood))  could ((a (wood) chuck ))(((chuck)))(if (a) ((wood chuck))) could chuck wood   ))
(define o '((banana) (spilt ((((banana ice))) (cream (banana)) sherbet )) (banana) (bread) (banana brandy) ))
(define q '(((hot) (tuna (and))) cheess))
(define p '((potato) (chips ( (with) fish) (chips))))
(define x1 '(strawberry ice cream))
(define x2 '(strawberry ice cream))
(define x3 '(strawberry cream ice))
(define x4 '(banana ((split))))
(define x5 '((banana) (split)))
(define x6 '(beef ((sausage)) (and (soda)) ))
(define x7 '(beef ((salami)) (and (soda))))

(define rember*
  (lambda (a l)
    (cond
      ((null? l) '())
      ((not (atom?  (car l))) (cons (rember* a (car l)) (rember* a (cdr l))))  
      ((eq? a (car l)) (rember* a (cdr l)))
      (else (cons (car l) (rember* a (cdr l))))
      )
    )
  )

(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))
    )
  )

(define insertR*
  (lambda (new old l)
    (cond
      ((null? l) '())
      ((not (atom?  (car l))) (cons (insertR* new old (car l)) (insertR* new old (cdr l))))  
      ((not (eq? old (car l))) (cons (car l)(insertR* new old (cdr l))))
      (else (cons old (cons new (insertR* new old (cdr l)))))
      )
    )
  )
(define occur*
  (lambda (a l)
    (cond
      ((null? l) 0)
      ((not (atom?  (car l))) (＋  (occur* a (car l))
                                    (occur* a (cdr l))))  
      ((eq? a (car l)) (add1 (occur* a (cdr l))))
      (else  (occur* a (cdr l)))
      )
    )
  )
(define subst*
  (lambda (new old l)
    (cond
      ((null? l) '())
      ((not (atom?  (car l))) (cons (subst* new old (car l)) (subst* new old (cdr l))))  
      ((not (eq? old (car l))) (cons (car l)(subst* new old (cdr l))))
      (else  (cons new (subst* new old (cdr l))))
      )
    )
  )
(define insertL*
  (lambda (new old l)
    (cond
      ((null? l) '())
      ((not (atom?  (car l))) (cons (insertL* new old (car l)) (insertL* new old (cdr l))))  
      ((not (eq? old (car l))) (cons (car l)(insertL* new old (cdr l))))
      (else (cons new (cons old (insertL* new old (cdr l)))))
      )
    )
  )
(define member*
  (lambda (a l)
    (cond
      ((null? l) #f)
      ((not (atom?  (car l))) (or  (member* a (car l))
                                    (member* a (cdr l))))  
      ((eq? a (car l)) (or  #t (member* a (cdr l))))
      (else  (member* a (cdr l)))
      )
    )
  )
(define leftmost
  (lambda (l)
    (cond
      ((atom? (car l)) (car l))
      (else
       (leftmost (car l))
       )
      )
    )
  )
(define x8 '(beef ((sausage)) (and (soda))))
(define x9 '(beef ((sausage)) (and (soddd))))
(define eqlist?
  (lambda (l1 l2)
    (cond
      ((and (null? l1 ) (null?  l2)) #t)
      ;((and (null? l1) (not (null? l2))) #f)
      ;((and ( not (null? l1))  (null? l2)) #f)
      ((or(null? l1)(null? l2)) #f)
      ;((and (not (atom? (car l1))) (not (atom? (car l2)))) (and (eqlist? (car l1) (car l2)) (eqlist? (cdr l1) (cdr l2))) )
      ;((and (atom? (car l1)) ( not (atom? (car l2)))) #f )
      ;((and ( not (atom? (car l1)))  (atom? (car l2))) #f )
      ;((or (atom? (car l1))(atom? (car l2))) #f);这一行代码不能与上面2行等价,出发去掉not
      ;((eq? (eqan? (car l1) (car l2)) #t) (eqlist* (cdr l1) (cdr l2)))
      ;(else #f) 这里2行代码与下一行代码等价(cond)=and
      (else
      (and (equal? (car l1) (car l2)) (eqlist? (cdr l1) (cdr l2)) )
      )
    )
  ))
(define equal?
  (lambda (s1 s2)
    (cond
      ((and (atom? s1)(atom? s2)) (eqan? s1 s2))
      ((or (atom? s1) (atom? s2)) #f)
      (else (eqlist? s1 s2))
      )
    )
  )
(define rember
  (lambda (s l)
    (cond
      ((null? l) '())
      ((equal? (car l) s) (cdr l))
      (else
       (cons (car l) (rember s (cdr l)))
       )
      )
    )
  )


