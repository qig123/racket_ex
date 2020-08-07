#lang Racket
(require "friends.rkt")
(require "star.rkt")
(require "number_cans.rkt")
(define A '((a b) c))
(define B '((a b) (c d)))
(define A1 '(a (b c)))

(define pick
  (lambda (i lat)
    (cond
      ((zero? i) (car lat))
      (else
      (pick (- i 1) (cdr lat))
      ))
    )
  )
(define looking
  (lambda (a lat)
    (keep-looking a (pick 1 lat) lat)
    )
  )
(define keep-looking
  (lambda (a sorn lat)
    (cond
      ((number? sorn) (keep-looking a (pick sorn lat) lat))
      (else
       (eq? sorn a)
       )
      )
    )
  )
(define shift
  (lambda (x)
    ( list (car (car x)) (list ( car ( cdr (car x))) (car (cdr x))) )
    )
  )
(define align
  (lambda (pora)
    (cond
      ((atom? pora) pora)
      ((pair? (first pora)) (align (shift pora)))
      (else
       (build (first pora) (align (second pora)))
       )
      )
    )
  )
(define length*
  (lambda (x)
    (cond
      ((null? x) 0 )
      (( not (atom? (car x))) ( + (* 2 (length* (car x))) (length* (cdr x))) )
      (else
       (+ (* 2 (length* (cdr x))) 1)
       )
      )
    )
  )
(define weight*
  (lambda (pora)
    (cond
      ((atom? pora) 1)
      (else
       (+ (* (weight* (first pora)) 2) (weight* (second pora)))
       )
      )
    )
  )
(define shuffle
  (lambda (pora)
    (cond
      ((atom? pora) pora)
      ((pair? (first pora))
       (shuffle (revpair pora))
       )
      (else
       (build (first pora) (shuffle (second pora)))
       )
      )
    )
  )
(define length
  (lambda (x)
    (cond
      ((null? x) 0)
      (else
       (+ 1 (length (cdr x)))
       )
      )
    )
  )
(define eternity
  (lambda (x) (eternity x))
  )
;--------

;对这个过程抽象,因为出现了重复代码lenght1
((lambda (length)
  (lambda (l)
    (cond
      ((null? l) 0)
      (else (add1 (length (cdr l)))))))
 ((lambda (g);
  (lambda (l)
    (cond
      ((null? l) 0)
      (else (add1 (g (cdr l))))
      )
    )
  ) eternity))
;---------------
((lambda (mk-length)
   (mk-length
    (mk-length eternity)
    )
   )
 (lambda (length)
   (lambda (l)
     (cond
       ((null? l) 0)
       (else (add1 (length (cdr l))))
       )
     )
   )
 )
;去掉eternity---
((lambda (mk-length)
   (mk-length mk-length)
   )
 (lambda (mk-length)
   (lambda (l)
     (cond
       ((null? l) 0)
       (else (add1 ((mk-length eternity) (cdr l))))
       )
     )
   )
 )
;-----再去掉
((lambda (mk-length)
   (mk-length mk-length)
   )
 (lambda (mk-length)
   (lambda (l)
     (cond
       ((null? l) 0)
       (else (add1 ((mk-length mk-length) (cdr l))))
       )
     )
   )
 )
;---再抽象一下











