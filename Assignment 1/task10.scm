(define (main)
    (setPort (open (getElement ScamArgs 1) 'read))
    (define args (readExpr))
    (println "ramanujan returns " (ramanujan (car args)))
    (println "iramanujan returns " (iramanujan (car args)))
    (println "$3$")
)
;idk if the last println is right


(define (ramanujan n)
    (define (ramanujan-recur x y i)
        (if (= i n)
            y
            (* x (sqrt (+ 1 (ramanujan-recur (+ x 1) (+ y 1) (+ i 1)))))
        )
    )
    (cond
        ((= n 0) 0.0)
        ((= n 1) (sqrt 3))
        (else
            (sqrt (+ 1 (ramanujan-recur 2 2 1)))
        ); else thatttttttttttt
    )
)

(define (iramanujan n)
     (define (iram-iter depth hold a)
         (cond
             ((= depth 0) 0.0)
             ((= depth 1) (sqrt (+ a 1)))
             (else
               (iram-iter (- depth 1) a (* depth (sqrt (+ 1 (if (= n a) (+ a 1) a)))))
             )
         )
      )
      (cond
        ((= n 0) 0.0)
        ((= n 1) (sqrt 3))
        (else
          (iram-iter n 1 n)
        )
      )
)
