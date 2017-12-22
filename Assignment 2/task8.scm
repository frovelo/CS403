;;	Author: Francisco Rovelo
;;	Class: CS403(ProgLang), Dr. John Lusth | Fall, 2017
;;	Date: Last Updated Oct 21th, 2017

(define (main)
	(setPort (open (getElement ScamArgs 1) 'read))
	(define a (readExpr))
	(define b (readExpr))
	(println ( extract a b))
)

;; An 'h, take car; 't, take cdr
;; (extract 't '(1 2 3 4)) -> (2 3 4)
;; (extract 'th '(1 2 3 4)) -> 2
;; (extract 'ht '((1) 2 3 4)) -> nil

(define (extract i t)
	(define (extract-iter stringPhrase stringList)
		(cond
			((null? stringPhrase) stringList) ;; if the string is empty return list
			((equal? "h" (car stringPhrase)) (extract-iter (cdr stringPhrase) (car stringList)))	;; if 'h, car
			((equal? "t" (car stringPhrase)) (extract-iter (cdr stringPhrase) (cdr stringList)))	;; if 't cdr
		)
	)
	(extract-iter (string i) t)
)
