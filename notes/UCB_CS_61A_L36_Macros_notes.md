# Macros
## Macros
### Macros Perform Code Transformations
![image.png](https://s2.loli.net/2025/02/10/FVvweykKSG7umMH.png)
```Scheme
; demo
scm> (print 2)
2
scm> (define x (print 2))
2
x
scm> x
scm> (begin (print 2) (print 2))
2
2
scm> (define (twice expr) (list 'begin expr expr))
twice
scm> (twice (print 2))
2
(begin undefined undefined)
scm> (twice '(print 2))
(begin (print 2) (print 2))
scm> (eval (twice '(print 2)))
2
2
scm> (define-macro (twice expr) (list 'begin expr expr))
twice
scm> (twice (print 2))
2
2

scm> (define x -2)
x
scm> (define (check val) (if val 'Passed 'Failed))
check
scm> (check (> x 0))
failed
scm> (define-macro (check expr) (list 'if expr ''Passed ''Failed))
check
scm> (check (> x 0))
failed
scm> (define-macro (check expr) (list 'if expr ''Passed (list 'quote (list 'Failed:  expr))))
check
scm> (check (> x 0))
(failed: (> x 0))
scm> (define (check expr) (list 'if expr ''Passed (list 'quote (list 'Failed:  expr))))
check
scm> (check '(> x 0))
(if (> x 0) (quote passed) (quote (failed: (> x 0))))
scm> (if (> x 0) (quote passed) (quote (failed: (> x 0))))
(failed: (> x 0))
```
## For Macro
### Discussion Question
![image.png](https://s2.loli.net/2025/02/10/vLYqxlmtZfz5Qdj.png)
## Implementing Macros
## lab 14
```sh
PS E:\UCB_CS_61A\lab14\lab14_sol> python3 ok -q prune_min --local
=====================================================================
Assignment: Lab 14
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

PS E:\UCB_CS_61A\lab14\lab14_sol> python3 ok -q split-at --local
=====================================================================
Assignment: Lab 14
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    6 test cases passed! No cases failed.

PS E:\UCB_CS_61A\lab14\lab14_sol> python3 ok -q compose-all --local
=====================================================================
Assignment: Lab 14
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    3 test cases passed! No cases failed.

PS E:\UCB_CS_61A\lab14\lab14_sol> python3 ok -q num_splits --local
=====================================================================
Assignment: Lab 14
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

PS E:\UCB_CS_61A\lab14\lab14_sol> python3 ok -q CheckingAccount --local
=====================================================================
Assignment: Lab 14
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

PS E:\UCB_CS_61A\lab14\lab14_sol> python3 ok -q align_skeleton --local
=====================================================================
Assignment: Lab 14
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

PS E:\UCB_CS_61A\lab14\lab14_sol> python3 ok -q foldl --local
=====================================================================
Assignment: Lab 14
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

PS E:\UCB_CS_61A\lab14\lab14_sol> python3 ok -q filterl --local
=====================================================================
Assignment: Lab 14
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

PS E:\UCB_CS_61A\lab14\lab14_sol> python3 ok -q reverse --local
=====================================================================
Assignment: Lab 14
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

PS E:\UCB_CS_61A\lab14\lab14_sol> python3 ok -q foldl2 --local
=====================================================================
Assignment: Lab 14
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.
```
## Not covered
### Expressions
- *synchronize*:
- *spawn*:
- *interleave*:
- *daemon*:
- *duplex*:
- *pitfall*:
- *deadlock*: