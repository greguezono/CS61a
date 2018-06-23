(define (find s predicate)
  (cond 
  	((null? s) #f)
  	((predicate (car s)) (car s))
  	(else (find (cdr-stream s) predicate))
  	)
)

(define (scale-stream s k)
  (cond
  	((null? s) nil)
  	(else
  		(cons-stream (* k (car s)) (scale-stream (cdr-stream s) k))
  		)
  )
)

(define (is-inside s lst)
	(cond
		((or (null? s) (null? lst)) #f)
		((eq? s (car lst)) #t)
		(else (is-inside s (cdr lst)))
	)
)


(define (has-cycle s)
(if (null? s) #f

  (define (has-cycle-helper a l)
    	(cond
    		((null? a) #f)
    		((is-inside a l) #t)
    		(else (has-cycle-helper (cdr-stream a) (cons a l)))
    		)
    )
)

  (has-cycle-helper (cdr-stream s) (list s))
)



(define (has-cycle-constant s)
  'YOUR-CODE-HERE
)
