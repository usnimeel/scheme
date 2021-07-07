(load "io.scm")
; Reverse elements in the list 
; Used helper fucntion for recursion

(define reverser (lambda (lst)
   (let ((lst-reverse `()))
     (reverser-helper lst lst-reverse)  
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

;test empty list
(reverser `())
(newline)
;test list with single value
(reverser `(1))
(newline)
;test list
(reverser `(1 2 3 4))
(newline)
(define input-lst (getlist))
(reverser input-lst)
(newline)
(exit)