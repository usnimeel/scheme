(load "io.scm")

; determine n is a prime or not.
(define isPrime (lambda (n)
        (if (< n 2) ; 0 and 1 are not a prime number.
            #f
            (isPrime-helper n 2)
        )    
    )
)

(define isPrime-helper (lambda (n d)
        (if (equal? n d) ; stopper (performed until d = n - 1)
            #t ; n has a non-zero remainder until divided by n - 1.
            (if (equal? (remainder n d) 0)
                #f ; A remainder of n equals zero, which means that there is a divisible value for n.
                (isPrime-helper n (+ d 1)) ; ++d
            )
        )
    )
)

(display "Enter a number: ")
(define n (getline))
(display (isPrime (string->number n)))
(newline)
(exit)