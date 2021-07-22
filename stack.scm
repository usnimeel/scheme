; a stack clouser
; push - prepends an object to a list
; pop - removes the front of a list and returns it
; empty - returns true if and only if stack is empty

(define new-stack (lambda ()
(let ((stack `()))
  (lambda (op . args)
    (cond
      ((eq? op `push)
       ; preprend to stack and set stack to the new stack
       (set! stack (cons (car args) stack))
      )
      ((eq? op `pop)
       ; copy top of stack
       ; remove item from stack and set stack to the new list
       ; return copy of top
       (let ((top (car stack)))
        (set! stack (cdr stack))
        top 
       )
      )
      ((eq? op `empty)
       (null? stack)
      )
    )
  )
)
))

