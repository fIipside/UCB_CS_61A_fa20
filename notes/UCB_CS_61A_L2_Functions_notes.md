# Functions
## Expressions
- An expression describes a computation and evaluates to a value. 
- All expressions can use function call notation. 
```py
# demo
>>> 2015
2015
>>> 2000 + 15
2015
>>> max(2, 4)
4
>>> from operator import add, mul
>>> add(2, 3)
5
>>> mul(2, 3)
6
```
### Anatomy of a Call Expression
- Operators and operands are also expressions. So they evaluate to values

![call_expression.png](https://s2.loli.net/2024/08/02/zCUxA31aYoGNpvR.png)
- Evaluation procedure for call expressions:
    1. Evaluate the operator and then the operand subexpressions 
    2. Apply the function that is the value of the operator  
to the arguments that are the values of the operands
### Evaluating Nested Expressions
![ 2024-08-02 144404.png](https://s2.loli.net/2024/08/02/CHxRPleF9SXG8Js.png)
## Names, Assignment, and User-Defined Functions
```py
# demo
# <C-L> clears the screen.
>>> from math import pi
>>> pi
3.141592653589793
>>> from math import sin
>>> sin(pi/2)
1.0
>>> radius = 10
>>> 2 * radius
20
>>> area, circ = pi * radius * radius, 2 * pi * radius
>>> area
314.1592653589793
>>> circ
62.83185307179586
>>> radius = 20
>>> area
314.1592653589793 # This is out of sync.
```
```py
>>> f = max
>>> f
<built-in function max>
>>> max
<built-in function max>
>>> f(1, 2, 3)
3
>>> max = 7
>>> f(1, 2, max)
7
>>> max = f
>>> max(1, 2, 3)
3
```
```py
>>> from operator import add, mul
>>> add
<built-in function add>
>>> def square(x):
...     return mul(x, x)
...
>>> square
<function square at 0x7fba78971630>
>>> square(11)
121
>>> square(add(3, 4))
49
```
```py
>>> def area():
...     return pi * radius * radius
...
>>> area
<function area at 0x7fba77633d90>
>>> area()
1256.6370614359173
>>> radius = 1
>>> area() 
3.141592653589793 # A function differs from a name. 
```
### Types of Expressions
- Primitive expressions: Number of Numeral(2), Name(add), String('hello').
- Call expressions: Opertator and Operand. 
## Environment Diagrams
- Environment diagrams visualize the interpreter's concept. Codes on the left(Statements and expressions. Arrows indicate evaluation order) and Frame on the right(Each name is bound to a value. Within a frame, a name cannot be repeated). 
- Details at [Online python tutor. ](https://pythontutor.com/cp/composingprograms.html#mode=display)
### Assignment Statements
-  Execution rule for assignment statements:
   1. Evaluate all expressions to the right of = from left to right. 
   2. Bind all names to the left of = to those resulting values in the current frame.

![ 2024-08-02 151033.png](https://s2.loli.net/2024/08/02/v96YDxo5U8IH3Tw.png)
![ 2024-08-02 151941.png](https://s2.loli.net/2024/08/02/rlQEfZmJI374XHO.png)
## Defining Functions
### Defining Functions
- Assignment is a simple means of abstraction: binds names to values. 
- Function definition is a more powerful means of abstraction: binds names to expressions.

![ 2024-08-02 180522.png](https://s2.loli.net/2024/08/02/gchxLFus2naeXkb.png)
- Execution procedure for def statements:
    1. Create a function with signature `<name>(<formal parameters>)` 
    2. Set the body of that function to be everything indented after the first line __The body is squirreled(hide in a safe place) until the function is called.__
    3. Bind `<name>` to that function in the current frame
*Squirrel: The longest English word with one syllable.* 
### Calling User-Defined Functions
- Procedure for calling/applying user-defined functions (version 1):
    1. Add a local frame, forming a new environment 
    2. Bind the function's formal parameters to its arguments in that frame 
    3. Execute the body of the function in that new environment

![ 2024-08-02 180537.png](https://s2.loli.net/2024/08/02/3h4cN5Vio9HkCmp.png)
- A function’s signature has all the information needed to create a local frame
### Looking Up Names In Environments
- Every expression is evaluated in the context of an environment. 
So far, the current environment is either: 
    - The global frame alone, or 
    - A local frame, followed by the global frame. 

![ 2024-08-02 180916.png](https://s2.loli.net/2024/08/02/k9tOmWa2UwXjupK.png)
- E.g., to look up some name in the body of the square function: 
    - Look for that name in the local frame. 
    - If not found, look for it in the global frame. 

(Built-in names like “max” are in the global frame too, but we don’t draw them in environment diagrams.)
## Not covered
### The non-pure print function(Covered in L3)
- __Pure functions.__ Functions have some input (their arguments) and return some output (the result of applying them). The built-in function
```py
>>> abs(-2)
2
```
![function_abs.png](https://s2.loli.net/2024/08/04/OKFUloMpZW4f6Sb.png)
- __Non-pure functions.__ In addition to returning a value, applying a non-pure function can generate side effects, which make some change to the state of the interpreter or computer. A common side effect is to generate additional output beyond the return value, using the print function.
```py
>>> print(1, 2, 3)
1 2 3
```
![function_print.png](https://s2.loli.net/2024/08/04/ayBvMXFVmEnO9HG.png)
- Pure functions are restricted in that they cannot have side effects or change behavior over time.
### Choosing Names(Covered in L6)
1. Function names are lowercase, with words separated by underscores. Descriptive names are encouraged.
2. Function names typically evoke operations applied to arguments by the interpreter (e.g., `print`, `add`, `square`) or the name of the quantity that results (e.g., `max`, `abs`, `sum`).
3. Parameter names are lowercase, with words separated by underscores. Single-word names are preferred.
4. Parameter names should evoke the role of the parameter in the function, not just the kind of argument that is allowed.
5. Single letter parameter names are acceptable when their role is obvious, but avoid "l" (lowercase ell), "O" (capital oh), or "I" (capital i) to avoid confusion with numerals.
### Functions as Abstractions(Covered in L4)
__Aspects of a functional abstraction.__ To master the use of a functional abstraction, it is often useful to consider its three core attributes. The _domain_ of a function is the set of arguments it can take. The _range_ of a function is the set of values it can return. The _intent_ of a function is the relationship it computes between inputs and output (as well as any side effects it might generate). Understanding functional abstractions via their domain, range, and intent is critical to using them correctly in a complex program.
### Operators(Covered in L3)
- Python expressions with infix operators each have their own evaluation procedures, but you can often think of them as short-hand for call expressions. 
- When it comes to division, Python provides two infix operators: `/` and `//`. The former is normal division, so that it results in a _floating point_, or decimal value, even if the divisor evenly divides the dividend. These two operators are shorthand for the `truediv` and `floordiv` functions.
### Expressions
*rewind*: to make a recording go back towards the beginning. 
*Anatomy*: the scientific study of the body and how its parts are arranged. 
*stipulate*: to say exactly how something must be or must be done. 
*override*: to decide against or refuse to accept a previous decision, an order, a person, etc.. 
## Q&A
- There's a precedence for evaluation of the frames: 

![ 2024-08-05 105352.png](https://s2.loli.net/2024/08/05/eo6tBxbFJdGPsYX.png)
- demos for `print`
## hw 01
```sh
python3 ok -q a_plus_abs_b --local
=====================================================================
Assignment: Homework 1
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.
MI-wsf# python3 ok -q two_of_three --local
=====================================================================
Assignment: Homework 1
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.
MI-wsf# python3 ok -q largest_factor --local
=====================================================================
Assignment: Homework 1
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.
MI-wsf# python3 ok -q with_if_statement --local
=====================================================================
Assignment: Homework 1
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.
MI-wsf# python3 ok -q with_if_function --local
=====================================================================
Assignment: Homework 1
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.
MI-wsf# python3 ok -q hailstone --local
=====================================================================
Assignment: Homework 1
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.
```