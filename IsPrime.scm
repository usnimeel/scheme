(load "io.scm")

; determine n is a prime or not.
(define isPrime (lambda (n)
        (if (< n 2) ; 0 and 1 are not a prime number.
            #f
            (if (equal? n 2) ; 2 is a prime nunmber.
                #t
                (isPrime-helper n (- n 1))
            )
        )    
    )
)

(define isPrime-helper (lambda (n d)
        (if (equal? (remainder n d) 0)
            #f ; A remainder of n equals zero, which means that there is a divisible value for n.
            (if (> d 2) ; stopper (until divided by 2)
                (isPrime-helper n (- d 1))
                #t ; n has a non-zero remainder until divided by 2.
            )
        )
    )
)

(display "Enter a number: ")
(define n (getline))
(display (isPrime (string->number n)))
(newline)
(exit)