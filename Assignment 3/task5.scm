;;  Author: Francisco Rovelo
;;  Class: CS403(ProgLang), Dr. John Lusth | Fall, 2017
;;  Assignment: 3, task5.scm REDO
;;  Date: Last Updated-> Nov 27th, 2017

;;  Previous Comments:
;;			barrier is too similar to another student's implementation, the test FAILED
;;   			 - please see me to explain

(define (barrier x)
	(define threadList '())
	(define workingList '())
	(define isWorking? 0)	;condition variable?

	(define (barrierHelper method)
		(if (equal? method 'start)
			(begin ;'start method
				(lock)
				(if (not (member? (gettid) threadList)) ;check if current thread is already waiting
					(begin 
						(set! threadList (append threadList (list (gettid)))) ;add it if not
						(unlock)
						(barrierHelper 'start)
					)
					(begin
						(if (= isWorking? x) ;a wave of threads are already working so recall 'start method
							(begin
								(unlock)
								(barrierHelper 'start)
							)
							(if (not (>= (+ (length threadList) isWorking?) x)) ;not enough to allow a wave through, recall 'start method
								(begin
									(unlock)
									(barrierHelper 'start)
								)
								(if (= (gettid) (car threadList)) ;ya! we have enough so lets do a FCFS addition to working list
									(begin
										(set! isWorking? (+ isWorking? 1))	;condition variable?
										(set! workingList (append workingList (list (car threadList))))
										(set! threadList (cdr threadList))
										(unlock)
									)
									(begin
										(unlock)
										(barrierHelper 'start)
									)
								)
							)
						)
					)
				)
			) ;end 'start method
			(begin ;'finish method
				(lock)
				(if (and (= (length workingList) 1) (= isWorking? x)) ;check to see if current thread is last one running
					(begin
						(set! workingList '())
						(set! isWorking? 0)
						(unlock)
					)
					(begin
						(if (> (length workingList) 1)	;not last one running so remove an item from list
							(set! workingList (cdr workingList)) ;these get removed in no particular order because idk what workingThread will hit it first
							(set! workingList '()) ; i dont think this will ever happen
						)
						(unlock)
					)
				)
			)
		)
	)
)