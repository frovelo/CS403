;;	Author: Francisco Rovelo
;;	Class: CS403(ProgLang), Dr. John Lusth | Fall, 2017
;;	Date: Last Updated-> Oct 19th, 2017

(define (main)
	(setPort (open (getElement ScamArgs 1) 'read))
	(define func (readExpr))
	(define args (readExpr))
	(println (apply map+ (cons (eval func this) args)))
)

(define (map+ func @)
	(define (map-iter cur arglist)
		(cond 
			((nil? (car arglist)) cur)	;; if car arglist, nil? -> return cur or '()
			(else
				(map-iter (append cur (list (apply func (map (lambda (l) (car l)) arglist))))		;; call map-iter with lambda(l) and arglist
					(map (lambda(l) (cdr l)) arglist)	;; maps (lambda(l) (cdr l)) with arglist
				)										;; a list of list can be passed to map as a single list
			)
		)
	)
	(map-iter '() @)	;; call helper iterative function with empty list and varadic amount of args
)
