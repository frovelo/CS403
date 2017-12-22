;;	Author: Francisco Rovelo
;;	Class: CS403(ProgLang), Dr. John Lusth | Fall, 2017
;;	Date: Last Updated-> Oct 15th, 2017

(define (main)
    (setPort (open (getElement ScamArgs 1) 'read))
    (define func (readExpr))
 	(define first (apply pfa (cons (eval func this) (readExpr))))
 	(define second (apply first (readExpr)))
	(println second)
)

(define (pfa func @)
	(define len (length (get 'parameters func)))
	(if (< len (length @))
		(throw 'MALFORMED_FUNCTION_CALL "too many arguments")
		(lambda ($) 
			(define args (append @ $))
			(cond 
				((> len (length args)) (throw 'MALFORMED_FUNCTION_CALL "too few arguments"))
				((< len (length args)) (throw 'MALFORMED_FUNCTION_CALL "too many arguments"))
				(else 
					(apply func args)
				)
			)
		)
	)
)

;; wrong main
; (define (main)
;     (setPort (open (getElement ScamArgs 1) 'read))
;     (define func (readExpr))
;  	(define first (readExpr))
;  	(define second (readExpr))
;  	(cond
;  		((< (length (get 'parameters (eval func this))) (length (append first second)))
; 			(throw 'MALFORMED_FUNCTION_CALL "too many arguments"))
;  		((> (length (get 'parameters (eval func this))) (length (append first second)))
; 			(throw 'MALFORMED_FUNCTION_CALL "too few arguments"))
;  		(else
; 		 	(define f1 (apply pfa (cons (eval func this) first)))
; 		 	(define f2 (apply f1 second))
; 		    (println f2)
;  		)
;     )
; )
