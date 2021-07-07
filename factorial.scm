; n! = n * (n-1) * (n-2) * ... * 1

(define factorial (lambda (n)
    (if (< n 1)                  ; check for base case n < 1
      1                          ; base case: if n < 1 return 1
      (* n (factorial (- n 1)))  ; recursive case: return n * factorial(n-1)
    )
  )
)

(display factorial(0))  ; return 0
(newline)
(display factorial(1))  ; return 1
(newline)
(display factorial(3))  ; return 3 * 2 * 1 = 6
(newline)
(display factorial(4))  ; return 4 * 3 * 2 * 1 = 24
(exit)
