; Implement a function that takes a list of numbers as an argument 
; and returns an iterator that returns the perfect square root

(define new-square-iterator (lambda (lst)
  ; clouser
  (lambda ()
    (if (null? lst)
      #f                              ; no more argument
      (let ((top (car lst)))          ; store first value of list into top
        (if (integer? (sqrt top))     ; determine top is integer or not
          (begin
            (set! lst (cdr lst))
            (sqrt top)
          )
          (set! lst (cdr lst))
        )
      )     
    )
  ) 
                 
))

(define squ-test (new-square-iterator `(1 2 3 4)))
