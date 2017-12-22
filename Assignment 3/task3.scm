;;  Author: Francisco Rovelo
;;  Class: CS403(ProgLang), Dr. John Lusth | Fall, 2017
;;  Assignment: 3, task3.scm
;;  Date: Last Updated-> Nov 20th, 2017
;;  About:
;;		Define a function, named bst, that constructs a binary search tree. The object that the constructor returns should
;; 		implement the basic BST methods: size, insert, find, delete, root, walk, and next. The size method should return the
;; 		number of nodes in the tree. The root method should return the key stored at the root of the tree. The find method
;; 		should return the value associated with the given key and nil if the key is not in the tree. The behavior of the walk
;; 		method is to return the “least” value in the BST, according to the comparator passed to the constructor. The next
;; 		method should return the next value in an in-order traversal of the tree, with subsequent nodes being visited with
;; 		each successive call to next. The next method should return nil when the search is exhaused If an insertion or deletion
;; 		occurs in the middle of the traversal, the behavior of next is unspecified. Note that having find and next return nil is a
;; 		particularly bad design choice because it disallows nil values being stored in the tree (but it simplifies your task).

(define (main)
	(setPort (open (getElement ScamArgs 1) 'read))
	(define insertList (readExpr))
	(define (insert-iter tree list)
		(if (null? list)
			tree
			(begin
				(insert-iter (tree 'insert (caar list) (cadr (car list))) (cdr list))
			)
		)
	) 

	(define (walk-main tree)
		(define (walk-iter)
			(define value (tree 'next))
				(if (eq? nil value)
					()
					(begin
						(println value)
						(walk-iter)
					)
				)
		)
		(if (eq? nil (tree 'root))
			()
			(begin
				(println (tree 'walk))
				(walk-iter)
			)
		)
	)   

	(define tree (bst <))
	(insert-iter tree insertList)
	(println "First walk:")
	(walk-main tree)
	(tree 'delete (tree 'root) equal?)
	(println "Second walk:")
	(walk-main tree)
)

(define (Queue)
	(define front (list 'head))
	(define back nil)
	(define (this msg @)
		(cond
			((eq? msg 'enqueue) (enqueue @))
			((eq? msg 'dequeue) (dequeue))
			((eq? msg 'empty?) (empty?))
			(else 
				(error "queue message not understood: " msg))
		)
	)
	(define (enqueue x) ; add to the back
		(set-cdr! back (list x))
		(set! back (cdr back))
	)

	(define (dequeue)
		(define tmp (cadr front))
		(set-cdr! front (cddr front))
		(if (null? (cdr front))
			(set! back front)
		)
		tmp
	)
	(define (empty?)
		(eq? (cdr front) nil)
	)

	(set! back front)
	this
)

(define (setKey x val) (set-car! x val))
(define (setValue x val) (set-car! (cdr x) val))
(define (setLeftChild x val) (set-car! (cddr x) val))
(define (setRightChild x val) (set-car! (cdddr x) val))
(define (getKey list) (car list))
(define (getValue list) (cadr list))
(define (getLeftChild list) (car (cddr list)))
(define (getRightChild list) (car (cdddr list)))

(define bstree nil)
(define (bst comparator)
	(define queue (Queue))
	(define (insert key value)
		(define (insert-helper tree)
			(if (comparator key (getKey tree))
				(if (null? (getLeftChild tree))
				  	(setLeftChild tree (list key value nil nil))
				  	(insert-helper (getLeftChild tree))
				)
				(if (null? (getRightChild tree))
				  	(setRightChild tree (list key value nil nil))
				  	(insert-helper (getRightChild tree))
				)
			)
		)

		(if (null? bstree)
		  	(set! bstree (list key value nil nil))
		  	(insert-helper bstree)
		)
		;(inspect bstree)
		(bst comparator)
	)

	;Recurs down the tree adding each non-null node to a total
	(define (size)
		(define (size-iter tree total)
		  	(if (null? tree)
				0
				(+ 1 (size-iter (getLeftChild tree) (+ total 1)) (size-iter (getRightChild tree) (+ total 1)))
		  	)
		)
		(if (null? bstree)
		  	0
		  	(size-iter bstree 0)
		)
	)

	(define (find key comp)
		(define (find-iter tree)
		  	(if (null? tree)
				nil
				(if (comp (getKey tree) key)
			  		(getValue tree)
			  		(if (comparator key (getKey tree))
						(find-iter (getLeftChild tree))
						(find-iter (getRightChild tree))
			  		)
				)
		  	)
		)
		(find-iter bstree)
	)

	(define (delete key comp)
		(define (min-value parent node)
		  	(define (min-iter p n)
				(if (valid? (getLeftChild n))
			  		(min-iter n (getLeftChild n))
			  		(begin
						(define returnValue (list (getKey n) (getValue n)))
						(setLeftChild p nil)
						returnValue
			  		)
				)
		  	)
		  	(if (null? (getLeftChild (getRightChild node)))
				(begin
			  		(define returnValue (list (getKey (getRightChild node)) (getValue (getRightChild node))))
			  		(setRightChild node nil)
			  		returnValue
				)
				(min-iter node (getRightChild node))
		  	)
		)

		(define (parent-pointer node)
			;If no children, return nil
			(if (eq? nil (getLeftChild node) (getRightChild node))
				nil
				(if (eq? nil (getLeftChild node))
					(getRightChild node)
					(if (eq? nil (getRightChild node))
						(getLeftChild node)
						node
					)
				)
			)

		  ; 	(cond
				; ;If no children, return nil
				; ((eq? nil (getLeftChild node) (getRightChild node)) nil)
				; ((eq? nil (getLeftChild node)) (getRightChild node))
				; ((eq? nil (getRightChild node)) (getLeftChild node))
				; (else
				;   	node
				; )
		  ; 	)
		)

		(define (delete-helper parent node flag)
			(define temp (parent-pointer node))
		  	(cond
				;Deleting the root
				((= flag -1)
			  		(if (not (eq? temp node))
						(begin
				  			(set! bstree temp)
						)		
						(begin
				  			(define temp2 (min-value parent node))
				  			(setKey bstree (car temp2))
				  			(setValue bstree (cadr temp2))
						)
			  		)
				)
				;Deleting a left child
				((= flag 0)
			  		(if (not (eq? temp node))
						(begin
				  			(setLeftChild parent temp)
				  		)
						(begin
				  			(define temp2 (min-value parent node))
				  			(setKey node (car temp2))
				  			(setValue node (cadr temp2))
						)
			  		)
				)
				;Deleting a right child
				((= flag 1)
			  		(if (not (eq? temp node))
						(begin
				  			(setRightChild parent temp)
				  		)
						(begin
				  			(define temp2 (min-value parent node))
				  			(setKey node (car temp2))
				  			(setValue node (cadr temp2))
						)
			  		)
				)
		  	)
		)

		;Moves through the tree searching for the node to be deleted, calls
		;delete-helper when it finds it
		(define (delete-iter tree)
		  	(if (null? tree)
				nil
				(cond
			  		((and (valid? (getLeftChild tree)) (comp (getKey (getLeftChild tree)) key)) (delete-helper tree (getLeftChild tree) 0))
			  		((and (valid? (getRightChild tree)) (comp (getKey (getRightChild tree)) key)) (delete-helper tree (getRightChild tree) 1))
			  		(else
						(if (comparator key (getKey tree))
				  			(delete-iter (getLeftChild tree))
				  			(delete-iter (getRightChild tree))
						)
			  		)
				)
		  	)
		)

		(if (null? bstree)
			nil
			(if (comp (getKey bstree) key)
			  	(delete-helper bstree bstree -1)
			  	(delete-iter bstree)
			)
		)
	)

	;Needs to enqueue all nodes
	(define (walk)
		;Performs an inorder traversal
		(define (walk-iter tree)
			;(inspect tree)
			(if (valid? (getLeftChild tree))
				(walk-iter (getLeftChild tree))
				()
		  	)
		 	;(inspect (getValue tree))
		  	((queue 'enqueue) (getValue tree))
		  	(if (valid? (getRightChild tree))
				(walk-iter (getRightChild tree))
				()
		  	)
		)

		(if (null? bstree)
		 	nil
		  	(begin
				(walk-iter bstree)
				((queue 'dequeue))
		  	)
		)
	)

	(define (root)
		(if (null? bstree)
		  	nil
		  	(getKey bstree)
		)
	)

	(define (next)
		(if ((queue 'empty?))
			nil
			((queue 'dequeue))
		)
	)

  	;dispatch function
  	(define (dispatch op @)
		(cond
	  		((eq? op 'size) (size))
	  		((eq? op 'insert) (apply insert @))
	  		((eq? op 'find) (apply find @))
	  		((eq? op 'delete) (apply delete @))
	  		((eq? op 'root) (root))
	  		((eq? op 'walk) (walk))
	  		((eq? op 'next) (next))
	  		(else
				(error "UNKNOWN BST OPERATION" op))
		)
  	)
  	dispatch
)
