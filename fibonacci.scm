#|  fibonacci(0) = 0 
 |  fibonacci(1) = 1
 |# fibonacci(n) = fibonacci(n-1) + fibonacci(n-2)

(load "io.scm")

(define fibonacci (lambda (n)
        (if (< n 2)                                     ;check for base case n < 2
            n                                           ;base case: if n < 2 return n
            (+ (fibonacci(- n 1)) (fibonacci(- n 2)))   ;recursive case: return fibonacci(n-1) + fibonacci(n-2)
        )                  
    )
)

(display (fibonacci 2))  ; return 0 + 1 = 1
(newline)
(display (fibonacci 3))  ; return 1 + 1 = 2
(newline)
(display (fibonacci 4))  ; return 1 + 2 = 3
(newline)
(display (fibonacci 5))  ; return 2 + 3 = 5
(newline)
(display (fibonacci 6))  ; return 3 + 5 = 8
(newline)
(display "Enter the number: ")
(define n (getline))
(display (fibonacci (string->number n)))
(newline)
(exit)
