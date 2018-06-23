(define (accumulate combiner start n term)
  (if (= n 0)
      start
      (combiner (term n) (accumulate-tail combiner start (- n 1) term))
  )
)

(define (accumulate-tail combiner start n term)
	(define (accumulate-tail-helper combiner n term total)
		(if (= n 0)
  		total
  		(accumulate-tail-helper combiner (- n 1) term (combiner total (term n)))
	))
		(accumulate-tail-helper combiner n term start)
)

(define-macro (list-of expr for var in seq if filter-fn)
	`(map (lambda (,var) ,expr)
		(filter (lambda (,var) ,filter-fn) ,seq)
	)
)