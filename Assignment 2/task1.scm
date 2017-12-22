;;	Author: Francisco Rovelo
;;	Class: CS403(ProgLang), Dr. John Lusth | Fall, 2017
;;	Date: Last Updated-> Oct 15th, 2017

(define (main)
	(setPort (open (getElement ScamArgs 1) 'read))
	(define first (readExpr))
	(define f (readExpr))
	(apply n-loop (cons (eval first this) f))
)

(define (n-loop f @)
	(define (nloop-iter func args limit templist)
		(if ( < args limit)
			(begin 
				(if (null? templist) 
					(func args)
					(nloop-iter (lambda (@) (apply func(cons args @))) (car (car templist)) (getElement (car templist) 1) (cdr templist))
				)
				(nloop-iter func (+ args 1) limit templist)
			)
		)
	)
	(nloop-iter f (car (car @)) (getElement (car @) 1) (cdr @))	;; call nloop-iter with f, args = first, first item in @
)
