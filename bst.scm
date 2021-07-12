; Binary Search Tree
; Idea: represent a BST node as (value left right)
; if left == () there is no left child
; if right == () there is no right child

(load "io.scm")

; main binary search tree loader
; params: list of strings to be inserted into the BST
; return: a BST
(define load-bst (lambda (values)
    (let ((dummy '("@" () ())))           ; use a dummy node to avoid boundary
      (load-bst-helper dummy values)      ; cases
    )
  )
)

; recursive helper used to iterate over the list and insert items into
; a BST
; params: root: root of BST
;         values: remaining list of strings to be inserted
; return: a BST
(define load-bst-helper (lambda (root values)
    (if (null? values)                      ; empty list is the base case
      root
      (let ((elem (car values)) (remaining (cdr values)))   ; use a couple
        (let ((new-root (add-to-bst root elem)))            ; let to make call
          (load-bst-helper new-root remaining)              ; simpler
        )
      )
    )
  )
)

; insert a new string into the BST, using standard algorithm
; params: root: root of BST
;         values: remaining list of strings to be inserted
; return: a BST
(define add-to-bst (lambda (root value)
    ; we use root-val, left, and right, a couple times
    ; so compute once, use many
    (let ((root-val (car root)) (left (car (cdr root))) 
                                (right (car (cdr (cdr root)))))
       (if (string<? value root-val)                        ; do we go left?
          (if (null? left)                                  ;   at bottom?
             (list root-val (list value '() '()) right)     ;     yes, add node
             (list root-val (add-to-bst left value) right)  ;     no, recurse
          )                                                 ; else going right 
          (if (null? right)                                 ;   at bottom?
             (list root-val left (list value '() '()))      ;     yes, add node
             (list root-val left (add-to-bst right value))  ;     no, recurse
          )
       )
       ; Note we are rebuilding each node as we move back up the tree
       ; This is because we cannot modify a node, only create a new one to
       ; replace it
    )
  )
)

; Determine if a key is in the BST.  Use standard search algorithm
; params: root: root of BST
;         key: key to find
; return: "Key found!" if key is in BST and "Key not found" if not.
(define find-in-bst (lambda (root key)
    (if (null? root)                  ; standard base case (empty root)
      "Key not found"
      (let ((root-val (car root)) (left (car (cdr root))) 
                                  (right (car (cdr (cdr root)))))
        ; computed root-val, left, and right to make code nicer
        (if (equal? key root-val)      ; have we found the key?
          "Key found!"                 ;   yes
          (if (string<? key root-val)  ;   no, do we go left right?
             (find-in-bst left key)    ;     yes, recurse left
             (find-in-bst right key)   ;     no, recurse right
          )
        )
      )
    )
  )
)

; insert a BST to find size
; params: root: root of BST
; return: a size of BST
(define get-bst-size (lambda (root)
        (- (get-bst-size-helper root 0) 1)           
    )
)

; recursive helper used to iterate over the list and find size from BST
; params: root: root of BST
;         size: counted number from recursion
; return: a size
(define get-bst-size-helper (lambda (root size)
        (if (null? root)
            size
            (let ((left (car (cdr root))) (right (car (cdr (cdr root)))))               
                (+ (get-bst-size-helper left 1) (get-bst-size-helper right 1)) ; sum left recursion and right recursion
            )      
        )                         
    )
)

; insert a BST to find height
; params: root: root of BST
; return: a height of BST
(define get-bst-height (lambda (root)
        (get-bst-height-helper root 0)             
    )
)

; recursive helper used to iterate over the list and find height from BST
; params: root: root of BST
;         height: counted number from recursion
; return: a height
(define get-bst-height-helper (lambda (root height)
        (if (null? root)
            height ; base case return height
            (let ((left (car (cdr root))) (right (car (cdr (cdr root))))) ; computed left and right root
                (max (get-bst-height-helper left (+ height 1)) ; recurse left and height++
                    (get-bst-height-helper right (+ height 1)) ; recurse right and height++
                )                                              ; find max height on tree from recursion
            )
        )              
    )
)

; Run tests on BST and display size
; params: none
; return: none
(define test-size (lambda ()
        (display "Test get-bst-size")
        (newline)
        (display (get-bst-size (load-bst '())))
        (newline)
        (display (get-bst-size (load-bst '("Me"))))
        (newline)
        (display (get-bst-size (load-bst '("Me" "How" "You" "Tau" "Jade" "Awesome" "Good"))))
        (newline)
        (display (get-bst-size (load-bst '("Me" "How" "You" "Tau" "Jade" "Awesome" "Zoo"))))
        (newline)               
    )
)

; Run tests on BST and display heights
; params: none
; return: none
(define test-height (lambda ()
        (display "Test get-bst-height")
        (newline)
        (display (get-bst-height (load-bst '())))
        (newline)
        (display (get-bst-height (load-bst '("Me"))))
        (newline)
        (display (get-bst-height (load-bst '("Me" "How" "You" "Tau" "Jade" "Awesome" "Good"))))
        (newline)
        (display (get-bst-height (load-bst '("Me" "How" "You" "Tau" "Jade" "Awesome" "Zoo"))))
        (newline)               
    )
)

; Run tests on BST and display results
; params: none
; return: none
(define testme (lambda ()
    (display (load-bst '()))
    (newline)
    (display (load-bst '("Me")))
    (newline)
    (display (load-bst '("Me" "How" "You" "Tau" "Jade" "Awesome")))
    (newline)
  )
)

; Run test from console
; Input consists of a list and a line
;   - List of words to be inserted into a BST, terminated by "end"
;   - Line consists of key to search for in the BST
; params: none
; return: none
(define load-from-console (lambda ()
    (define bst-root (load-bst (getlist)))
    (display (find-in-bst bst-root (getline)))
    (newline)
  )
)

(testme)
(test-size)
(test-height)
(exit)
