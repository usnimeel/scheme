; Implement a function that takes a list of numbers as an argument 
; and returns an iterator that returns the square root

(define new-sqrt-iterator (lambda (lst)
  ; clouser
  (lambda ()
    (if (null? lst)
      #f                      ; no more argument
      (let ((top (car lst)))  ; store first value of list into top
        (set! lst (cdr lst))
        (sqrt top)
      )     
    )
  )                  
))

(define sql-test (new-sqrt-iterator `(1 2 3 4)))

