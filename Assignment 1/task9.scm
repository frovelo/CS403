(define (main)
    (setPort (open (getElement ScamArgs 1) 'read))
    (define args (readExpr))
    ;(println (apply zeno (readExpr)))
    (println "mystery returns " (mystery (car args)))
 	(println "imystery returns " (imystery (car args)))
 	(println "$\\sqrt{e}$")
)

(define (mystery n)
	(define ( myst-r i)
		(if(< i (+ n 1))
			(/ 1.0 (+ ( + 1.0 ( * 4 (- i 1))) (/ 1.0 (+ 1 (/ 1.0 ( + 1 ( myst-r ( + i 1))))))))
			0
		)
	)
	(+ 1.0 (myst-r 1.0))
)

(define (imystery n)
	(define(myst-iter depth sum)
		(if( > depth 0)
			(myst-iter (- depth 4) (/ 1.0 (+ depth (/ 1.0 ( + 1 ( / 1.0 ( + 1 sum)))))))
			(+ sum 1)
		)
	)
	(if( = n 0)
		1.0
		(myst-iter (+ 1.0 (* 4.0 ( - n 1))) 0)
	)
)