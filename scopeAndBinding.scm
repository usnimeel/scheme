; Let's see which scoping and binding are used at the scheme interpreter 

(define func (lambda ()
        (let ((num 1))                  ; set num to 1
            (define func1 (lambda()
                    (display num)                                   
            ))
            (define func2 (lambda()
                (let ((num 2))          ; set num to 2
                    (func3 func1)   
                )                                     
            ))
            (define func3 (lambda(f)
                (let ((num 3))          ; set num to 3
                    (f)                
                )                                     
            ))
            (func2)                     ; call func2
        )
    ) 
)

(func) ; output: 1

; Lexical Scope uses the context where a variable or function is defined, 
; and Dynamic Scope uses the context where the variable or function is called. 
; In this expression, the output is 1 because it uses variable where it is defined.

; The Shallow binding take and use the value where it was called most recently and 
; The Deep binding take and use the value defined at the top of the structure.
; func() return the output 1 which is the value defined at the top of the structure. 

; Therefore, The scheme language uses Lexical Scoping and Deep Binding.