(define (main)
    (setPort (open (getElement ScamArgs 1) 'read))
    (println (apply zarp (readExpr)))
)

(define (zarp i)
	(define (zarp-iter a b c i)
		(if (< i 3)
			c
			(zarp-iter b c (- (+ ( *  b 2 ) c) a) (- i 1))
		)
	)

	(if (< i 3)
		i
		(zarp-iter 0 1 2 i)
	)
)

;-------------- recursion -------------;
;(- (+ ( * (zarp (- i 2)) 2 ) (zarp (- i 1))) (zarp (- i 3)))
