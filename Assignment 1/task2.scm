(define (main)
    (setPort (open (getElement ScamArgs 1) 'read))
    (println (apply minMaxSum (readExpr)))
)

(define (minMaxSum a b c)
	(if (< a b)
		(if (< b c)
			( + a c)	; a < b < c
			(if (< a c)
				(+ a b)		; a < c < b
				(+ c b)		; c < a < b
			)
		)
	;--------------------------; ! < a b
		(if (< a c)
			( + b c)	; b < a < c
			(if (< b c)
				(+ a b)		; b < c < a
				(+ c a)		; c < b < a
			)
		)
	)
)
