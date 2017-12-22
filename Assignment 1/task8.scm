(define (main)
	(setPort (open (getElement ScamArgs 1) 'read))
	(define args (readExpr))
	(println "half of " (car args) " is " (halve (car args)))
	(println "half of " (cadr args) " is " (halve (cadr args)))
	(println (car args) " squared is " (square (car args)))
	(println (cadr args) " squared is " (square (cadr args)))
	(println (apply babyl args))
)

(define (babyl a b)
	(halve (- (- (square (+ a b)) (square a)) (square b)))
)

(define (square n)
	(define (square-iter i a b )
		(if ( = n i)
			b
			(square-iter (+ i 1) b (- ( + b ( + (+ i 1) (+ i 1))) 1))
		)
	)

	(if (= n 1)
		1
		(square-iter 1 1 1)
	)
)

(define (halve n)
	(define (half-iter i a b c)
		(cond
			((> i a) c)
			((> (+ i i) a) (half-iter 1 (- a i) 0 (+ c b)))
			(else (half-iter (+ i i) a i c))
		)
	)

	(half-iter 1 n 0 0)
)
