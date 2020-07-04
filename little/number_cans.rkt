#lang Racket
(provide add1)
(provide ＋)
(provide ×)
(provide  ÷)
(provide －)
(provide eqan?)
(define add1
  (lambda (n)
    (+ n 1)
    )
  )
(define sub1
   (lambda (n)
    (- n 1)
    ) 
  )
(define ＋
  (lambda (n m)
    (cond
      ((zero? m) n)
      (else (add1 (＋ n (sub1 m) )))
      )
    )
  )
;define sub
(define －
  (lambda (n m)
    (cond
      ((zero? m) n)
      (else (sub1 (－ n (sub1 m))))
      )
    )
  )
;define addtup
(define addtup
  (lambda (tup)
    (cond
      ((null? tup) 0)
      (else (＋ (car tup) (addtup (cdr tup))))
      )
    )
  )
(define ×
  (lambda (n m)
    (cond
      ((zero? m) 0)
      (else (＋ n (× n (sub1 m))))
      )
    )
  )
;tup+
(define tup+
  (lambda (tup1 tup2)
    (cond
      ((null? tup1) tup2)
      ((null? tup2) tup1)
      (else
       (cons (＋ (car tup1) (car tup2))
             (tup+ (cdr tup1 ) (cdr tup2)))
       )
      )
    )
  )
;define > using zero? sub1
(define >
  (lambda (n m)
    (cond
      ((zero? n)  #f )
      ((zero? m)  #t )
      (else (> (sub1 n) (sub1 m)))
      )
    )
  )
(define <
  (lambda (n m)
    (cond
      ((zero? m)  #f )
      ((zero? n)  #t )
      (else (< (sub1 n) (sub1 m)))
      )
    )
  )
;
(define equal
  (lambda (n m)
    (cond
      ((zero? m) (zero? n))
      ((zero? n) #f)
      (else (equal (sub1 n) (sub1 m)))
      )
    )
  )
(define eq2
  (lambda (n m)
    (cond
      ((> n m) #f)
      ((< n m) #f)
      (else #t)
      )
    )
  )
;first and fif comand
(define exp2
  (lambda (n m)
     (cond
      ((zero? m) 1)
      (else (× n (exp2 n (sub1 m))))
      )
    )
  )
(define ÷
  (lambda (n m)
    (cond
      ((< n m) 0)
      (else (add1 (÷ (－ n m) m)))
      )
    )
  )
(define length
  (lambda (lst)
    (cond
      ((null? lst) 0)
      (else (add1 (length (cdr lst))))
      )
    )
  )
(define pick
  (lambda ( n  lat)
    (cond
      ((null? lat) '())
      (else
       (cond
         ((equal 1 n) (car lat))
         (else  (pick  (sub1 n) (cdr lat)) )
         )
       )
      )))
(define rempick
  (lambda (n lat)
    (cond
      ((null? lat) '())
      (else
       (cond
         ((zero? (sub1 n))  (rempick (sub1 n) (cdr lat)))
         (else (cons (car lat) (rempick (sub1 n) (cdr lat))))
         )
       )
      )
    )
  )
(define rempick2
  (lambda (n lat)
    (cond
      ((zero? (sub1 n)) (cdr lat))
      (else (cons (car lat) (rempick2 (sub1 n) (cdr lat))))
      )
    )
  )
;(no_nums (list 5 'pears 6 'prunes 9 'dates))
(define no_nums
  (lambda (lat)
    (cond
      ((null? lat) '())
      (else
       (cond
         ((number? (car lat))   (no_nums (cdr lat)))
         (else
          (cons (car lat) (no_nums (cdr lat)))
          )
         )
       )
      )
    )
  )
(define all_nums
  (lambda (lat)
    (cond
      ((null? lat) '())
      (else
       (cond
         ( (not (number? (car lat)))   (all_nums (cdr lat)))
         (else
          (cons (car lat) (all_nums (cdr lat)))
          )
         )
       )
      )
    )
  )
(define eqan?
  (lambda (a1 a2)
    (cond
      ((and (number? a1) (number? a2)) (equal a1 a2))
      ((or (number? a1) (number? a2)) #f)
      (else (eq? a1 a2))
      )
    )
  )
(define occur
  (lambda (a lat)
    (cond
      ((null? lat) 0)
      (else
       (cond
         ((eqan? a (car lat)) (add1 (occur a (cdr lat))) )
         (else
          (occur a (cdr lat))
          )
         )
       )
      )
  ))

(define one?
  (lambda (n)
    (= n 1)
    )
  )
    
  


