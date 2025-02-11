# Iterators
## Iterators
![ 2024-08-28 130724.png](https://s2.loli.net/2024/08/28/FnYARhN4ZU1B7H9.png)
```py
# demo
>>> s = [[1, 2], 3, 4, 5]
>>> s
[[1, 2], 3, 4, 5]
>>> t = iter(s)
>>> next(t)
[1, 2]
>>> next(t)
3
>>> list(t)
[4, 5]
```
## Dictionary Iteration
### Views of a Dictionary
![ 2024-08-28 131305.png](https://s2.loli.net/2024/08/28/qL4IXOrRx952ei3.png)
```py
# demo
>>> d = {'one': 1, 'two': 2}
>>> k = iter(d)
>>> next(k)
'one'
>>> d['zero'] = 0
>>> next(k)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
RuntimeError: dictionary changed size during iteration
>>> d
{'one': 1, 'two': 2, 'zero': 0}
>>> k = iter(d)
>>> next(k)
'one'
>>> next(k)
'two'
>>> d['zero'] = 5
>>> next(k)
'zero'
```
## For Statements
```py
# demo
>>> r = range(3, 6)
>>> list(r)
[3, 4, 5]
>>> for i in r:
...     print(i)
...
3
4
5
>>> ri = iter(r)
>>> ri
<range_iterator object at 0x0000023F0CAFA090>
>>> next(ri)
3
>>> for i in ri:
...     print(i)
...
4
5
>>> ri = iter(r)
>>> for i in ri:
...     print(i)
...
3
4
5
```
## Built-In Iterator Functions
### Built-in Functions for Iteration
![ 2024-08-28 132510.png](https://s2.loli.net/2024/08/28/MnklSNtibZR6CWE.png)
```py
# demo
def double(x):
    print('***', x, '=>', 2*x, '***')
    return 2*x

>>> m = map(double, [3, 5, 7])
>>> next(m)
*** 3 => 6 ***
6
>>> next(m)
*** 5 => 10 ***
10
>>> next(m)
*** 7 => 14 ***
14
>>> m = map(double, range(3, 7))
>>> f = lambda y: y >= 10
>>> t = filter(f, m)
>>> next(t)
*** 3 => 6 ***
*** 4 => 8 ***
*** 5 => 10 ***
10
>>> next(t)
*** 6 => 12 ***
12
>>> list(t)
[]
>>> list(filter(f, map(double, range(3, 7))))
*** 3 => 6 ***
*** 4 => 8 ***
*** 5 => 10 ***
*** 6 => 12 ***
[10, 12]

>>> t = [1, 2, 3, 2, 1]
>>> t
[1, 2, 3, 2, 1]
>>> reversed(t)
<list_reverseiterator object at 0x00000217A7D9A770>
>>> t == reversed(t)
False
>>> list(reversed(t))
[1, 2, 3, 2, 1]

>>> d = {'a': 1, 'b': 2}
>>> d
{'a': 1, 'b': 2}
>>> items = iter(d.items())
>>> next(items)
('a', 1)
>>> next(items)
('b', 2)
>>> items = zip(d.keys(), d.values())
>>> next(items)
('a', 1)
>>> next(items)
('b', 2)
```
## Generators
### Generators and Generator Functions
![ 2024-08-28 133820.png](https://s2.loli.net/2024/08/28/pXYi8ThoA5OELMa.png)
```py
# demo
def evens(start, end):
    even = start + (start % 2)
    while even < end:
        yield even
        even += 2
```
## Generators & Iterators
### Generators can Yield from Iterators
![ 2024-08-28 164040.png](https://s2.loli.net/2024/08/28/XzmGbT1VyIjkvY4.png)
```py
# demo
def countdown(k):
    if k > 0:
        yield k
        yield from countdown(k-1)

def prefixes(s):
    if s:
        yield from prefixes(s[:-1])
        yield s

def substrings(s):
    if s:
        yield from prefixes(s)
        yield from substrings(s[1:])

>>> list(prefixes('both'))
['b', 'bo', 'bot', 'both']
>>> list(substrings('tops'))
['t', 'to', 'top', 'tops', 'o', 'op', 'ops', 'p', 'ps', 's']
```
## Q&A
```py
>>> t = iter([1, 2, 3])
>>> list(t)
[1, 2, 3]
>>> list(t)
[]
# This is because t is an iterator, and once an iterator is consumed (iterated over), it cannot be reused.
```
```py
def f(x):
    return [x for x in [1, 2, 3]]
```
## Not covered
### Python Streams
- *Streams* offer another way to represent sequential data implicitly. A stream is a lazily computed linked list. Like the `Link` class from Chapter 2, a `Stream` instance responds to requests for its `first` element and the `rest` of the stream. Like an `Link`, the `rest` of a Stream is itself a `Stream`. Unlike an `Link`, the `rest` of a stream is only computed when it is looked up, rather than being stored in advance. That is, the `rest` of a stream is computed lazily.
- To achieve this lazy evaluation, a stream stores a function that computes the rest of the stream. Whenever this function is called, its returned value is cached as part of the stream in an attribute called `_rest`, named with an underscore to indicate that it should not be accessed directly.
- The accessible attribute `rest` is a property method that returns the rest of the stream, computing it if necessary. With this design, a stream stores how to *compute* the rest of the stream, rather than always storing the rest explicitly.
```py
>>> class Stream:
        """A lazily computed linked list."""
        class empty:
            def __repr__(self):
                return 'Stream.empty'
        empty = empty()
        def __init__(self, first, compute_rest=lambda: empty):
            assert callable(compute_rest), 'compute_rest must be callable.'
            self.first = first
            self._compute_rest = compute_rest
        @property
        def rest(self):
            """Return the rest of the stream, computing it if necessary."""
            if self._compute_rest is not None:
                self._rest = self._compute_rest()
                self._compute_rest = None
            return self._rest
        def __repr__(self):
            return 'Stream({0}, <...>)'.format(repr(self.first))
```
- A linked list is defined using a nested expression. For example, we can create an `Link` that represents the elements 1 then 5 as follows. Likewise, we can create a `Stream` representing the same series. The `Stream` does not actually compute the second element 5 until the rest of the stream is requested. We achieve this effect by creating anonymous functions. Accessing the elements of linked list `r` and stream `s` proceed similarly. However, while 5 is stored within `r`, it is computed on demand for `s` via addition, the first time that it is requested. 
```py
>>> r = Link(1, Link(2+3, Link(9)))
>>> s = Stream(1, lambda: Stream(2+3, lambda: Stream(9)))
>>> r.first
1
>>> s.first
1
>>> r.rest.first
5
>>> s.rest.first
5
>>> r.rest
Link(5, Link(9))
>>> s.rest
Stream(5, <...>)
```
- When a `Stream` instance is constructed, the field `self._rest` is `None`, signifying that the rest of the `Stream` has not yet been computed. When the `rest` attribute is requested via a dot expression, the `rest` property method is invoked, which triggers computation with `self._rest = self._compute_rest()`. Because of the caching mechanism within a `Stream`, the `compute_rest` function is only ever called once, then discarded. The essential properties of a `compute_rest` function are that it takes no arguments, and it returns a `Stream` or `Stream.empty`.
- Lazy evaluation gives us the ability to represent infinite sequential datasets using streams. For example, we can represent increasing integers, starting at any `first` value.
```py
>>> def integer_stream(first):
        def compute_rest():
            return integer_stream(first+1)
        return Stream(first, compute_rest)
>>> positives = integer_stream(1)
>>> positives
Stream(1, <...>)
>>> positives.first
1
>>> positives.first
1
>>> positives.rest.first
2
>>> positives.rest.rest
Stream(3, <...>)
```
The same higher-order functions that manipulate sequences -- `map` and `filter` -- also apply to streams, although their implementations must change to apply their argument functions lazily.
```py
>>> def map_stream(fn, s):
        if s is Stream.empty:
            return s
        def compute_rest():
            return map_stream(fn, s.rest)
        return Stream(fn(s.first), compute_rest)

>>> def filter_stream(fn, s):
        if s is Stream.empty:
            return s
        def compute_rest():
            return filter_stream(fn, s.rest)
        if fn(s.first):
            return Stream(s.first, compute_rest)
        else:
            return compute_rest()
```
- To inspect the contents of a stream, we can coerce up to the first k elements to a Python `list`.
```py
>>> def first_k_as_list(s, k):
        first_k = []
        while s is not Stream.empty and k > 0:
            first_k.append(s.first)
            s, k = s.rest, k-1
        return first_k

>>> s = integer_stream(3)
>>> s
Stream(3, <...>)
>>> m = map_stream(lambda x: x*x, s)
>>> m
Stream(9, <...>)
>>> first_k_as_list(m, 5)
[9, 16, 25, 36, 49]

>>> def primes(pos_stream):
        def not_divible(x):
            return x % pos_stream.first != 0
        def compute_rest():
            return primes(filter_stream(not_divible, pos_stream.rest))
        return Stream(pos_stream.first, compute_rest)

>>> prime_numbers = primes(integer_stream(2))
>>> first_k_as_list(prime_numbers, 7)
[2, 3, 5, 7, 11, 13, 17]
```
- By truncating the primes stream, we can enumerate any prefix of the prime numbers. 
- Streams contrast with iterators in that they can be passed to pure functions multiple times and yield the same result each time. The primes stream is not "used up" by converting it to a list. That is, the `first` element of `prime_numbers` is still 2 after converting the prefix of the stream to a list.
```py
>>> prime_numbers.first
2
```
### Expressions
*cache*: to put something in a hidden or safe store. 
*prototype*: the first example of something, such as a machine or other industrial product, from which all later forms are developed. 
*posterity*: the people who will exist in the future. 
*decompress*: to reduce in pressure or return to the original lower pressure, or to cause something to do this. 
*sieve*: a tool consisting of a wood, plastic, or metal frame with a wire or plastic net attached to it. 
