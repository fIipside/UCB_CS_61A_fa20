# Scheme
## Scheme
### Scheme is a Dialect of Lisp
- What are people saying about Lisp? 
    - "If you don't know Lisp, you don't know what it means for a programming language to be powerful and elegant."  - Richard Stallman, created Emacs & the first free variant of UNIX 
    - "The only computer language that is beautiful." -Neal Stephenson, DeNero's favorite sci-fi author 
    - "The greatest single programming language ever designed." -Alan Kay, co-inventor of Smalltalk and OOP (from the user interface video)
![image.png](https://s2.loli.net/2025/01/19/6LfAg3aiSVBo1DX.png)
### Scheme Expressions
![image.png](https://s2.loli.net/2025/01/19/pPZviSx8nOd6KWa.png)
```Scheme
; demo
scm> 2
2
scm> (+ 1 2 3 4)
10
scm> (+)
0
scm> (* 1 2 3 4)
24
scm> (*)
1
scm> (* 2 2 2 2 2 3 3 3)
864
scm> (- (* 2 2 2 2 2 3 3 3) 1)
863
scm> (/ (+ (* (- (* 2 2 2 2 2 3 3 3) 1) 7) 1) 3)
2014
scm> +
#[+]
scm> (number? 3)
#t
scm> (number? +)
#f
scm> (zero? 2)
#f
scm> (zero? 0)
#t
scm> (zero? (- 2 2))
#t
scm> (integer? 2.2)
#f
scm> (integer? 2)
#t
```
## Special Forms
### Special Forms
![image.png](https://s2.loli.net/2025/01/19/32mprc7Pk6ofUWg.png)
```Scheme
;demo
scm> (define (square x) (* x x))
square
scm> (square 16)
256
scm> (define (average x y) (/ (+ x y) 2))
average
scm> (average 3 7)
5
scm> (define (sqrt x)
       (define (update guess)
         (if (= (square guess) x)
             guess
             (update (average guess (/ x guess)))))
       (update 1))
sqrt
; In fact, in Scheme, when you use define inside a function, Scheme automatically treats multiple define statements as part of the begin statement block. 
#|
(define (sqrt x)
  (begin
    (define (update guess)
      (if (= (square guess) x)
          guess
          (update (average guess (/ x guess)))))
    (update 1)))
|#
scm> (sqrt 256)
16
```
## Scheme Interpreters
## Lambda Expressions
### Lambda Expressions
![image.png](https://s2.loli.net/2025/01/19/YA3sOxKkpj52Dgh.png)
## Sierpinski's Triangle
![image.png](https://s2.loli.net/2025/01/19/shYctfUumLFAT43.png)
![image.png](https://s2.loli.net/2025/01/19/LF7GKrSO9URd5Bf.png)
![image.png](https://s2.loli.net/2025/01/19/8vqFQGCsWOXlUTM.png)
## More Special Forms
### Cond & Begin
![image.png](https://s2.loli.net/2025/01/19/wWLActNeSPomTYh.png)
### Let Expressions
![image.png](https://s2.loli.net/2025/01/19/trPQ5E8RoLyc9iU.png)
## Lists
### Scheme Lists
![image.png](https://s2.loli.net/2025/01/19/ZmJExkpi6eASCy8.png)
![image.png](https://s2.loli.net/2025/01/19/o2qyVePYX1IjDR8.png)
![image.png](https://s2.loli.net/2025/01/19/YfJz1WmNraItv59.png)
## Symbolic Programming
### Symbolic Programming
![image.png](https://s2.loli.net/2025/01/19/kBbK3jsfzc9mMZ8.png)
![image.png](https://s2.loli.net/2025/01/19/bnGDN28ceT7a3EL.png)
![image.png](https://s2.loli.net/2025/01/19/5IOBghJ3ZFrCskP.png)
## Programs as Data
### A Scheme Expression is a Scheme List
![image.png](https://s2.loli.net/2025/01/19/UM2DKkGwm7Nc6Vp.png)
```Scheme
; demo
scm> (+ 1 2)
3
scm> (list + 1 2)
(#[+] 1 2)
scm> (list '+ 1 2)
(+ 1 2)
scm> (+ 1 2)
3
scm> (list '+ 1 (+ 2 3))
(+ 1 5)

scm> (define (fact n)
       (if (= n 0) 1 (* n (fact (- n 1)))))
fact
scm> fact
(lambda (n) (if (= n 0) 1 (* n (fact (- n 1)))))
scm> (fact 3)
6
scm> (fact 5)
120
scm> (define (fact-exp n)
       (if (= n 0) 1 (list '* n (fact-exp (- n 1)))))
fact-exp
scm> (fact-exp 5)
(* 5 (* 4 (* 3 (* 2 (* 1 1)))))
scm> (eval (fact-exp 5))
120

scm> (define (fib n)
       (if (<= n 1) n (+ (fib (- n 2)) (fib (- n 1)))))
fib
scm> (define (fib-exp n)
       (if (<= n 1) n (list '+ (fib-exp (- n 2)) (fib-exp (- n 1)))))
fib-exp
scm> (fib 2)
1
scm> (fib 6)
8
scm> (fib-exp 6)
(+ (+ (+ 0 1) (+ 1 (+ 0 1))) (+ (+ 1 (+ 0 1)) (+ (+ 0 1) (+ 1 (+ 0 1)))))
scm> (fib-exp 4)
(+ (+ 0 1) (+ 1 (+ 0 1)))
scm> (fib-exp 5)
(+ (+ 1 (+ 0 1)) (+ (+ 0 1) (+ 1 (+ 0 1))))
scm> (eval (fib-exp 6))
8
```
## Generating Code
### Quasiquotation
![image.png](https://s2.loli.net/2025/01/19/a9qWtcJPMsY1XVz.png)
### Example: While Statements
![image.png](https://s2.loli.net/2025/01/19/a2U1vHwfVocSsNA.png)
```Scheme
; demo
(define   (sum-while starting-x while-condition add-to-total update-x)
  ; (eval (sum-while 2          '(< x 10)       '(* x x)     '(+ x 2)))  =>  120
  ; (eval (sum-while 1          '(< (* x x) 50) 'x           '(+ x 1)))  =>  28
  `(begin
     (define (f x total)
       (if ,while-condition
         (f ,update-x (+ total ,add-to-total))
         total))
     (f ,starting-x 0)))

scm> (define result (sum-while 1          '(< (* x x) 50) 'x           '(+ x 1)))
result
scm> result
(begin (define (f x total) (if (< (* x x) 50) (f (+ x 1) (+ total x)) total)) (f 1 0))
scm> (list? result)
#t
scm> (car result)
begin
scm> (eval result)
28
scm> (eval (sum-while 2          '(< x 10)       '(* x x)     '(+ x 2)))
120
scm> (sum-while 2          '(< x 10)       '(* x x)     '(+ x 2))
(begin (define (f x total) (if (< x 10) (f (+ x 2) (+ total (* x x))) total)) (f 2 0))
```
## lab 10
```Scheme
scm> (= 1 3)                    ; Scheme uses '=' instead of '==' for comparison
? #f
-- OK! --

scm> (< 1 3)
? #t
-- OK! --

scm> (or #t #f)                 ; or special form short circuits
? #t
-- OK! --

scm> (and #t #f (/ 1 0))
? #f
-- OK! --

scm> (not #t)
? #f

scm> ((lambda (a) (print 'a)) 100)
? a
-- OK! --

scm> c
? (3 (2 1))
-- OK! --

scm> (car c)
? 3
-- OK! --

scm> (cdr c)
? ((2 1))
-- OK! --
```
```sh

---------------------------------------------------------------------
OK! All cases for What Would Scheme Display? unlocked.

PS E:\UCB_CS_61A\lab10\lab10_sol> python3 ok -q over_or_under --local
=====================================================================
Assignment: Lab 10
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    3 test cases passed! No cases failed.

PS E:\UCB_CS_61A\lab10\lab10_sol> python3 ok -q make_adder --local
=====================================================================
Assignment: Lab 10
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    4 test cases passed! No cases failed.

PS E:\UCB_CS_61A\lab10\lab10_sol> python3 ok -q composed --local
=====================================================================
Assignment: Lab 10
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    7 test cases passed! No cases failed.

PS E:\UCB_CS_61A\lab10\lab10_sol> python3 ok -q make_structure --local
=====================================================================
Assignment: Lab 10
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    2 test cases passed! No cases failed.

PS E:\UCB_CS_61A\lab10\lab10_sol> python3 ok -q remove --local
=====================================================================
Assignment: Lab 10
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    5 test cases passed! No cases failed.
```
## hw 06
```sh
PS E:\UCB_CS_61A\hw06\hw06_sol> python3 ok -q cadr-caddr --local
=====================================================================
Assignment: Homework 6
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    3 test cases passed! No cases failed.

PS E:\UCB_CS_61A\hw06\hw06_sol> python3 ok -q sign --local
=====================================================================
Assignment: Homework 6
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    4 test cases passed! No cases failed.

PS E:\UCB_CS_61A\hw06\hw06_sol> python3 ok -q pow --local
=====================================================================
Assignment: Homework 6
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    4 test cases passed! No cases failed.
```
## Not covered
### Expressions
- *daunting*: 
- *substrate*:


