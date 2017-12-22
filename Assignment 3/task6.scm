;;  Author: Francisco Rovelo
;;  Class: CS403(ProgLang), Dr. John Lusth | Fall, 2017
;;  Assignment: 3, task5.scm
;;  Date: Last Updated-> Nov 6th, 2017
;;  About:
;;      Define a variadic function named pfs that, when given some prime numbers a, b, ..., z, creates an infinite stream of
;;        integers whose only prime factors are a, b, ..., z. These integers should have the form a^A, b^B, c^C...z^Z, where A, B, C and so
;;        on range from 0 upwards (except the exponents cannot all be zero). The numbers in this infinite stream should appear
;;        in ascending order.

(define (main)
    (setPort (open (getElement ScamArgs 1) 'read))
    (define outPrint (readExpr))
    (define factor (readExpr))
    (stream-display outPrint (pfs factor))
    (println)

)

;; helper functions
(define scons cons-stream)
(define scar stream-car)
(define scdr stream-cdr)
(define (stream-scale number stream)
    (scons (* number (scar stream)) (stream-scale number (scdr stream)))
) 

(define (stream-merge stream1 stream2)
    (cond
        ((< (scar stream1) (scar stream2)) (scons (scar stream1) (stream-merge (scdr stream1) stream2)))
        ((> (scar stream1) (scar stream2)) (scons (scar stream2) (stream-merge stream1 (scdr stream2))))
        (else
            (scons (scar stream1) (stream-merge (scdr stream1) (scdr stream2))))
    )
)

(define (stream-display n s)
    (define (stream-helper t c)
        (if (= c 0)
            'OK
            (begin
                (print (stream-car t) " ")
                (stream-helper (stream-cdr t) (- c 1))
            )
        )
    )
    (print "(")
    (stream-helper s n)
    (print "...)")
)
;; end helper functions

(define (pfs @)
        (define (iterative currStream remainList)
                (cond
                    ((not (null? remainList)) (stream-merge (stream-scale currStream s) (iterative (car remainList) (cdr remainList))))
                    (else 
                        (stream-scale currStream s))
                )
        )
        (scdr (define s (scons 1 (iterative (car @) (cdr @)))))
)

; (define (pfs @)
;     (define (pfs-iter args counter s) 
;;    (inspect args)
;;    (inspect counter)
;;    (inspect s)
;         (if ( < counter (length @))
;             (begin 
;                 (define s (smerge (sscale s (inspect(getElement (car @)))) (stream-cdr s)))
;                 (pfs-iter (cdr @) (+ counter 1) s)
;             )
;             s
;         )
;     )
;     (define s2 (cons-stream 1 s2))
;     (pfs-iter @ 0 s2)
; )
