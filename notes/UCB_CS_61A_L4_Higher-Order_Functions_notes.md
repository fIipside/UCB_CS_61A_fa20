# Higher-Order Functions
## Iteration Example
### The Fibonacci Sequence
```py
def fib(n): 
    """Compute the nth Fibonacci number, for N >= 1.""" 
    pred, curr = 0, 1   # 0th and 1st Fibonacci numbers ; pred, curr = 1, 0
    k = 1               # curr is the kth Fibonacci number ; k = 0 is better
    while k < n: 
        pred, curr = curr, pred + curr 
        k = k + 1 
    return curr
```
## Designing Functions
### Describing Functions
- A function's _domain_ is the set of all inputs it might 
possibly take as arguments. 
- A function's _range_ is the set of output values it might 
possibly return. 
- A pure function's _behavior_ is the relationship it 
creates between input and output.
### A Guide to Designing Function
- Give each function exactly one job, but make it apply to many related situations
- Don’t repeat yourself (DRY):  Implement a process just once, but execute it many times
## Higher-Order Functions
### Generalizing Patterns with Arguments
```py
# demo

from math import pi, sqrt

def area_square(r):
    return r * r

def area_circle(r):
    return r * r * pi

def area_hexagon(r):
    return r * r * 3 * sqrt(3) / 2

def area(r, shape_constant):
    assert r > 0, 'A length must be positive'
    return r * r * shape_constant

def area_square(r):
    return area(r, 1)

def area_circle(r):
    return area(r, pi)

def area_hexagon(r):
    return area(r, 3 * sqrt(3) / 2)
```
### Generalizing Over Computational Processes
```py
# demo
def sum_naturals(n):
    """Sum the first N natural numbers.

    >>> sum_naturals(5)
    15
    """
    total, k = 0, 1
    while k <= n:
        total, k = total + k, k + 1
    return total

def sum_cubes(n):
    """Sum the first N cubes of natural numbers.

    >>> sum_cubes(5)
    225
    """
    total, k = 0, 1
    while k <= n:
        total, k = total + pow(k, 3), k + 1
    return total

def identity(k):
    return k

def cube(k):
    return pow(k, 3)

def summation(n, term):
    """Sum the first N terms of a sequence.

    >>> summation(5, cube)
    225
    """
    total, k = 0, 1
    while k <= n:
        total, k = total + term(k), k + 1
    return total

from operator import mul

def pi_term(k):
    return 8 / mul(k * 4 - 3, k * 4 - 1)

summation(1000000, pi_term)
```
## Functions as Return Values
```py
# demo
def make_adder(n):
    """Return a function that takes one argument K and returns K + N.

    >>> add_three = make_adder(3)
    >>> add_three(4)
    7
    """
    def adder(k):
        return k + n
    return adder

make_adder(2000)(20)
```
![ 2024-08-14 120318.png](https://s2.loli.net/2024/08/14/ZEzQM9VFOl7YB84.png)
### The Purpose of High_Order Functions
- Functions are first-class: Functions can be manipulated as values in our programming language. 
- Higher-order function: A function that takes a function as an argument value or returns a function as a return value. 
## Lambda Expressions
```py
# demo

x = 10
square = x * x
square = lambda x: x * x
square(4)
```
### Lambda Expressions
![ 2024-08-14 121623.png](https://s2.loli.net/2024/08/14/fGTMkZt1c2X4Cjr.png)
### Lambda Expressions Versus Def Statements
- Both create a function with the same domain, range, and behavior. 
- Both bind that function to the name square. 
- Only the def statement gives the function an intrinsic name, which shows up in environment diagrams but doesn't affect execution (unless the function is printed).

![ 2024-08-14 121946.png](https://s2.loli.net/2024/08/14/2rmM5opwxd6EzyG.png)
## Return
### Return Statements
- A return statement completes the evaluation of a call expression and provides its value: only one return statement is ever executed while executing the body of a function. 
```py
# demo

def search(f):
    """Return the smallest non-negative integer x for which f(x) is a true value."""
    x = 0
    while True:      # while not f(x):
        if f(x):     #     x += 1
            return x # return x
        x += 1

def is_three(x):
    """Return whether x is three.

    >>> search(is_three)
    3
    """
    return x == 3

def square(x):
    return x * x

def positive(x):
    """A function that is 0 until square(x)-100 is positive.
    
    >>> search(positive)
    11
    """
    return max(0, square(x) - 100)

def inverse(f):
    """Return a function g(y) that returns x such that f(x) == y.

    >>> sqrt = inverse(square)
    >>> sqrt(16)
    4
    """
    return lambda y: search(lambda x: f(x) == y)
```
## Control
### If Statements and Call Expressions
```py
# demo

def if_(c, t, f):
    if c:
        return t
    else:
        return f

from math import sqrt

def real_sqrt(x):
    """Return the real part of the square root of x.

    >>> real_sqrt(4)
    2.0
    >>> real_sqrt(-4)
    0.0
    """
    if x > 0:
        return sqrt(x)
    else:
        return 0.0

def real_sqrt(x):
    return if_(x > 0, sqrt(x), 0.0) # sqrt(x) will be evaluated before if_ is called, which causes a crash
```
## Control Expressions
### Logical Operators
- To evaluate the expression <left> and <right>: 
    1. Evaluate the subexpression <left>. 
    2. If the result is a false value v, then the expression evaluates to v. 
    3. Otherwise, the expression evaluates to the value of the subexpression <right>. 
- To evaluate the expression <left> or <right>: 
    1. Evaluate the subexpression <left>. 
    2. If the result is a true value v, then the expression evaluates to v. 
    3. Otherwise, the expression evaluates to the value of the subexpression <right>.
```py
# demo
def has_big_sqrt(x):
    return x > 0 and sqrt(x) > 10

def reasonable(n):
    return n == 0 or 1/n != 0.0
```
### Conditional Expressions
A conditional expression has the form 
`<consequent> if <predicate> else <alternative> `
- Evaluation rule: 
    1. Evaluate the `<predicate>` expression. 
    2. If it's a true value, the value of the whole expression is the value of the `<consequent>`. 
    3. Otherwise, the value of the whole expression is the value of the `<alternative>`.
```py
>>> x = 0 
>>> abs(1/x if x != 0 else 0) 
0
```
## Not Covered
### Expressions
*succinct*: said in a clear and short way. 
*on the fly*: without interrupting a computer program that is already running. 
*brevity*: using only a few words or lasting only a short time. 
*etymology*: the study of the origin and history of words. 
## hog
```sh
MI-wsf# python3 ok -q 01 --local
=====================================================================
Assignment: Project 1: Hog
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    59 test cases passed! No cases failed.

MI-wsf# python3 ok -q 02 --local
=====================================================================
Assignment: Project 1: Hog
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    36 test cases passed! No cases failed.

MI-wsf# python3 ok -q 03 --local
=====================================================================
Assignment: Project 1: Hog
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    10 test cases passed! No cases failed.

MI-wsf# python3 ok -q 04a --local
=====================================================================
Assignment: Project 1: Hog
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    107 test cases passed! No cases failed.

MI-wsf# python3 ok -q 04b --local
=====================================================================
Assignment: Project 1: Hog
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    107 test cases passed! No cases failed.

MI-wsf# python3 ok -q 05 --local
=====================================================================
Assignment: Project 1: Hog
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    111 test cases passed! No cases failed.

Cannot backup when running ok with --local.

MI-wsf# python3 ok -q 06 --local
=====================================================================
Assignment: Project 1: Hog
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    7 test cases passed! No cases failed.

Cannot backup when running ok with --local.

MI-wsf# python3 ok -q 07 --local
=====================================================================
Assignment: Project 1: Hog
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    5 test cases passed! No cases failed.

Cannot backup when running ok with --local.

MI-wsf# python3 ok -q 08 --local
=====================================================================
Assignment: Project 1: Hog
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    7 test cases passed! No cases failed.

Cannot backup when running ok with --local.

MI-wsf# python3 ok -q 09 --local
=====================================================================
Assignment: Project 1: Hog
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    8 test cases passed! No cases failed.

MI-wsf# python3 ok -q 10 --local
=====================================================================
Assignment: Project 1: Hog
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    106 test cases passed! No cases failed.

MI-wsf# python3 ok -q 11 --local
=====================================================================
Assignment: Project 1: Hog
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    105 test cases passed! No cases failed.

MI-wsf# python3 ok -q 12 --local
=====================================================================
Assignment: Project 1: Hog
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.
```
### Hint
```py
>>> def test(*args):
...     print(type(args))
...     print()
...     print(args)
...     print()
...     print(*args)
...     print()
...     for arg in args:
...         print(arg)
...
>>> test(1, 2, 3)
<class 'tuple'>

(1, 2, 3)

1 2 3

1
2
3
```
