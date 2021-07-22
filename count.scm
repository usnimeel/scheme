; wirte a function that resturns a clouser,
; which increaments a counter and returnss each time
; it is called.

(define new-counter (lambda ()
; clouser
(let ((count 0))
    (lambda ()
        (set! count (+ count 1))
        count
    )
)                 
))

(define c1 (new-counter))
(define c2 (new-counter))

(c1) ; 1
(c1) ; 2
(c1) ; 3
(c2) ; 1
(c2) ; 2

(exit)
