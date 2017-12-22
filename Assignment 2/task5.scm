;;	Author: Francisco Rovelo
;;	Class: CS403(ProgLang), Dr. John Lusth | Fall, 2017
;;	Date: Last Updated Oct 17th, 2017

(define (main)
	(setPort (open (getElement ScamArgs 1) 'read))
	(eval (readExpr) this)
	(eval (readExpr) this)
	(eval (readExpr) this)
	(eval (readExpr) this)
	(println (((add num1 num2) inc) base))
	(println (((multiply num1 num2) inc) base))
)

(define (multiply a b)
    (lambda (f)
        (lambda (func)
            ((a (b f)) func)
        )
    )
)

(define (add a b)
    (lambda (f)
        (lambda (func)
            ((a f)((b f) func))            
        )
    )
)

(define (increment number)      ;Doesn't get used
    (lambda (incrementer) 
        (define (resolve basenum)
            (incrementer ((number incrementer) basenum))
        )
        resolve
    )
)
