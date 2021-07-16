; visit elements in the list 
; apply diverse function as a parameter and perform recursively

(define list-visitor (lambda (L func partial-result)
        (if (null? L)
            partial-result
            (let* ((head (car L))
                   (rest (cdr L))
                   (new-result (func head partial-result))
                  )
              (list-visitor rest func new-result) 
            )
        ) 
    )
)

(define lst `(1 2 3 4 5))

; add elements in the list
(display (list-visitor lst + 0))
(newline)
; multiply elements in the list
(display (list-visitor lst * 1))
(newline)
; max value in the list
(display (list-visitor lst max 0))
(newline)
; min value in the list
(display (list-visitor lst min 0))
(newline)
(exit)