# Exceptions
## Exceptions
### Today's Topic: Handling Errors
![image.png](https://s2.loli.net/2025/01/21/b4yKN5ZWqXsf9LU.png)
### Exceptions
![image.png](https://s2.loli.net/2025/01/21/F7YaUkGtORxgBo3.png)
## Raising Exceptions
### Assert Statements
![image.png](https://s2.loli.net/2025/01/21/At7umnZWDaGclUT.png)
```py
# demo
>>> assert False, 'Error'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AssertionError: Error
>>> assert True

PS E:\UCB_CS_61A\notes> python3 -0
Unknown option: -0
usage: C:\Users\vanad\AppData\Local\Microsoft\WindowsApps\python3.exe [option] ... [-c cmd | -m mod | file | -] [arg] ...
Try `python -h' for more information.
PS E:\UCB_CS_61A\notes> python3 -O
Python 3.10.11 (tags/v3.10.11:7d4cc5a, Apr  5 2023, 00:38:17) [MSC v.1929 64 bit (AMD64)] on win32
Type "help", "copyright", "credits" or "license" for more information.
>>> __debug__
False
>>> assert False, 'Error'
```
### Raise Statements
![image.png](https://s2.loli.net/2025/01/21/h4Ud5oxeBkJTROr.png)
```py
# demo
>>> raise TypeError('Bad argument')
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: Bad argument
>>> abs('hello')
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: bad operand type for abs(): 'str'
>>> hello
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'hello' is not defined. Did you mean: 'help'?
>>> {}['hello']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'hello'
>>> def f(): f()
...
>>> f()
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "<stdin>", line 1, in f
  File "<stdin>", line 1, in f
  File "<stdin>", line 1, in f
  [Previous line repeated 996 more times]
RecursionError: maximum recursion depth exceeded
```
## Try Statements
### Try Statements
![image.png](https://s2.loli.net/2025/01/21/pbU4OyXn5flsjvg.png)
### Handling Exceptions
![image.png](https://s2.loli.net/2025/01/21/zQEpUXuZqbWfny5.png)
```py
# demo
def invert(x):
    y = 1/x 
    print('Never printed if x is 0')
    return y

def invert_safe(x):
    try:
        return invert(x)
    except ZeroDivisionError as e:
        print('handled', e)
        return 0

>>> invert(2)
Never printed if x is 0
0.5
>>> invert(0.5)
Never printed if x is 0
2.0
>>> invert(0)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "E:\UCB_CS_61A\notes\ex.py", line 18, in invert
    result = 1/x  # Raises a ZeroDivisionError if x is 0
ZeroDivisionError: division by zero

>>> invert_safe(2)
Never printed if x is 0
0.5
>>> invert_safe(0)
handled division by zero
0
>>> 1/0
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ZeroDivisionError: division by zero
```
### WWPD: What Would Python Display?
![image.png](https://s2.loli.net/2025/01/21/vOlI1mjeibNtw2f.png)
## Example: Reduce
### Reducing a Sequence to a Value
![image.png](https://s2.loli.net/2025/01/21/eFQ6A7Xm9xbHTkG.png)
```py
# demo
from operator import add, mul, truediv
def reduce(f, s, initial):
    """Combine elements of s pairwise using f, starting with initial.

    >>> reduce(mul, [2, 4, 8], 1)
    64
    >>> reduce(add, [1, 2, 3, 4], 0)
    10
    """
    if not s:
        return initial
    else:
        first, rest = s[0], s[1:]
        return reduce(f, rest, f(initial, first))

def reduce2(f, s, initial):
    """Combine elements of s pairwise using f, starting with initial.

    >>> reduce(mul, [2, 4, 8], 1)
    64
    >>> reduce(add, [1, 2, 3, 4], 0)
    10
    """
    for x in s:
        initial = f(initial, x)
    return initial

def divide_all(n, ds):
    """Divide n by every d in ds.

    >>> divide_all(1024, [2, 4, 8])
    16.0
    >>> divide_all(1024, [2, 4, 0, 8])
    inf
    """
    try:
        return reduce(truediv, ds, n)
    except ZeroDivisionError:
        return float('inf')
```
## Not covered
### Exception Objects
- Consider applying `find_zero` to find the zero of the function $2x^2+sqrt(x)$. This function has a zero at 0, but evaluating it on any negative number will raise a `ValueError`. Our Chapter 1 implementation of Newton's Method would raise that error and fail to return any guess of the zero. Our revised implementation returns the last guess found before the error.
### Expressions
- *examples abound*:
- *backtrace*:
- *coarse*: