
;(define product (lambda (L)
;(if (null? L)
;  1
;  (* (product (cdr L)) (car L))
;)
;))
; Rewrite the above code as a tail-recursive function

(define product-tr (lambda (L)
  (letrec ((product-helper (lambda (partial lst)
              (if (null? lst)
                  ;  1
                  ;  (* (product (cdr L)) (car L))
                  partial
                  (product-helper (* partial (car lst)) (cdr lst))
              )
            ))
          )
    (product-helper 1 L)
  )
))

(display (product-tr `(1 2 3 4 5)))
(newline)
(exit)
