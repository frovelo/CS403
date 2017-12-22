(define (main)
	(define (divergence x y t)
    	(define (colorhandler i)
    		(println i " " (mred i t) " " (mgreen i t) " " (mblue i t))
    	)
    	(colorhandler (resistance x y t))
    )

    (setPort (open (getElement ScamArgs 1) 'read))
    (apply divergence (readExpr))
)

(define (resistance x y t)
	(define (res-iter r s x y i t)
		(cond
			((> (+(* r r) (* s s)) 4) i)
			((= t i) t)
			(else (res-iter (+ (- (* r r) (* s s)) x) (+ (* 2 r s) y) x y (+ i 1) t))
		)
	)
	(res-iter 0.0 0.0 x y 0 t)
)

(define (mred i t)
	(if (= i t)
		0
		( int (+ (* (cos (/ (* i 3.14159265358979323846) (* 2 (- t 1)))) 255) 0.5))
	)
)

(define (mgreen i t)
	(if (= i t)
		0
		( int (+ (* (sin (/ (* i 3.14159265358979323846) (* 1 (- t 1)))) 255) 0.5))
	)
)

(define (mblue i t)
	(if (= i t)
		0
		( int (+ (* (sin (/ (* i 3.14159265358979323846) (* 2 (- t 1)))) 255) 0.5))
	)
)
