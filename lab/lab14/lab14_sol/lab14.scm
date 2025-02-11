(define (split-at lst n)
  (cond ((> n (length lst)) (list lst))
        ((= n 0) (cons nil lst))
        (else (cons (cons (car lst) (car (split-at (cdr lst) (- n 1))))
                    (cdr (split-at (cdr lst) (- n 1))))))
)


(define (compose-all funcs)
  (define (compose x)
      (if (null? funcs) x ((compose-all (cdr funcs)) ((car funcs) x))))
  compose
)

