#lang Racket
;nth-element:List × Int -> SchemeVal
;usage: (nth-element lst n)= the n-th element of lst
(define list-length
  (lambda (lst)
    (if (null? lst)
        0
        (+ 1 (list-length (cdr lst)))
        )
    )
  )

(define nth-element
  (lambda (lst n)
    (if (null? lst)
        (report-list-too-short2 lst n)
        (if (zero? n)
            (car lst)
            (nth-element (cdr lst) (- n 1))
            )
        )
    )
  )
(define report-list-too-short
  (lambda (n)
    (error 'nth-element
                "List too short by ~s element.~%" (+ n 1)
                )
    )
  )
(define report-list-too-short2
  (lambda (lst n)
    (error 'nth-element
                "~s does not have ~s element.~%" lst n
                )
    )
  )