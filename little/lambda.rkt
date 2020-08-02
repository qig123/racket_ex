#lang Racket
(require "star.rkt")
(require "shadows.rkt")
(require "number_cans.rkt")
(provide atom-to-function)
(define A0 '(shrimp salad tuna salad and tuna))
(define A1 '(and tuna))
(define A3 '(chips and fish or fish and chips))
(define A4 '((9 1 2 8) 3 10 ((9 9) 7 6) 2))
(define rember-f2
  (lambda (test? a l)
    (cond
      ((null? l) (quote ()))
      ((test? a (car l)) (rember-f2 test? a (cdr l)))
      (else
       (cons (car l) (rember-f2 test? a (cdr l)))
       )
      )
    )
  )
(define eq?-c
  (lambda (a)
    (lambda (x)
      (eq? x a)
      )
    )
  )
(define rember-f
  (lambda (test?)
    (lambda (a l)
    (cond
      ((null? l) (quote ()))
      ((test? a (car l)) (cdr l))
      (else
       (cons (car l) ((rember-f test?) a (cdr l)))
       )
      )      
      )
    )
  )
(define insertL-f
  (lambda (test?)
    (lambda (new old l)
      (cond
        ((null? l) (quote()))
        ((test? (car l) old)
         (cons new (cons old (cdr l)))
        )
        (else
         (cons (car l) ((insertL-f test?) new old (cdr l)))
         )
      )
    )
  ))
;((insertR-f eq?) 'i 'a '(b a d))
(define insertR-f
  (lambda (test?)
    (lambda (new old l)
      (cond
        
      ((null? l) (quote()))
      ((test? old (car l)) (cons old (cons new (cdr l))))
      (else
       (cons (car l) ((insertR-f test?) new old (cdr l)))
       )
      ))
    )
  )

(define seqR
  (lambda (new old l)
    (cons old (cons new l))
    )
  )
(define seqL
  (lambda (new old l)
    (cons new (cons old l))
    )
  )
(define subS
  (lambda (new old l)
    (cons new (cdr l))
    )
  )
(define insert-g
  (lambda (seq)
    (lambda (new old l)
    (cond
      ((null? l) (quote ()))
      ((eq?  old (car l) ) (seq new old (cdr l)) )
      (else
       (cons (car l) ((insert-g seq) new old (cdr l)))
       )
      ))
    )
  )
;(define insertL (insert-g seqL))
(define insertR (insert-g seqR))
(define insertL
  (insert-g
   (lambda (new old l)
     (cons new (cons old l))
     )
   )
  )
(define subset (insert-g subS))
(define seqrem
  (lambda (new old l)
    l
    )
  )
(define yyy
  (lambda (a l)
    ((insert-g seqrem) #f a l)
    )
  )
(define atom-to-function
  (lambda (x)
     (cond
       ((eq? x (quote ＋))  ＋)
       ((eq? x (quote ×)) ×)
       (else
        ÷
        )
       )
    )
  )
(define value
  (lambda (nexp)
   
    (cond
      ((atom? nexp) nexp)
      (else
       ( (atom-to-function (operator nexp))
         (value (1st-sub-exp nexp))
         (value (2st-sub-exp nexp))
         )
       )
      )
    
    )
  )
(define multirember-f
  (lambda (test?)
    (lambda (a lat)
      (cond
        ((null? lat) (quote()))
        ((test? a (car lat)) ( (multirember-f test?) a (cdr lat)))
        (else
         (cons (car lat) ((multirember-f test?) a (cdr lat)))
         )
        )
      )
    )
  )

(define multirember-eq? ( multirember-f eq?))
(define eq?-tuna (eq?-c (quote tuna)))
(define multiremberT
  (lambda (eq?-tuna lat)
    (cond
      ((null? lat) (quote()))
      ((eq?-tuna (car lat)) (multiremberT eq?-tuna (cdr lat) ))
      (else
       (cons (car lat) (multiremberT eq?-tuna (cdr lat)))
       )
      )
    )
  )
(define a-friend
  (lambda (x y)
    (null? y)
  ))
(define new-friend
  (lambda (newlat seen)
    (a-friend newlat (cons (car '(tuna)) seen))
    )
  )

(define multirember&co
  (lambda (a lat col)
    (cond
      ((null? lat) (col (quote ()) (quote ())))
      ((eq? (car lat) a)
       (multirember&co a (cdr lat)
                       (lambda (newlat seen)
                         (col newlat (cons (car lat) seen))
                         ))
       )
      (else
       (multirember&co a (cdr lat)
                       (lambda (newlat seen)
                         (col (cons (car lat) newlat) seen)
                         )
                       )
       )
      )
    )
  )
(define latest-friend
  (lambda (newlat seen)
    (a-friend (cons (quote and) newlat) seen)
    )
  )
;(multiinsertL 'x  'a '(a b c a b c a d))
(define multiinsertL
  (lambda (new old lat)
    (cond
      ((null? lat) (quote()))
      ((eq? (car lat) old) ( cons new (cons old (multiinsertL new old (cdr lat))) ))
      (else
       (cons (car lat) (multiinsertL new old (cdr lat)))
       )
      )
    )
  )
(define multiinsertR
  (lambda (new old lat)
    (cond
      ((null? lat) (quote()))
      ((eq? (car lat) old) ( cons old (cons new (multiinsertR new old (cdr lat))) ))
      (else
       (cons (car lat) (multiinsertR new old (cdr lat)))
       )
      )
    )
  )
;(multiinsertLR 'x  'a 'b '(a b c a b c a d))
(define multiinsertLR
  (lambda (new oldL oldR lat)
    (cond
    ((null? lat) (quote()))
    ((eq? (car lat) oldL)
     (cons new ( cons oldL (multiinsertLR new oldL oldR (cdr lat))))
     )
    ((eq? (car lat) oldR)
     (cons oldR (cons new (multiinsertLR new oldL oldR (cdr lat))))
     )
    (else
     (cons (car lat) (multiinsertLR new oldL oldR (cdr lat)))
     )
    ))
  )
(define col-multiLR
  (lambda (x L R )
    (list x L R)
    )
  )
;(multiinsertLR&co 'x  'a 'b '(a b c a b c a d)  col-multiLR)
(define multiinsertLR&co
  (lambda (new oldL oldR lat  col)
    (cond
      ((null? lat) (col (quote ()) 0 0))
      ((eq? (car lat) oldL)
       (multiinsertLR&co new oldL oldR  (cdr lat)
                       (lambda (newlat L R )
                         (col (cons new (cons oldL newlat)) (+ L 1)  R)
                         ))
       )
      ((eq? (car lat) oldR)
       (multiinsertLR&co new oldL oldR (cdr lat)
                       (lambda (newlat L R )
                         (col (cons oldR (cons new  newlat)) L  (+ 1 R) )
                         ))
       )
      (else
       (multiinsertLR&co new oldL oldR (cdr lat)
                       (lambda (newlat L R )
                         (col (cons (car lat) newlat) L R)
                         )
                       )
       )
      )
    )
  )
(define even-only*
  (lambda (l)
    (cond
      ((null? l) (quote ()))
      ( ( not (atom? (car l))) (cons (even-only* (car l)) (even-only* (cdr l) )))
      ((not (even? (car l)))  (even-only* (cdr l)))
      (else
       (cons (car l) (even-only* (cdr l)))
       )
      )
    )
  )
(define col-e
  (lambda (x mul sum)
    (list x mul sum))
  )
(define even-only*&co
  (lambda (l col)
    (cond
      ((null? l) (col (quote()) 1 0))
       ( ( not (atom? (car l)))
         (even-only*&co (car l)
                        (lambda (newlat m s)
                          (even-only*&co (cdr l)
                                         (lambda (dl dp ds)
                                           (col (cons newlat dl)
                                           (* m dp)
                                           (+ s ds))
                                           )
                                         )
                          )
                        )
         )
       ((not (even? (car l)))
        (even-only*&co (cdr l)
                       (lambda (newlat m s)
                         (col newlat m (+ s (car l) ))
                         )
                       )
        )
       (else
         (even-only*&co (cdr l)
                        (lambda (newlat m s)
                          (col (cons (car l) newlat) (* m (car l)) s)
                          )
                        )
        )
       
      )
      )
  )



