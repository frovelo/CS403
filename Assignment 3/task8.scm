;;  Author: Francisco Rovelo
;;  Class: CS403(ProgLang), Dr. John Lusth | Fall, 2017
;;  Assignment: 3, task8.scm
;;  Date: Last Updated-> Nov 6th, 2017
;;  About: 
;;          I didn't feel like typing out the 'about' for this one

(define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define outPrint (readExpr))
        (define x (real (readExpr)))
        (define y (real (readExpr)))
        (print "sum returns ")
        (stream-display outPrint (sum x y))
        (println)
        (print "psum returns ")
        (stream-display outPrint (psum x y))
        (println)
        (print "acc-psum returns ")
        (stream-display outPrint (acc-psum x y))
        (println)
        (print "super-acc-psum returns ")
        ;(stream-display outPrint (super-acc-psum x y))
        (stream-display outPrint (super-acc-psum x y))
        (println)

)
;; helper functions
(define scons cons-stream)
(define scar stream-car)
(define scdr stream-cdr)
(define (scadr s) (scar (scdr s)))
(define (scddr s) (scdr (scdr s)))
(define (scaddr s) (scar (scddr s)))
(define (scdddr s) (scdr (scddr s)))
(define (stream-map f s) (scons (f (scar s)) (stream-map f (scdr s))))
(define ints (scons 1 (stream-add ones ints)))
(define ones (scons 1 ones))

(define (stream-add s t)
    (scons (+ (scar s) (scar t)) (stream-add (scdr s) (scdr t)))
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

(define (accelerate s)
        (define stream0 (scar s))
        (define stream1 (scar (scdr s)))
        (define stream2 (scar (scdr (scdr s))))
        (define denom (+ stream0 (* -2 stream1) stream2))
        (cond
            ((= denom 0) (scons stream0 (accelerate (scdr s))))
            (else
                (scons (- stream2 (/ (* (- stream2 stream1) (- stream2 stream1)) denom)) (accelerate (scdr s)))
            )
        )
)
;;end helper functions
(define (sum x y)
    (define (helper x y ints)
        (scons (* (^ -1.0 (+ (scar ints) 1.0)) (/ (real x) (^ (real y) (scar ints)))) (helper x y (scdr ints)))
    )
    (helper x y ints)
)

(define (psum x y)
    (scons (scar (sum x y)) (stream-add (psum x y) (scdr (sum x y))))
)

(define (acc-psum x y)
        (accelerate (psum x y))
)

(define (super-acc-psum x y)
        (define (tableauThisBitchUp s accel)
                (scons (scar s) (tableauThisBitchUp (accel s) accel))
        )
        (tableauThisBitchUp (psum x y) accelerate)
)

; (include "streamUtils.scm")
; (define (main)
;         (setPort (open (getElement ScamArgs 1) 'read))
;         (define howMany? (readExpr))
;         (define x (real (readExpr)))
;         (define y (real (readExpr)))
;         (print "sum returns ")
;         (stream-display howMany? (sum x y))
;         (print "psum returns ")
;         (stream-display howMany? (psum x y))
;         (print "acc-psum returns ")
;         (stream-display howMany? (acc-psum x y))
;         (print "super-acc-psum returns ")
;         (stream-display howMany? (stream-map scar (super-acc-psum x y)))
; )
