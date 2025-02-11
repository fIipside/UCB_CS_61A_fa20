# Function Examples
## Describing Functions
### Boolean Favorites
![ 2024-08-17 130937.png](https://s2.loli.net/2024/08/17/DeU9z8LwbmdgXpP.png)
![ 2024-08-17 125334.png](https://s2.loli.net/2024/08/17/OX5z3CuIMf1QWUK.png)
## Generating Environment Diagram
![ 2024-08-17 130205.png](https://s2.loli.net/2024/08/17/fAcXHEeh8t6LRUD.png)
## Implementing Functions
![ 2024-08-17 130920.png](https://s2.loli.net/2024/08/17/j1VxZdqG7wlRQya.png)
![ 2024-08-17 130542.png](https://s2.loli.net/2024/08/17/Z8stv3d4TQ9w5Nk.png)
## Decorators
```py
# demo
def trace1(fn):
    """Return a function equivalent to fn that also prints trace output.

    fn -- a function of one argument.
    """
    def traced(x):
        print('Calling', fn, 'on argument', x)
        return fn(x)
    return traced

@trace1
def square(x):
    return x*x

@trace1
def sum_squares_up_to(n):
    total, k = 0, 1
    while k <= n:
        total, k = total + square(k), k + 1
    return total
```
### Function Decorators
![ 2024-08-17 131314.png](https://s2.loli.net/2024/08/17/rVzCbW1XoD48mP9.png)
- The upfront is just a more natural place to put them. 
## Not covered
### Expressions
*convoluted*: very twisted. 
## Q&A
```py
def repeat(k):
    """When called repeatedly, print each repeated argument.

    >>> f = repeat(1)(7)(7)(3)(4)(2)(5)(1)(6)(5)(1)
    7
    1
    5
    1
    """
    return detector(lambda j: False)(k)

# detect two in a row
def detector(f):
    def g(i):
        if f(i):
            print(i)
        return detector(lambda j: j == i)
    return g

repeat(1)(7)(7) # 7

def detector(have_seen):
    def g(i):
        if have_seen(i):
            print(i)
        return detector(lambda j: j == i or have_seen(j))
    return g
```