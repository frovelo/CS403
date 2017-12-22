;;  Author: Francisco Rovelo
;;  Class: CS403(ProgLang), Dr. John Lusth | Fall, 2017
;;  Assignment: 3, task1.scm
;;  Date: Last Updated-> Nov 17th, 2017
;;  About:
;;		Define a function named staticScope, which, when given an object, displays all the bindings in the static chain of that
;;		procedure object. The variable this is always bound to the current static scope. The cadr of this yields the set of
;;		variables bound in the current scope, while the caddr yields the corresponding list of variable values. The cadr of the
;;		list of values yields the enclosing static scope
;;

(define (main)
	(setPort (open (getElement ScamArgs 1) 'read))
 	(define func (readExpr))
    (define  funcCall (readExpr))
    (eval func this)
   	(eval funcCall this)
)

(define (getStaticScopes scope)
	(define nextScope (cadr  (caddr scope)))
	(cond
		((not (null? nextScope))
			(begin 
				(println (car nextScope))
				(+ 1 (getStaticScopes nextScope ))
			)
		)
		(else
			(+ 0 0)
		)
	)
)

(define (staticScope levels scope)
	(define (staticScope-iter levels scope counter)
		(define (printValues vars vals)
			(cond
				((not (null? vars))					
					(begin
						(print "    " (car vars) " : ") 
						(println (car vals)) 
						(printValues (cdr vars) (cdr vals))
					)
				)
				(else
					nil
				)
			)
		)
		;; helper defines
		(define currentLevel (caddr (caddr scope)))
		(define vars (cdr (cddddr (cadr scope))))
		(define vals (cdr (cddddr (caddr scope))))
		(define nScope (cadr  (caddr scope)))	;next scope
		;;end
		(if (not (= 0 levels))
			(begin
				(print "#[environment L" counter) (println "]")
				(printValues vars vals)
				(staticScope-iter (- levels 1) nScope (+ counter 1))
			)
			nil
		)
	)
	(staticScope-iter levels scope 0)
)
