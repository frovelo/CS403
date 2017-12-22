;;  Author: Francisco Rovelo
;;  Class: CS403(ProgLang), Dr. John Lusth | Fall, 2017
;;  Date: Last Updated-> Oct 13th, 2017

(define (main)
  (setPort (open (getElement ScamArgs 1) 'read))
  (define infix (list (readExpr)))
 	(println (apply infix->postfix infix))
 )

(define (infix->postfix infix)
  ;; helper functions 
  (define (precedence val)
    (cond
      ((equal? val '+) 1)
      ((equal? val '-) 2)
      ((equal? val '*) 3)
      ((equal? val '/) 4)
      ((equal? val '^) 5)
      (else
        0  ; val is a number/variable
      )
    )
  )
  ;;end helper functions
  
	(define (iter-inpost pfl opl infix)
    ; notice that I have to reverse list because I cons in the wrong order and was too lazy to fix it
    (cond
      ((null? infix) (append (reverse pfl) opl))
      ((equal? (precedence (car infix)) 0) (iter-inpost (cons (car infix) pfl) opl (cdr infix))) ; add variable/num to pfl)
      (else
        (cond
          ((null? opl) (iter-inpost pfl (cons (car infix) opl) (cdr infix))) ;add op to opl
          ((>= (precedence (car opl)) (precedence (car infix))) (iter-inpost (cons (car opl) pfl) (cdr opl) infix))
          (else
            (iter-inpost pfl (cons (car infix) opl) (cdr infix))
          )
        )
      )
    )
  )
  (if (null? infix)
    '()
    (iter-inpost (list (car infix)) (list (car (cdr infix))) ( cdr( cdr infix)))
  )
)
