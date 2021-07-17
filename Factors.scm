(load "io.scm")

; computes a list of the prime factors of a number.
(define factor (lambda (num)
        (letrec ((factors-helper (lambda (start num)
                (if (equal? 1 num)                                ; base case num is 1
                    '()                                             ;   return empty list
                    (if (equal? 0 (remainder num start))            ; recursive case
                    (cons start (factors-helper start (/ num start))) ; start divides num
                    (factors-helper (+ start 1) num)              ;   start not divides num
                    )
                ))))
            (factors-helper 2 num)
        )
    )
)

(display "Enter a number: ")
(define n (getline))
(display (factor (string->number n)))
(newline)
(exit)