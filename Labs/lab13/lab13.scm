; Q1
(define (compose-all funcs)
  (cond
  	((null? funcs) (lambda (x) x))
  	(else
 		(lambda (x) ((compose-all (cdr funcs)) ((car funcs) x))))))

; Q2
(define (tail-replicate x n)
  (define (tail-replicate-helper x n last)
  	(if (= n 0) last
		(tail-replicate-helper x (- n 1) (cons x last))))
  (tail-replicate-helper x n nil))

