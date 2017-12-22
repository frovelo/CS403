(define (main)
    (setPort (open (getElement ScamArgs 1) 'read))
    (println (apply zeno (readExpr)))
)

(define (zeno d n c)
	(if (> n 1)
		(+ (/ (^ c (/ (log (/ d 2.0)) (log 2.0))) 12.0) (zeno (/ d 2.0) (- n 1) c))
		(/ (^ c (/ (log d) (log 2.0))) 12.0)
	)
)