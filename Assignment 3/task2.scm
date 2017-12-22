;;  Author: Francisco Rovelo
;;  Class: CS403(ProgLang), Dr. John Lusth | Fall, 2017
;;  Assignment: 3, task2.scm
;;  Date: Last Updated-> Nov 16th, 2017
;;  About:
;;        Define a function named compile that replaces all the non-local variables in a function body with the values found in
;;        the definition environment. Should any of those values be function objects themselves, those objects would need to be
;;        compiled as well. The compile function should return its modified argument. The behavior of the compiled function
;;        must be unchanged, except it should run faster. You can retrieve the body and definition environment of a function
;;        with:
;;            (define body (get 'code square))
;;            (define denv (get '__context square))
;;        respectively.

(include "pretty.lib")

(define (main)
    (setPort (open (getElement ScamArgs 1) 'read))
    (define func (eval (readExpr) this))
    (compile func)
    (pretty func)
)

(define (compile func)
    (define denv (get '__context func))
    (define body (get 'code func))
    (define parameters (get 'parameters func))
    (define (compile-iter x)
        (if (member? x parameters)
            x
            (if (eq? 'begin x)
                x
                (if (pair? x)
                    (if (eq? (car x) 'quote) ; this quote angered me
                        (cons (compile-iter (car x)) (cdr x))
                        (cons (compile-iter (car x)) (compile-iter (cdr x)))
                    )
                    (if (not (symbol? x))
                        nil
                        (begin
                            (define temp (catch (eval x denv)))
                            ; (cond 
                            ;     ((error? x) temp)
                            ;     ((closure? temp) (compile x ) x)
                            ;     (else 
                            ;         x
                            ;     )
                            ; )
                            (cond 
                                ((error? temp) x)
                                ((closure? temp) (compile temp ) temp)
                                (else 
                                    temp
                                )
                            )
                        )
                    )
                )
            )
        )
    )
    (define new (compile-iter body))
    (set-car! body (car new))
    (set-cdr! body (cdr new))
)
