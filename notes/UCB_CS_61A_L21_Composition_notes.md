# Composition
## Linked Lists
### Linked List Structure
- A linked list is either empty **or** a first value and the rest of the linked list
![image.png](https://s2.loli.net/2025/01/09/Si4YLNtqMlwXkzc.png)
![image.png](https://s2.loli.net/2025/01/09/rQvkUjMGg5IihCA.png)
### Linked List Class
![image.png](https://s2.loli.net/2025/01/09/LDrBjqwp5NW6oeZ.png)
```py
# demo
>>> s = Link(3, Link(4, Link(5)))
>>> s
Link(3, Link(4, Link(5)))
>>> s.first
3
>>> s.rest
Link(4, Link(5))
>>> s.rest.first
4
>>> s.rest.rest.first
5
>>> s.rest.rest.rest is Link.empty
Ture
>>> s.rest.first = 7
>>> s
Link(3, Link(7, Link(5)))
>>> Link(8, s.rest)
Link(8, Link(7, Link(5)))
>>> s
Link(3, Link(7, Link(5)))
class Link:
    """A linked list.  
    >>> s.first = 6 
    >>> s
    Link(6, Link(7))
    >>> print(s)
    <6 7>
    >>> print(s.rest)
    <7>
    >>> t = Link(1, Link(Link(2, Link(3)), Link(4)))
    >>> t
    Link(1, Link(Link(2, Link(3)), Link(4)))
    >>> print(t)
    <1 <2 3> 4>
    """
    empty = ()

    def __init__(self, first, rest=empty):
        assert rest is Link.empty or isinstance(rest, Link)
        self.first = first
        self.rest = rest

    def __repr__(self):
        if self.rest:
            rest_repr = ', ' + repr(self.rest)
        else:
            rest_repr = ''
        return 'Link(' + repr(self.first) + rest_repr + ')'

    def __str__(self):
        string = '<'
        while self.rest is not Link.empty:
            string += str(self.first) + ' '
            self = self.rest
        return string + str(self.first) + '>'
```
## Linked List Processing
### Example: Range, Map, and Filter for Linked Lists
![image.png](https://s2.loli.net/2025/01/13/qXg6Kr4VyCHWUdO.png)
## Not covered
```py
# demo
def square(x):
    return x * x

def odd(x):
    return x % 2 == 1

def range_link(start, end):
    """Return a Link containing consecutive integers from start to end.

    >>> range_link(3, 6)
    Link(3, Link(4, Link(5)))
    """
    if start >= end:
        return Link.empty
    else:
        return Link(start, range_link(start + 1, end))

def map_link(f, s):
    """Return a Link that contains f(x) for each x in Link s.

    >>> map_link(square, range_link(3, 6))
    Link(9, Link(16, Link(25)))
    """
    if s is Link.empty:
        return s
    else:
        return Link(f(s.first), map_link(f, s.rest))

def filter_link(f, s):
    """Return a Link that contains only the elements x of Link s for which f(x)
    is a true value.

    >>> filter_link(odd, range_link(3, 6))
    Link(3, Link(5))
    """
    if s is Link.empty:
        return s
    filtered_rest = filter_link(f, s.rest)
    if f(s.first):
        return Link(s.first, filtered_rest)
    else:
        return filtered_rest

>>> r = range_link(1, 6)
>>> s = filter_link(odd, r)
>>> t = map_link(square, s)
>>> t
Link(1, Link(9, Link(25)))
```
## Linked Lists Mutation
### Linked Lists Can Change
- Attribute assignment statements can change first and rest arributes of a Link
![image.png](https://s2.loli.net/2025/01/13/A3Oj5ug8rqkReBI.png)
## Linked List Mutation Example
### Adding to an Ordered List
![image.png](https://s2.loli.net/2025/01/13/sExAJWLVGU6zR4f.png)
### Adding to a Set Represented as an Ordered List
![image.png](https://s2.loli.net/2025/01/13/xe9jfiqPrDcONd7.png)
## Tree Class
### Tree Abstracton (Review)
![image.png](https://s2.loli.net/2025/01/13/UqdpVTmSfRoWbOE.png)
### Tree Class
![image.png](https://s2.loli.net/2025/01/13/a7R8CEomGkbHwM9.png)
```py
# demo
class Tree:
    """A tree is a label and a list of branches."""
    def __init__(self, label, branches=[]):
        self.label = label
        for branch in branches:
            assert isinstance(branch, Tree)
        self.branches = list(branches)

    def __repr__(self):
        if self.branches:
            branch_str = ', ' + repr(self.branches)
        else:
            branch_str = ''
        return 'Tree({0}{1})'.format(repr(self.label), branch_str)

    def __str__(self):
        return '\n'.join(self.indented())

    def indented(self):
        lines = []
        for b in self.branches:
            for line in b.indented():
                lines.append('  ' + line)
        return [str(self.label)] + lines

    def is_leaf(self):
        return not self.branches

def fib_tree(n):
    """A Fibonacci tree."""
    if n == 0 or n == 1:
        return Tree(n)
    else:
        left = fib_tree(n-2)
        right = fib_tree(n-1)
        fib_n = left.label + right.label
        return Tree(fib_n, [left, right])

>>> Tree(1)
Tree(1)
>>> Tree(1, [Tree(3), Tree(4)])
Tree(1, [Tree(3), Tree(4)])
>>> print(t)
1
  3
  4
>>> print(fib_tree(6))
8
  3
    1
      0
      1
    2
      1
      1
        0
        1
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

def leaves(tree):
    """Return the leaf values of a tree.

    >>> leaves(fib_tree(4))
    [0, 1, 1, 0, 1]
    """
    if tree.is_leaf():
        return [tree.label]
    else:
        all_leaves = []
        for b in tree.branches:
            all_leaves.extend(leaves(b))
        return all_leaves

def height(tree):
    """The height of a tree."""
    if tree.is_leaf():
        return 0
    else:
        return 1 + max([height(b) for b in tree.branches])

>>> leaves(fib_tree(6))
[0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1]
>>> sum(leaves(fib_tree(6)))
8
>>> height(fib_tree(6))
5
```
## Tree Mutation
### Example: Pruning Trees
![image.png](https://s2.loli.net/2025/01/13/7fHCyXecKJwOFro.png)
## Not covered
### Expressions
*predicate*:
*adjoin*：
*adjunction*:
*quadratic*:
## Q&A
```py
def permutations(s):
    """Yield permutations of list s.

    >>> list(permutations([1, 2, 3]))
    [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
    """
    if len(s) == 0:
        yield []
    for i in range(len(s)):
        start = s[i] # 2
        rest = [s[j] for j in range(len(s)) if j != i] # [1, 3]
        yield from [[start] + rest_permutation for rest_permutation in permutations(rest)]
```
## hw 05
```py
>>> ten, twenty, thirty = 10, 'twenty', [30]
>>> '{0} plus {1} is {2}'.format(ten, twenty, thirty)
'10 plus twenty is [30]'
```
```sh
PS C:\Users\vanad\Desktop\UCB_CS_61A\hw05\hw05_sol> python3 ok -q VendingMachine --local
=====================================================================
Assignment: Homework 5
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

PS C:\Users\vanad\Desktop\UCB_CS_61A\hw05\hw05_sol> python3 ok -q Mint --local
=====================================================================
Assignment: Homework 5
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

PS C:\Users\vanad\Desktop\UCB_CS_61A\hw05\hw05_sol> python3 ok -q store_digits --local
=====================================================================
Assignment: Homework 5
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

PS C:\Users\vanad\Desktop\UCB_CS_61A\hw05\hw05_sol> python3 ok -q is_bst --local
=====================================================================
Assignment: Homework 5
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

PS C:\Users\vanad\Desktop\UCB_CS_61A\hw05\hw05_sol> python3 ok -q preorder --local
=====================================================================
Assignment: Homework 5
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

PS C:\Users\vanad\Desktop\UCB_CS_61A\hw05\hw05_sol> python3 ok -q path_yielder --local
=====================================================================
Assignment: Homework 5
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.
```
