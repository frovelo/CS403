;;	Author: Francisco Rovelo
;;	Class: CS403(ProgLang), Dr. John Lusth | Fall, 2017
;;	Date: Last Updated Oct 19th, 2017
;; 	Note: I wrote this is a mad programming fury one thursday afternoon and blacked-
;;		  out later that night so there's no usefule comments here

(define (main)
  (setPort (open (getElement ScamArgs 1) 'read))
  (println (apply queens (readExpr)))
 )

;; helper functions
(define (getRow pos)
	(car pos)
)

(define (getCol pos)
	(cdr pos)
)

(define (newPosition a b)
	(cons a b)
)

;; (stupid-helper <parameter: Int> <parameter: List>)
;; takes current col and a list of positions to determine if placement is safe
(define (safe? col positions)
	(if (null? positions)
		#t
		(let (
			(cur (car positions))
			(others (cdr positions)))
			(define (attacks? q1 q2)
				(or (= (getCol q1) (getCol q2))
					(= (abs (- (getRow q1) (getRow q2))) (abs (- (getCol q1) (getCol q2))))
				)
			)
			(define (iter q board)
				(or (null? board)
					(and (not (attacks? q (car board)))
						(iter q (cdr board))
					)
				)
			)
			(iter cur others)
		)
	)
)

;; (stupid-helper <parameter: List>)
;; takes the the final answer list and removes the '.' ->(a . b)
(define (stupid-helper solution)
	(define (stupid-iter output input)
		(cond
			((null? input) output)
			(else
				(stupid-iter (append output (list (newPosition (getRow (car input)) (newPosition (getCol (car input)) nil)))) (cdr input))
			)
		)
	)
	(stupid-iter '() solution)
)
;; end helper functions
(define (queens r c flag)
	(define (queen-cols temp queenslist row col) ;flag is start from high col or low call
		;(inspect queenslist)
		;(pause)
		(define temp (append (list (newPosition row col)) temp))
		;(inspect temp)
		;(inspect queenslist)
		(if flag
			(if (safe? col (append temp queenslist))
				(if (= (- r 1) row)
					(append temp queenslist)
					(queen-cols '() (append temp queenslist) (+ row 1) 0 )
				)
				(if (= col (- c 1))
					(if (= (- c 1) (getCol(car queenslist)))
						(if (= (- c 1) (getCol(car (cdr queenslist))))
							(queen-cols '() (cdr (cdr queenslist)) (- row 3) (+ (getCol (car (cdr(cdr queenslist)))) 1))
					    	(queen-cols '() (cdr (cdr queenslist)) (- row 2) (+ (getCol (car (cdr queenslist))) 1))
					    )
						(queen-cols '() (cdr queenslist) (- row 1) (+ (getCol (car queenslist)) 1))
					)  
					(queen-cols '()  queenslist row  (+ col 1))
				)
			)
			(if (safe? col (append temp queenslist))
				(if (= (- r 1) row)
					(append temp queenslist)
					(queen-cols '() (append temp queenslist) (+ row 1) (- c 1))
				)
				(if (= col 0)
					(if (= 0 (getCol(car queenslist)))
						(if (= 0 (getCol (car (cdr queenslist))))
							(queen-cols '() (cdr (cdr queenslist)) (- row 3) (- (getCol (car (cdr(cdr queenslist)))) 1))
					    	(queen-cols '() (cdr (cdr queenslist)) (- row 2) (- (getCol (car (cdr queenslist))) 1))
						)
					    (queen-cols '() (cdr queenslist) (- row 1) (- (getCol (car queenslist)) 1))
					)  
					(queen-cols '()  queenslist row  (- col 1))
				)
			)
		)
	)
 
	(if (or (or (and (= r 3) (= c 3)) (and (= r 2) (= c 2))) (> r c))
		'()	;return no answer if rows > cols
		(if flag
			(stupid-helper (queen-cols '() '() 0 0 ))
			(stupid-helper (queen-cols '() '() 0 (- c 1)))
		)
	)
)
