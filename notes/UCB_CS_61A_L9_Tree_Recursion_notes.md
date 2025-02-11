# Tree Recursion
## Order of Recursive Calls
```py
# demo
def cascade(n):
    if n < 10:
        print(n)
    else:
        print(n)
        cascade(n//10)
        print(n)
```
### The Cascade Function
![ 2024-08-19 200255.png](https://s2.loli.net/2024/08/19/aUmszMQjpvC5Wer.png)
### Two Definitions of Cascade
![ 2024-08-19 200441.png](https://s2.loli.net/2024/08/19/QfOUADuMqR7sT5g.png)
## Example: Inverse Cascade
```py
# demo
def inverse_cascade(n):
    """Print an inverse cascade of prefixes of n.
    
    >>> inverse_cascade(1234)
    1
    12
    123
    1234
    123
    12
    1
    """
    grow(n)
    print(n)
    shrink(n)

def f_then_g(f, g, n):
    if n:
        f(n)
        g(n)

grow = lambda n: f_then_g(grow, print, n//10)
shrink = lambda n: f_then_g(print, shrink, n//10)
```
## Tree Recursion
### Tree Recursion
- Tree-shaped processes arise whenever executing the body of a recursive function makes more than one recursive call

![ 2024-08-19 202146.png](https://s2.loli.net/2024/08/19/HnzrsbwvDQhy8lI.png)
### A Tree-Recursive Process
-  The computational process of fib evolves into a tree structure

![ 2024-08-19 202343.png](https://s2.loli.net/2024/08/19/wnkexzJ2t7XYo4m.png)
### Repetition in Tree-Recursive Computation
-  This process is highly repetitive; fib is called on the same argument multiple times

![ 2024-08-19 202625.png](https://s2.loli.net/2024/08/19/AYNj4Bdefn5xOPT.png)
## Example: Towers of Hanoi
```py
# demo
def print_move(origin, destination):
    print("Move the top disk from rod", origin, "to rod", destination)

def move_stack(n, start, end):
    assert 1 <= start <= 3 and 1 <= end <= 3 and start != end, "Bad start/end"
    if n == 1:
        print_move(start, end)
    else:
        spare_peg = 6 - start - end
        move_stack(n-1, start, spare_peg)
        print_move(start, end)
        move_stack(n-1, spare_peg, end)
```
## Example: Counting Partitions
### Counting Partitions
-  The number of partitions of a positive integer n, using parts up to size m, is the number of ways in which n can be expressed as the sum of positive integer parts up to m in increasing order.
  
![ 2024-08-19 211257.png](https://s2.loli.net/2024/08/19/ObLH9IWBQdTAP4k.png)

![ 2024-08-19 211500.png](https://s2.loli.net/2024/08/19/2XlxI1fkTsWuEcz.png)
```py
# demo
def count_partitions(n, m):
    if n == 0:
        return 1
    elif n < 0:
        return 0
    elif m == 0:
        return 0
    else:
        with_m = count_partitions(n-m, m)
        without_m = count_partitions(n, m-1)
        return with_m + without_m
```
## hw 02
```sh
MI-wsf# python3 ok -q num_eights --local
=====================================================================
Assignment: Homework 2
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

MI-wsf# python3 ok -q pingpong --local
=====================================================================
Assignment: Homework 2
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

MI-wsf# python3 ok -q missing_digits --local
=====================================================================
Assignment: Homework 2
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

MI-wsf# python3 ok -q count_coins --local
=====================================================================
Assignment: Homework 2
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

MI-wsf# python3 ok -q make_anonymous_factorial --local
=====================================================================
Assignment: Homework 2
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.
```