; There are three pegs and disks
; move disks from start peg to end pag using spare peg

(define move (lambda (disks start end spare)
        (if (< disks 1)
            0
            (begin
                (move (- disks 1) start spare end)
                (move-disk disks start end)
                (move (- disks 1) spare end start)               
            )
        )
    )
)

(define move-disk (lambda (disks start end)
        (begin
            (display "move disk ")
            (display disks)
            (display " from " )
            (display start)
            (display " to " )
            (display end)
            (newline)
        )            
    )
)

(move 1 1 2 3)
(newline)
(move 2 1 2 3)
(newline)
(move 3 1 2 3)
(newline)
(exit)