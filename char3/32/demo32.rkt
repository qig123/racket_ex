#lang racket
(define factorial
  (lambda (n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))
      ))
  )
(define factorial2
  (lambda (n)
  (fact-iter 1 1 n))
  )
(define fact-iter 
  (lambda (product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count
                 )
      ))
  )
(define (make-withdraw2 balance)
  (lambda (amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds")))
(define make-withdraw3
  (lambda (balance)
  (lambda (amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))))


(define make-withdraw 
   (lambda (initial-amount) 
     ((lambda (balance )
      (lambda (amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount)) balance)
          "In"
          )))
       initial-amount) )
  )
(define w1 (make-withdraw 100))
(define w21 (make-withdraw2 100))
(define w31 (make-withdraw3 100))

(define (sqrt x)
  (define good-enough?
    (lambda (guess) (< (abs (- (sqrt guess) x)) 0.001))
    )
  (define improve
    (lambda (guess) ((lambda (a b) (/ (+ a b) 2)) guess (/ x guess)))
    )
  (define sqrt-iter
    (lambda (guess)
      (if (good-enough? guess)
          guess
          (sqrt-iter (improve guess))
          )
      )
    )
    (sqrt-iter 1.0) 
  )

