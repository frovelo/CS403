;;  Author: Francisco Rovelo
;;  Class: CS403(ProgLang), Dr. John Lusth | Fall, 2017
;;  Assignment: 3, task5.scm REDO
;;  Date: Last Updated-> Nov 6th, 2017
;;  About:
;;		 Define a synchronization barrier object using using Scam’s binary semaphore. Name this function barrier. You can use
;;		 the gettid function to access the ID of the thread asking for the semaphore.
;;
;;		 (define b (barrier 3)) ; make a barrier for three threads
;;		 ...
;;		 ((b'start))
;;		 ...
;;		 ((b'finish))
;;		 For this example, once three threads reach the starting point, the barrier is opened and the three threads (and only
;;		 those three threads) can pass. When those three threads reach the finish line, three more threads can pass (and so on).


;;  Previous Comments:
;;			barrier is too similar to another student's implementation, the test FAILED
;;   			 - please see me to explain
;;
;;			barrier appears to be correct 

(define (barrier x)
	(define threadList '())
	(define workingList '())
	(define isWorking? 0)	;condition variable?

	;(println "Inside Barrier: " (gettid))
	(define (barrierHelper method)
		(if (equal? method 'start)
			(begin ;'start method
				;(println "inside barrierHelper, I am: " (gettid))
				(lock)
				;(println "Inside method = 'start")
				(if (not (member? (gettid) threadList)) ;check if current thread is already waiting
					(begin 
						;(println "Inside not member")
						(set! threadList (append threadList (list (gettid)))) ;add it
						(unlock)
						(barrierHelper 'start)
					)
					(begin
						;(println "Inside I'm a member")
						; (inspect isWorking?)
						; (inspect x)
						; (inspect (length threadList))

						(if (= isWorking? x) ;a wave of threads are already working
							(begin
								;(println "working is x!")
								(unlock)
								(barrierHelper 'start)
							)
							(if (not (>= (+ (length threadList) isWorking?) x)) ;not enough to allow a wave through
								(begin
									;(println "not enough threads to go :(!")
									(unlock)
									(barrierHelper 'start)
								)
								(if (= (gettid) (car threadList))
									(begin
										;(println "alright we're doing this!: " (gettid))
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
				; (println "I'm inside finish: " (gettid))
				(lock)
				(if (and (= (length workingList) 1) (= isWorking? x)) ;check to see if current thread is last one running
					(begin
						; (println isWorking? " of " x " amount of threads have finished -> click enter to continue")
						; (pause)
						(set! workingList '())
						(set! isWorking? 0)
						(unlock)
					)
					(begin
						(if (> (length workingList) 1)	;not last one running so remove an item from list
							(set! workingList (cdr workingList))
							(set! workingList '())								
						)
						(unlock)
					)
				)
			)
		)
	)
)