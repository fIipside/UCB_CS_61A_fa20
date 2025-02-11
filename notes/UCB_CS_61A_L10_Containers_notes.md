# Containers
## Lists
### Working with Lists
![ 2024-08-21 230349.png](https://s2.loli.net/2024/08/21/5ih1FVwx4Qa2ezH.png)
## Containers 
- Built-in operators for testing whether an element appears in a compound value
```py
# demo
>>> digits = [1, 8, 2, 8] 
>>> 1 in digits 
True 
>>> 8 in digits 
True 
>>> 5 not in digits 
True 
>>> not(5 in digits) 
True
>>> '1' in digits
False
>>> [1, 8] in digits
False
>>> [1, 2] in [[1, 2], 3]
True
```
## For Statements
```py
# demo
def count_while(s, value):
    """Count the number of occurrences of value in sequence s.

    >>> count_while([1, 2, 1, 2, 1], 1)
    3
    """
    total, index = 0, 0
    while index < len(s):
        if s[index] == value:
            total = total + 1
        index = index + 1
    return total

def count_for(s, value):
    """Count the number of occurrences of value in sequence s.

    >>> count_while([1, 2, 1, 2, 1], 1)
    3
    """
    total = 0
    for elem in s:
        if elem == value:
            total = total + 1
    return total
```
### Sequence Iteration
![ 2024-08-21 231327.png](https://s2.loli.net/2024/08/21/64D1muQBUoFza5M.png)
### For Statement Execution Procedure
![ 2024-08-21 231602.png](https://s2.loli.net/2024/08/21/iJq4QnTIGpfS68C.png)
1. Evaluate the header <expression>, which must yield an iterable value (a sequence) 
2. For each element in that sequence, in order: 
    A. Bind <name> to that element in the current frame 
    B. Execute the <suite>
### Sequence Unpacking in For Statements
![ 2024-08-21 231541.png](https://s2.loli.net/2024/08/21/DzdkgQGybp7rmoc.png)
## Ranges
### The Range Type
![ 2024-08-21 232118.png](https://s2.loli.net/2024/08/21/lHGPAZTshKpvjwE.png)
```py
# demo
>>> list(range(5, 8))
range(5, 8)
>>> list(range(5, 8))
[5, 6, 7]
>>> range(4)
range(0, 4)
>>> list(range(4))
[0, 1, 2, 3]

def sum_below(n):
    total = 0
    for i in range(n):
        total += i
    return total

def cheer():
    for _ in range(3): # One convention is to use the underscore. 
        print('Go Bears!')
```
## Recursive Sums
```py
# ——— DRILL ———
# Write an iterative function that takes as input
# integer “n” and returns the sum of the first “n”
# integers: sum(5) returns 1+2+3+4+5
def sum_iter(n):
    sum = 0
    for i in range(0,n+1):
        sum = sum + i
    return( sum )

# ——— DRILL ———
# Write a recursive function that takes as input
# integer “n” and returns the sum of the first “n”
# integers: sum(5) returns 1+2+3+4+5
def sum_rec(n):
    if( n == 0 ):
        return(0)
    else:
        return n + sum_rec(n-1)
```
## List Comprehensions
```py
# demo
>>> odds = [1, 3, 5, 7, 9]
>>> [x+1 for x in odds]
[2, 4, 6, 8, 10]
>>> [x for x in odds if 25 % x == 0]
[1, 5]

def divisors(n):
    return [1] + [x for x in range(2, n) if n % x == 0]
```
## Strings
### Strings are an Abstraction
![ 2024-08-21 233952.png](https://s2.loli.net/2024/08/21/FHfpezit3Q7SNlk.png)
```py
# demo
>>> 'curry = lambda f: lambda x: lambda y: f(x, y)'
'curry = lambda f: lambda x: lambda y: f(x, y)'
>>> exec('curry = lambda f: lambda x: lambda y: f(x, y)')
>>> curry
<function <lambda> at 0x7fd824759630>
>>> from operator import add
>>> curry(add)(3)(4)
7
```
### String Literals Have Three Forms
![ 2024-08-21 234455.png](https://s2.loli.net/2024/08/21/qZ4YLBo5jiGky9d.png)
### Strings are Sequence
![ 2024-08-21 234722.png](https://s2.loli.net/2024/08/21/hc2sv1RzypwEAbZ.png)
## Reversing a String
```py
def reverse_string(s):
    if len(s) == 1:
        return s
    else:
        return reverse_string(s[1:]) + s[0]
```
## Q&A
```py
>>> 'hello\tthere'
'hello\tthere'
>>> len('hello\tthere')
11
>>> print('hello\tthere')
hello   there
>>> s = 'hello\nthere'
>>> len(s)
11
>>> print(s)
hello
there
```
```py
>>> t = [5, 6, 7, 8, 9]
>>> t[-1]
9
>>> t[1:-1]
[6, 7, 8]
>>> t[-1:1:-1] # The last '-1' means how to get to the end. 
[9, 8, 7]
>>> t[0:len(t):2]
[5, 7, 9]
```
## lab 04
```sh
MI-wsf# python3 ok -q skip_add --local
=====================================================================
Assignment: Lab 4
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

MI-wsf# python3 ok -q summation --local
=====================================================================
Assignment: Lab 4
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

MI-wsf# python3 ok -q paths --local
=====================================================================
Assignment: Lab 4
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

MI-wsf# python3 ok -q max_subseq --local
=====================================================================
Assignment: Lab 4
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

MI-wsf# python3 ok -q add_chars --local
=====================================================================
Assignment: Lab 4
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
*negate*: to cause something to have no effect. 
*truncated*: made shorter or quicker, especially by removing the end of something. 
*pragmatic*: solving problems in a sensible way that suits the conditions that really exist now, rather than obeying fixed theories, ideas, or rules. 
*enumerate*: to name things separately, one by one
*ubiquitous*: seeming to be everywhere. 
*traverse*: to move or travel through an area. 
*prepend*: to add something to the beginning of something else, especially a piece of data (= information) to the beginning of a computer instruction. 