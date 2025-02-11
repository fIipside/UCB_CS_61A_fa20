# Control
## Print and None
```py
# demo
>>> print('Go Bears!')
Go Bears!
>>> None
>>> print(None)
None
>>> print(print(1), print(2))
1
2
None None
```
### None Indicates that Nothing is Returned
- The special value `None` represents nothing in Python 
- A function that does not explicitly return a value will return `None` 
- __Careful__: `None` is _not displayed_ by the interpreter as the value of an expression
### Pure Functions & Non-Pure Functions
![ 2024-08-05 121726.png](https://s2.loli.net/2024/08/05/r85JxzUjcBYhIvM.png)
### Nested Expressions with Print
![ 2024-08-05 121804.png](https://s2.loli.net/2024/08/05/AQHpBwK3gUEYl9V.png)
## Multiple Environments
### Life Cycle of a User-Defined Function
![ 2024-08-05 122312.png](https://s2.loli.net/2024/08/05/MKWjwvSE8txaGU6.png)
### Multiple Environments in One Diagram!
![ 2024-08-05 122823.png](https://s2.loli.net/2024/08/05/qBcWI6d4ratYPy5.png)
- Every expression is evaluated in the context of an environment. 
- A name evaluates to the value bound to that name 
in the earliest frame of the current environment in which that name is found.
## Miscellaneous Python Features
```py
# demo
>>> from operator import add, mul
>>> mul(add(2, 3), add(4, 5))
45
>>> (2 + 3) * (4 + 5)
45
>>> 2013 / 10
201.3
>>> 2013 // 10
201
>>> from operator import truediv, floordiv
>>> truediv(2013, 10)
201.3
>>> floordiv(2013, 10)
201
>>> 2013 % 10
3
>>> from operator import mod
>>> mod(2013, 10)
3
```
```py
"""Our first Python source file."""

from operator import mod, floordiv

def divide_exact(n, d): # def divide_exact(n, d = 10): A placeholder for a defailt value
    """Return the quotient and remainder of dividing N by D.

    >>> quotient, remainder = divide_exact(618, 10)
    >>> quotient
    61
    >>> remainder
    8
    """
    return floordiv(n, d), mod(n, d)

quotient, remainder = divide_exact(2013, 10)
```
```sh
MI-wsf#python3 -i ex.py
>>> quotient
201
>>> remainder
3
MI-wsf# python3 -m doctest ex.py
```
## Conditional Statements
### Statements
- A statement is executed by the interpreter to perform an action
- The first header determines a statement’s type. The header of a clause “controls” the suite that follows. 
- A suite is a sequence of statements. To “execute” a suite means to execute its sequence of statements, in order. 

![ 2024-08-05 125611.png](https://s2.loli.net/2024/08/05/k8rYsqmtuKyWgEF.png)
- Execution Rule for a sequence of statements:
    - Execute the first statement 
    - Unless directed otherwise, execute the rest
### Conditional Statements
```py
# demo
def absolute_value(x):
    """Return the absolute value of x."""
    if x < 0:
        return -x
    elif x == 0:
        return 0
    else:
        return x
```
- __Execution Rule for Conditional Statements:__
    Each clause is considered in order. 
    1. Evaluate the header's expression. 
    2. If it is a true value, execute the suite & skip the remaining clauses.
- __Syntax Tips:__
    1. Always starts with "if" clause. 
    2. Zero or more "elif" clauses. 
    3. Zero or one "else" clause, always at the end.
### Boolean Context
- George Boole
- False values in Python: False, 0, '', None (*more to come*)
- True values in Python: Anything else (True)
## Iteration
### While Statements
```py
# demo
>>> i, total = 0, 0
>>> while i < 3:
...     i = i + 1
...     total = total + i
...
>>> i
3
>>> total
6
```
- __Execution Rule for While Statements:__
    1. Evaluate the header’s expression. 
    2. If it is a true value, execute the (whole) suite, then return to step 1. 
### Prime Factorization
- Each positive integer n has a set of prime factors: primes whose product is n. 
- One approach: Find the smallest prime factor of n, then divide by it. 
```py
# demo
def prime_factors(n):
    """Print the prime factors of n in non-decreasing order

    >>> prime_factors(8)
    2
    2
    2
    >>> prime_factors(9)
    3
    3
    >>> prime_factors(10)
    2
    5
    >>> prime_factors(11)
    11
    >>> prime_factors(12)
    2
    2
    3
    >>> prime_factors(858)
    2
    3
    11
    13
    """
    while n > 1:
        k = smallest_prime_factor(n)
        n = n // k
        print(k)

def smallest_prime_factor(n):
    """Return the smallest k > 1 that evenly divides n."""
    k = 2
    while n % k != 0:
        k = k + 1
    return k
```
```py
# demo
def prime_factors(n):    
    while n > 1:
        smallest_prime = 2
        while n % smallest_prime != 0:
            smallest_prime = smallest_prime + 1
        n = n // smallest_prime
        print(smallest_prime) # It is worse than the program that we have two functions.
```
## Q&A
- The name appearing in the function is called the _intrinsic name_. The name in a frame is a _bound name_. There is a difference between the two: different names may refer to the same function, but that function itself has only one intrinsic name.
```py
>>> max
<built-in function max>
>>> f = max
>>> f
<built-in function max>
```
- __Practical Guidance.__ When indenting a suite, all lines must be indented the same amount and in the same way (use spaces, not tabs). Any variation in indentation will cause an error.
- `round`: 
```py
>>> round (5 / 3)
2
```
- `if` will execute at most one. 
```py
if x > 1:
    print(1)
elif x > 0:
    print(0)
```
## Not covered
### Documentation
- A function definition will often include documentation describing the function, called a docstring, which must be indented along with the function body. Docstrings are conventionally triple quoted. The first line describes the job of the function in one line. The following lines can describe arguments and clarify the behavior of the function:
```py
>>> def pressure(v, t, n):
        """Compute the pressure in pascals of an ideal gas.

        Applies the ideal gas law: http://en.wikipedia.org/wiki/Ideal_gas_law

        v -- volume of gas, in cubic meters
        t -- absolute temperature in degrees kelvin
        n -- particles of gas
        """
        k = 1.38e-23  # Boltzmann's constant
        return n * k * t / v
```
- When you call `help` with the name of a function as an argument, you see its docstring (type `q` to quit Python help).
```py
>>> help(pressure)
```
- When writing Python programs, include docstrings for all but the simplest functions. Remember, code is written only once, but often read many times. The Python docs include [docstring guidelines](https://www.python.org/dev/peps/pep-0257/) that maintain consistency across different Python projects.
### Boolean operators(Covered in L4)
- Three basic logical operators are also built into Python:
```py
>>> True and False
False
>>> True or False
True
>>> not False
True
```
- Logical expressions have corresponding evaluation procedures. These procedures exploit the fact that the truth value of a logical expression can sometimes be determined without evaluating all of its subexpressions, a feature called _short-circuiting_.
- To evaluate the expression `<left>` and `<right>`:
    1. Evaluate the subexpression `<left>`.
    2. If the result is a false value v, then the expression evaluates to v.
    3. Otherwise, the expression evaluates to the value of the subexpression `<right>`.
- To evaluate the expression `<left>` or `<right>`:
    1. Evaluate the subexpression `<left>`.
    2. If the result is a true value `v`, then the expression evaluates to `v`.
    3. Otherwise, the expression evaluates to the value of the subexpression `<right>`.
- To evaluate the expression not <exp>:
    - Evaluate <exp>; The value is True if the result is a false value, and False otherwise.
- These values, rules, and operators provide us with a way to combine the results of comparisons. Functions that perform comparisons and return boolean values typically begin with `is`, not followed by an underscore (e.g., `isfinite`, `isdigit`, `isinstance`, etc.).
### Testing
- __Assertions.__ Programmers use `assert` statements to verify expectations, such as the output of a function being tested. An `assert` statement has an expression in a boolean context, followed by a quoted line of text (single or double quotes are both fine, but be consistent) that will be displayed if the expression evaluates to a false value.
```py
>>> def fib_test():
        assert fib(2) == 1, 'The 2nd Fibonacci number should be 1'
        assert fib(3) == 1, 'The 3rd Fibonacci number should be 1'
        assert fib(50) == 7778742049, 'Error at the 50th Fibonacci number'
```
- Below, the globals function returns a representation of the `global` environment, which the interpreter needs in order to evaluate expressions.
```py
>>> from doctest import testmod
>>> testmod()
```
TestResults(failed=0, attempted=2)
- To verify the `doctest` interactions for only a single function, we use a doctest function called `run_docstring_examples`. This function is (unfortunately) a bit complicated to call. Its first argument is the function to test. The second should always be the result of the expression `globals()`, a built-in function that returns the global environment. The third argument is `True` to indicate that we would like "verbose" output: a catalog of all tests run.
```py
>>> from doctest import run_docstring_examples
>>> run_docstring_examples(sum_naturals, globals(), True)
```
### Expressions
*suite*: a set of related software (= computer program) products. 
*hallmark*: a typical characteristic or feature of a person or thing. 
## lab 01
```py
>>> -1 and 1 > 0 # If this errors, just type Error.
? True
-- OK! --

>>> def how_big(x):
...     if x > 10:
...         print('huge')
...     elif x > 5:
...         return 'big'
...     elif x > 0:
...         print('small')
...     else:
...         print("nothing")
>>> how_big(7)
? 'big'
-- OK! --

>>> True and 13
? 13
-- OK! --

Q: How do you prevent the ok autograder from interpreting print statements as output?
Choose the number of the correct choice:
0) You don't need to do anything, ok only looks at returned values, not printed values
1) Print with # at the front of the outputted line
2) Print with 'DEBUG:' at the front of the outputted line
? 2
-- OK! --

Q: What is the best way to open an interactive terminal to investigate a failing test for question sum_digits in assignment lab01?
Choose the number of the correct choice:
0) python3 ok -q sum_digits --trace
1) python3 -i lab01.py
2) python3 ok -q sum_digits -i
3) python3 ok -q sum_digits
? 2
-- OK! --

Q: What is the best way to look at an environment diagram to investigate a failing test for question sum_digits in assignment lab01?
Choose the number of the correct choice:
0) python3 ok -q sum_digits
1) python3 ok -q sum_digits --trace
2) python3 ok -q sum_digits -i
3) python3 -i lab01.py
? 1
-- OK! --

Q: Which of the following is NOT true?
Choose the number of the correct choice:
0) It is generally bad practice to release code with debugging print statements left in
1) Debugging is not a substitute for testing
2) It is generally good practice to release code with assertion statements left in
3) Code that returns a wrong answer instead of crashing is generally better as it at least works fine
4) Testing is very important to ensure robust code
? 3
-- OK! --

MI-wsf# python3 ok -q falling --local
=====================================================================
Assignment: Lab 1
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

MI-wsf# python3 ok -q sum_digits --local
=====================================================================
Assignment: Lab 1
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

MI-wsf# python3 ok -q double_eights --local
=====================================================================
Assignment: Lab 1
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

>>> def bake(cake, make):
...    if cake == 0:
...        cake = cake + 1
...        print(cake)
...    if cake == 1:
...        print(make)
...    else:
...        return cake
...    return make
>>> bake(0, 29)
(line 1)? 1
(line 2)? 29
(line 3)? 29
-- OK! --

>>> bake(1, "mashed potatoes")
(line 1)? mashed potatoes
(line 2)? "mashed potatoes"
-- OK! --
```