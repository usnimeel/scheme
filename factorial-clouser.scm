; wirte a function that resturns a clouser,
; which generate the sequence of factorials staring at n = 1
; ex) 1 2 6 24 120 720 ...

(define new-factorial (lambda ()
; clouser
(let ((num 0) (f 1))
    (lambda ()
        (set! num (+ num 1)) ; increment
        (set! f (* f num))   ; compute f = n! = n(n-1)!
        f
    )
)                 
))

(define f1 (new-factorial))

(f1) ; 1
(f1) ; 2
(f1) ; 6
(f1) ; 24
(f1) ; 120
(f1) ; 720

(exit)
