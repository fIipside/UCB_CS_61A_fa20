# Calculator
## Programming Languages
### Programming Languages
![image.png](https://s2.loli.net/2025/01/21/U7p5RrlXLTimWCv.png)
### Metalinguistic Abstraction
![image.png](https://s2.loli.net/2025/01/21/OheDsnVLyKo7wB2.png)
## Parsing
### Parsing
![image.png](https://s2.loli.net/2025/01/21/7mTEfZ6GNURI53c.png)
### Recursive Syntactic Analysis
![image.png](https://s2.loli.net/2025/01/21/r73vcWot48AlKBN.png)
### Syntactic Analysis
![image.png](https://s2.loli.net/2025/01/21/RneF2BDdpAXL58N.png)
```py
# demo
def scheme_read(src):
    """Read the next expression from src, a Buffer of tokens.

    >>> lines = ['(+ 1 ', '(+ 23 4)) (']
    >>> src = Buffer(tokenize_lines(lines))
    >>> print(scheme_read(src))
    (+ 1 (+ 23 4))
    """
    if src.current() is None:
        raise EOFError
    val = src.pop()
    if val == 'nil':
        return nil
    elif val not in DELIMITERS:  # ( ) ' .
        return val
    elif val == "(":
        return read_tail(src)
    else:
        raise SyntaxError("unexpected token: {0}".format(val))

def read_tail(src):
    """Return the remainder of a list in src, starting before an element or ).

    >>> read_tail(Buffer(tokenize_lines([')'])))
    nil
    >>> read_tail(Buffer(tokenize_lines(['2 3)'])))
    Pair(2, Pair(3, nil))
    >>> read_tail(Buffer(tokenize_lines(['2 (3 4))'])))
    Pair(2, Pair(Pair(3, Pair(4, nil)), nil))
    """
    if src.current() is None:
        raise SyntaxError("unexpected end of file")
    if src.current() == ")":
        src.pop()
        return nil
    first = scheme_read(src)
    rest = read_tail(src)
    return Pair(first, rest)

> ((1 2) 3)
Pair(Pair(1, Pair(2, nil)), Pair(3, nil))
```
## Calculator
```Scheme
# demo
PS C:\Users\vanad\Downloads\29\scalc> python3 -i scalc.py
> (* 1 2 3)
6
> (+)
0
> (+ 2 (/ 4 8))
2.5
> (+ 1
        (- 23)
  (* 4 2.5)
  )
-12
```
### The Pair Class
![image.png](https://s2.loli.net/2025/01/21/eY4mOtMSdHsBwXJ.png)
### Calculator Syntax
![image.png](https://s2.loli.net/2025/01/21/6tnmbshCMHi31G2.png)
### Calculator Semantics
![image.png](https://s2.loli.net/2025/01/21/A2iTVUW8NjvgZ9d.png)
## Evaluation
### The Eval Function
![image.png](https://s2.loli.net/2025/01/21/Pyq7CX1MNhDszLO.png)
### Applying Built-in Operators
![image.png](https://s2.loli.net/2025/01/21/xZlbiXtGv6RdwFq.png)
```py
# demo
ef calc_eval(exp):
    """Evaluate a Calculator expression.

    >>> calc_eval(as_scheme_list('+', 2, as_scheme_list('*', 4, 6)))
    26
    >>> calc_eval(as_scheme_list('+', 2, as_scheme_list('/', 40, 5)))
    10
    """
    if type(exp) in (int, float):
        return simplify(exp)
    elif isinstance(exp, Pair):
        arguments = exp.second.map(calc_eval)
        return simplify(calc_apply(exp.first, arguments))
    else:
        raise TypeError(str(exp) + ' is not a number or call expression')

def calc_apply(operator, args):
    """Apply the named operator to a list of args.

    >>> calc_apply('+', as_scheme_list(1, 2, 3))
    6
    >>> calc_apply('-', as_scheme_list(10, 1, 2, 3))
    4
    >>> calc_apply('-', as_scheme_list(10))
    -10
    >>> calc_apply('*', nil)
    1
    >>> calc_apply('*', as_scheme_list(1, 2, 3, 4, 5))
    120
    >>> calc_apply('/', as_scheme_list(40, 5))
    8.0
    >>> calc_apply('/', as_scheme_list(10))
    0.1
    """
    if not isinstance(operator, str):
        raise TypeError(str(operator) + ' is not a symbol')
    if operator == '+':
        return reduce(add, args, 0)
    elif operator == '-':
        if len(args) == 0:
            raise TypeError(operator + ' requires at least 1 argument')
        elif len(args) == 1:
            return -args.first
        else:
            return reduce(sub, args.second, args.first)
    elif operator == '*':
        return reduce(mul, args, 1)
    elif operator == '/':
        if len(args) == 0:
            raise TypeError(operator + ' requires at least 1 argument')
        elif len(args) == 1:
            return 1/args.first
        else:
            return reduce(truediv, args.second, args.first)
    else:
        raise TypeError(operator + ' is an unknown operator')

> (2)
TypeError: 2 is not a symbol
> (+)
0
> (+ 1 2 3)
6
> (-)
TypeError: - requires at least 1 argument
> (- 2)
-2
> (- 10 1 2 3)
4
> (* 1 2 3 4)
24
> (/)
TypeError: / requires at least 1 argument
> (/ 4)
0.25
> (/ 1024 2 2 2 2 2)
32
> (? 2 3)
TypeError: ? is an unknown operator
```
## Interactive Interpreters
### Read-Eval-Print Loop
![image.png](https://s2.loli.net/2025/01/21/6YLjUN3q8Dw9lHP.png)
```py
# demo
def read_eval_print_loop():
    """Run a read-eval-print loop for Calculator."""
    while True:
        try:
            src = buffer_input()
            while src.more_on_line:
                expression = scheme_read(src)
                print(calc_eval(expression))
        except (SyntaxError, TypeError, ValueError, ZeroDivisionError) as err:
            print(type(err).__name__ + ':', err)
        except (KeyboardInterrupt, EOFError):  # <Control>-D, etc.
            print('Calculation completed.')
            return
```
### Raising Exceptions
![image.png](https://s2.loli.net/2025/01/21/RQs264woPKeId1T.png)
```Scheme
> 2.3.4
ValueError: invalid numeral: 2.3.4
> )
SyntaxError: unexpected token: )
> ()
TypeError: () is not a number or call expression
> (-)
TypeError: - requires at least 1 argument
> (/ 1 0)
ZeroDivisionError: division by zero
```
### Handling Exceptions
- An interactive interpreter prints information about each error 
- A well-designed interactive interpreter should not halt completely on an error, so that the user has an opportunity to try again in the current environment
## hw 07
```sh
PS E:\UCB_CS_61A\hw07\hw07_sol> python3 ok -q filter_lst --local
=====================================================================
Assignment: Homework 7
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    6 test cases passed! No cases failed.

PS E:\UCB_CS_61A\hw07\hw07_sol> python3 ok -q interleave --local
=====================================================================
Assignment: Homework 7
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    3 test cases passed! No cases failed.

PS E:\UCB_CS_61A\hw07\hw07_sol> python3 ok -q accumulate --local
=====================================================================
Assignment: Homework 7
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    2 test cases passed! No cases failed.

PS E:\UCB_CS_61A\hw07\hw07_sol> python3 ok -q no_repeats --local
=====================================================================
Assignment: Homework 7
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    3 test cases passed! No cases failed.
```
## Not covered
### Expressions
- *metalinguistic*: metalinguistics is the study of language and its relationship to other cultural behaviors.
- *parse*: to separate a sentence into grammatical parts, such as subject, verb, etc.
- *predicate*: in grammar, the part of a sentence that contains the verb and gives information about the subject. 
