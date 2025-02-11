# Environments
## Environments for Higher-Order Functions
### Environments Enable Higher-Order Functions
- Higher-order function: A function that takes a function as an argument value or A function that returns a function as a return value
```py
# demo
def apply_twice(f, x):
    return f(f(x))

def square(x):
    return x * x

result = apply_twice(square, 2)
```
## Environments for Nested Definitions
```py
# demo
def repeat(f, x):
    while f(x) != x
        x = f(x)
    return x

def g(y):
    return (y + 5) // 3

result = repeat(g, 5)
```
```py
# demo
def make_adder(n):
    def adder(k):
        return k + n
    return adder

add_three = make_adder(3)
result = add_three(4)
```
![ 2024-08-15 205358.png](https://s2.loli.net/2024/08/15/1pLwjtABQCbszna.png)
### How to Draw an Environment Diagram
![ 2024-08-15 205502.png](https://s2.loli.net/2024/08/15/DlOE4Nbovp1VSHY.png)
## Local Names
### Local Names are not Visible to Other (Non-Nested) Functions
![ 2024-08-15 210550.png](https://s2.loli.net/2024/08/15/5mrTgK7QGPbCe64.png)
- An environment is a sequence of frames. 
- The environment created by calling a top-level function (no def within def) 
consists of one local frame, followed by the global frame.
## Function Composition
```py
# demo
def compose1(f, g):
    def h(x):
        return f(g(x))
    return h

def triple(x):
    return 3 * x

def square(x):
    return x * x

squiple = compose1(square, triple)
tripare = compose1(triple, square)
```
### The Environment Diagram for Function Composition
![ 2024-08-15 212520.png](https://s2.loli.net/2024/08/15/tIowDcTblXSxKYv.png)
## Self-Reference
```py
# demo
def print_all(x):
    print(x)
    return print_all

print_all(1)(3)(5)

def print_sums(x):
    print(x)
    def next_sum(y):
        return print_sums(x + y)
    return next_sum

print_sums(1)(3)(5)
```
![ 2024-08-15 214416.png](https://s2.loli.net/2024/08/15/5P1DlycVYuIRpEn.png)
## Currying
```py
# demo
def curry2(f):
    def g(x):
        def h(y):
            return f(x, y)
        return h
    return g
```
- Curry: Transform a multi-argument function into a single-argument, higher-order function
## Not covered
### Function Decorators
- Python provides special syntax to apply higher-order functions as part of executing a def statement, called a decorator.
```py
>>> def trace(fn):
        def wrapped(x):
            print('-> ', fn, '(', x, ')')
            return fn(x)
        return wrapped
>>> @trace
    def triple(x):
        return 3 * x
>>> triple(12)
->  <function triple at 0x102a39848> ( 12 )
36
```
- In this example, A higher-order function `trace` is defined, which returns a function that precedes a call to its argument with a `print` statement that outputs the argument. The `def` statement for `triple` has an annotation, `@trace`, which affects the execution rule for `def`. As usual, the function `triple` is created. However, the name `triple` is not bound to this function. Instead, the name `triple` is bound to the returned function value of calling `trace` on the newly defined `triple` function. In code, this decorator is equivalent to:
```py
>>> def triple(x):
        return 3 * x
>>> triple = trace(triple)
```
- __Extra for experts.__ The decorator symbol `@` may also be followed by a call expression. The expression following `@` is evaluated first (just as the name `trace` was evaluated above), the `def` statement second, and finally the result of evaluating the decorator expression is applied to the newly defined function, and the result is bound to the name in the `def` statement. 
## lab 02
```py
>>> def cake():
...     print('beats')
...     def pie():
...         print('sweets')
...         return 'cake'
...     return pie
...
>>> chocolate = cake()
beats
>>> chocolate
<function cake.<locals>.pie at 0x7fc39e6b1c60>
>>> chocolate()
sweets
'cake'
>>> cake()()
beats
sweets
'cake'
>>> more_chocolate, more_cake = chocolate(), cake
sweets
>>> more_chocolate
'cake'
```
```sh
MI-wsf# python3 ok -q lambda_curry2 --local
=====================================================================
Assignment: Lab 2
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

MI-wsf# python3 ok -q count_cond --local
=====================================================================
Assignment: Lab 2
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

MI-wsf# python3 ok -q composite_identity --local
=====================================================================
Assignment: Lab 2
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

MI-wsf# python3 ok -q cycle --local
=====================================================================
Assignment: Lab 2
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.
```
*HOF*: High-Order Function