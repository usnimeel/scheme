; a function that creates a clouser that can be passed to list-visitor
; to compute the average of a list
; in general if we have the average for n - 1 elements, to computer the average
; for n elements, assuming e is the nth element.
; new partial = ((partial * (n-1)) + e / n

(define new-avg (lambda ()
(let ((n 0.0))
  (lambda (elem partial)
    ; compute ((partial * n) + elem )
    ; compute and set n = n + 1
    ; return ((partial * n) + elem ) / n
    (let ((avg-n (+ (* partial n) elem)))
      (set! n (+ n 1))
      (/ avg-n  n)
    )
  )
)                 
))

(load "list-visitor.scm")
(list-visitor `(7) (new-avg))       ; 7
(list-visitor `(7 13) (new-avg))    ; 10
(list-visitor `(7 14 9) (new-avg))  ; 10
(list-visitor `(1 2 3 4) (new-avg)) ; 2.5

(exit)
