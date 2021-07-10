(load "io.scm")

; computes a list of the prime factors of a number.
(define factor (lambda (num)
        (let ((lst `()))
            (let ((lst-reverse `()))
                (reverser-helper (factor-helper num 2 lst) lst-reverse)  
            ) 
        )           
    )
)

(define factor-helper (lambda (num start lst)
        (if (> num 1)
            (if (equal? (remainder num start) 0)
                (factor-helper (/ num start) start (cons start lst)) ; num / start, start, append start to lst 
                (factor-helper num (+ start 1) lst) ; start = start + 1 
            )
            lst ; return list
        )
    )
)

; get list and empty list
(define reverser-helper (lambda (lst lst-reverse)
        (if (equal? lst `())
            lst-reverse
            ;store first element to elm
            ;store rest of elements into list named remain
            (let ((elm (car lst)) (remain (cdr lst)))
                (reverser-helper remain (cons elm lst-reverse))
            ) 
        )
    )
)

(display "Enter a number: ")
(define n (getline))
(display (factor (string->number n)))
(newline)
(exit)