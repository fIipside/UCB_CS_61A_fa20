# Representation
## String Representations
### String Representations
- An object value should behave like the kind of data it is meant to represent 
- For instance, by producing a string representation of itself 
- Strings are important: they represent language and programs 
- In Python, all objects produce two string representations: 
    - The `str` is legible to humans 
    - The `repr` is legible to the Python interpreter 
- The `str` and `repr` strings are often the same, but not always
### The repr String for an Object
![ 2024-10-03 234140.png](https://s2.loli.net/2024/10/04/dQrzbYFm9c5ReTv.png)
### The str String for an Object
![ 2024-10-03 234656.png](https://s2.loli.net/2024/10/04/tNHhyCF8ZiweGsE.png)
```py
# demo
>>> from fractions import Fraction
>>> half = Fraction(1, 2)
>>> half
Fraction(1, 2)    
>>> repr(half)
'Fraction(1, 2)'
>>> print(half)
1/2    
>>> str(half)
'1/2'    
>>> eval(repr(half))
Fraction(1, 2)
>>> eval(str(half))
0.5

>>> s = 'hello world'
>>> s
'hello world'
>>> print(repr(s))
'hello world'
>>> print(s)
hello world
>>> print(str(s))
hello world
>>> str(s)
'hello world'
>>> repr(s)
"'hello world'"
>>> eval(repr(s))
'hello world'
>>> repr(repr(repr(s)))
'\'"\\\'hello world\\\'"\''
>>> eval(eval(eval(repr(repr(repr(s))))))
'hello world'
# Errors: eval('hello world')
```
## Polymorphic Functions
### Polymorphic Functions
![ 2024-10-04 000429.png](https://s2.loli.net/2024/10/04/8VoXCvHLZgtWexm.png)
### Implementing repr and str
![ 2024-10-04 000525.png](https://s2.loli.net/2024/10/04/87kXAO5uTILxPF1.png)
```py
# demo
class Bear:
    """A Bear."""

    def __init__(self):
        self.__repr__ = lambda: 'oski' # instance attribute
        self.__str__ = lambda: 'this bear'

    def __repr__(self): # class attribute
        return 'Bear()'

    def __str__(self):
        return 'a bear'

def print_bear():
    oski = Bear()
    print(oski)
    print(str(oski))
    print(repr(oski))
    print(oski.__repr__())
    print(oski.__str__())

def repr(x):
    return x.__repr__()

def str(x):
    t = type(x)
    if hasattr(t, '__str__'):
        return t.__str__(x)
    else:
        return repr(x)

>>> print_bear()
a bear
a bear
Bear()
oski
this bear
```
### Interfaces
- __Message passing__: Objects interact by looking up attributes on each other (passing messages) 
- he attribute look-up rules allow different data types to respond to the same message 
- A __shared message__ (attribute name) that elicits similar behavior from different object classes is a powerful method of abstraction 
- An interface is a set of shared messages, along with a specification of what they mean 
- Example: 
Classes that implement `__repr__` and `__str__` methods that return Python-interpretable and human-readable strings implement an interface for producing string representations
```py
# demo
class Ratio:
    def __init__(self, n, d):
        self.numer = n
        self.denom = d

    def __repr__(self):
        return 'Ratio({0}, {1})'.format(self.numer, self.denom)

    def __str__(self):
        return '{0}/{1}'.format(self.numer, self.denom)

>>> half = Ratio(1, 2)
>>> print(half)
1/2
>>> half
Ratio(1, 2)
```
## Special Method Names
### Special Method Names in Python
![ 2024-10-04 123359.png](https://s2.loli.net/2024/10/04/lC23yAVvumONE6d.png)
### Special Methods
- `__add__` and `__rand__` differ in the order.

![ 2024-10-04 123411.png](https://s2.loli.net/2024/10/04/HXnbPNKdQt9Zvzl.png)
```py
# demo
from fractions import gcd

class Ratio:
    def __init__(self, n, d):
        self.numer = n
        self.denom = d

    def __repr__(self):
        return 'Ratio({0}, {1})'.format(self.numer, self.denom)

    def __str__(self):
        return '{0}/{1}'.format(self.numer, self.denom)

    def __add__(self, other):
        if isinstance(other, Ratio):
            n = self.numer * other.denom + self.denom * other.numer
            d = self.denom * other.denom
        elif isinstance(other, int): # type dispatching
            n = self.numer + self.denom * other
            d = self.denom
        else:
            return float(self) + other # type coercion
        g = gcd(n, d)
        return Ratio(n // g, d // g)

    __radd__ = __add__
```
### Generic Functions
![ 2024-10-04 125002.png](https://s2.loli.net/2024/10/04/g67fe5h3LubwqiE.png)
### Example
![ 2024-10-04 124251.png](https://s2.loli.net/2024/10/04/MedBg2zRIJSP9xy.png)
![ 2024-10-04 124414.png](https://s2.loli.net/2024/10/04/lHfh5XwTeSEG9zY.png)
![ 2024-10-04 124742.png](https://s2.loli.net/2024/10/04/6v9JuZtPRF3qMlr.png)
## Q&A
```py
# demo
class A:
    """Base"""

class B(A):
    """Subclass"""

>>> b = B()
>>> isinstance(b, B)
True
>>> isinstance(b, A)
True
>>> type(b) == B
True
>>> type(b) == A
False
```
## Not covered
### Implementing Classes and Objects
### Expressions
*introspective*:
*coercion*:
*braille*:
*polymorphic*:
*protocol*:
*orthogonal*:
*elicit*:
*cumbersome*:
*latent*:
*rhombus*:
*quadrilateral*:
*widget*: