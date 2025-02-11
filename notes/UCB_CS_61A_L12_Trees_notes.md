# Trees
## Box-and-Pointer Notation
### The Closure Property of Data Types
- A method for combining data values satisfies the _closure property_ if: The result of combination can itself be combined using the same method 
- Closure is powerful because it permits us to create hierarchical structures 
- Hierarchical structures are made up of parts, which themselves are made up 
of parts, and so on
- Lists can contain lists as elements (in addition to anything else)
### Box-and-Pointer Notation in Environment Diagrams
- Lists are represented as a row of index-labeled adjacent boxes, one per element 
- Each box either contains a primitive value or points to a compound value

![ 2024-08-23 220954.png](https://s2.loli.net/2024/08/23/coBFL4aysh7Pukv.png)
## Slicing
```py
# demo
>>> odds = [3, 5, 7, 9, 11]
>>> list(range(1, 3))
[1, 2]
>>> [odds[i] for i in range(1, 3)]
[5, 7]
>>> odds[1:3]
[5, 7]
>>> odds[1:]
[5, 7, 9, 11]
>>> odds[:3]
[3, 5, 7]
>>> odds[:]
[3, 5, 7, 9, 11]
```
### Slicing Creates New Values
![ 2024-08-23 221139.png](https://s2.loli.net/2024/08/23/LGyM4UikgTq51nJ.png)
## Processing Container Values
### Sequence Aggregation
- Several built-in functions take iterable arguments and aggregate them into a value 
- __sum__(iterable[, start]) -> value 
Return the sum of a 'start' value (default: 0) plus an iterable of numbers. 
```py
# demo
>>> sum([2, 3, 4])
9
>>> sum([2, 3, 4], 5)
14
>>> [2, 3] + [4]
[2, 3, 4]
>>> sum([[2, 3] + [4]], [])
[2, 3, 4]
>>> [] + [2, 3] + [4]
[2, 3, 4]
```
- __max__(iterable[, key=func]) -> value 
__max__(a, b, c, ...[, key=func]) -> value 
With a single iterable argument, return its largest item. 
With two or more arguments, return the largest argument. 
```py
# demo
>>> max(range(5))
4
>>> max(0, 1, 2, 3, 4)
4
>>> max(range(10), key = lambda x: 7 - (x - 4) * (x - 2))
3
>>> (lambda x: 7 - (x - 4) * (x - 2))( 3 )
8
>>> (lambda x: 7 - (x - 4) * (x - 2))( 2 )
7
>>> (lambda x: 7 - (x - 4) * (x - 2))( 4 )
7
>>> (lambda x: 7 - (x - 4) * (x - 2))( 5 )
4
```
- __all__(iterable) -> bool 
Return True if bool(x) is True for all values x in the iterable. 
If the iterable is empty, return True.
```py
# demo
>>> bool(5)
True
>>> bool('hello')
True
>>> bool('')
False
>>> bool([])
False
>>> all([])
True
>>> [x < 5 for x in range(5)]
[True, True, True, True, True]
>>> all([x < 5 for x in range(5)])
True
>>> all(range(5))
False
```
## Trees
### Tree Abstraction
![ 2024-08-23 231539.png](https://s2.loli.net/2024/08/23/AS5ti6R3DnQPqOL.png)
### Implementing the Tree Abstraction
![ 2024-08-23 231605.png](https://s2.loli.net/2024/08/23/Xve9EPUy6L8RkcV.png)
```py
# demo
>>> tree(1)
[1]
>>> is_leaf(tree(1))
True
>>> t = tree(1, [tree(5, [tree(7)], tree(6))])
>>> t
[1, [5, [7]], [6]]
>>> label(t)
1
>>> branches(t)
[[5, [7]], [6]]
>>> branches(t)[0]
[5, [7]]
>>> is_tree(branches(t)[0])
True
>>> label(branches(t)[0])
5
```
## Tree Processing
```py
# demo
def fib_tree(n):
    if n <= 1:
        return tree(n)
    else:
        left = fib_tree(n-2)
        right = fib_tree(n-1)
        fib_n = label(left) + label(right)
        return tree(fib_n, [left, right])

>>> fib_tree(0)
[0]
>>> fib_tree(1)
[1]
>>> fib_tree(2)
[1, [0], [1]]
>>> fib_tree(4)
[3, [1, [0], [1]], [2, [1], [1, [0], [1]]]]
```
### Tree Processing Uses Recursion
```py
# demo
def count_leaves(t):
    """Count the leaves of tree T"""
    if is_leaf(t):
        return 1
    else:
        return sum([count_leaves(b) for b in branches(t)])

>>> fib_tree(4)
[3, [1, [0], [1]], [2, [1], [1, [0], [1]]]]
>>> count_leaves(fib_tree(4))
5
>>> fib_tree(10)
[55, [21, [8, [3, [1, [0], [1]], [2, [1], [1, [0], [1]]]], [5, [2, [1], [1, [0], [1]]], [3, [1, [0], [1]], [2, [1], [1, [0], [1]]]]]], [13, [5, [2, [1], [1, [0], [1]]], [3, [1, [0], [1]], [2, [1], [1, [0], [1]]]]], [8, [3, [1, [0], [1]], [2, [1], [1, [0], [1]]]], [5, [2, [1], [1, [0], [1]]], [3, [1, [0], [1]], [2, [1], [1, [0], [1]]]]]]]], [34, [13, [5, [2, [1], [1, [0], [1]]], [3, [1, [0], [1]], [2, [1], [1, [0], [1]]]]], [8, [3, [1, [0], [1]], [2, [1], [1, [0], [1]]]], [5, [2, [1], [1, [0], [1]]], [3, [1, [0], [1]], [2, [1], [1, [0], [1]]]]]]], [21, [8, [3, [1, [0], [1]], [2, [1], [1, [0], [1]]]], [5, [2, [1], [1, [0], [1]]], [3, [1, [0], [1]], [2, [1], [1, [0], [1]]]]]], [13, [5, [2, [1], [1, [0], [1]]], [3, [1, [0], [1]], [2, [1], [1, [0], [1]]]]], [8, [3, [1, [0], [1]], [2, [1], [1, [0], [1]]]], [5, [2, [1], [1, [0], [1]]], [3, [1, [0], [1]], [2, [1], [1, [0], [1]]]]]]]]]]
>>> count_leaves(fib_tree(10))
89
```
- Processing a leaf is often the base case of a tree processing function 
- The recursive case typically makes a recursive call on each branch, then aggregates
### Discussion Question
- Implement leaves, which returns a list of the leaf labels of a tree 
- _Hint_: If you sum a list of lists, you get a list containing the elements of those lists

![ 2024-08-23 234016.png](https://s2.loli.net/2024/08/23/OeW8UB2YGD6EXbm.png)
### Creating Trees
- A function that creates a tree from another tree is typically also recursive
![ 2024-08-23 235708.png](https://s2.loli.net/2024/08/24/ZmSVAguWptn9TBE.png)
## Example: Printing Trees
```py
# demo
def print_tree(t, indent=0):
    print('  ' * indent + str(label(t)))
    for b in branches(t):
        print_tree(b, indent + 1)

>>> print_tree(fib_tree(4))
3
  1
    0
    1
  2
    1
    1
      0
      1
>>> print_tree(fib_tree(5))
5
  2
    1
    1
      0
      1
  3
    1
      0
      1
    2
      1
      1
        0
        1
```
## Example: Summing Paths
```py
# demo
def fact(n):
    if n == 0:
        return 1
    else:
        return n * fact(n - 1)

def fact_times(n, k):
    """Return k * n * n-1 * ... * 1."""
    if n == 0:
        return k
    else:
        return fact_times(n - 1, k * n) # By the time you hit the base case, you are done with all the multiply.

def print_sums(t, so_far):
    so_far = so_far + label(t)
    if is_leaf(t):
        print(so_far)
    else:
        for branch in branches(t):
            print_sums(branch, so_far)

>>> numbers = tree(3, [tree(4), tree(5, [tree(6)])])
>>> print_sums(numbers, 0)
7
14
>>> haste = tree('h', [tree('a', [tree('s'), tree('t')]), tree('e')])
>>> print_sums(haste, '')
has
hat
he
```
## Q&A
```py
>>> sum([3, 4, 5])
12
>>> 0 + 3 + 4 + 5
12
>>> sum([])
0
>>> sum([[3], [4, 5]], [])
[3, 4, 5]
>>> [] + [3] + [4, 5]
[3, 4, 5]
```