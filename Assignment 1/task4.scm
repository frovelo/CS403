(define (main)
    (setPort (open (getElement ScamArgs 1) 'read))
    (println (apply root12 (readExpr)))
)

(define (root12 x)
	(define (rt-iter guess x)
		(if (good-enough? guess x)
			guess
			(rt-iter (improve guess x) x)
		)
	)
	(define (improve guess x)
		(if( = x 0)
			(return (real x))
			(/ (+ (* 11.00 guess) (/ x (^ guess 11.00))) 12.0)
		)
	)
	(define (good-enough? guess x)
		(< (abs (/ (- (^ guess 12) x) x)) 0.00000000001) ; 0.00000001?
	)

	(rt-iter 1.0 x)
)
