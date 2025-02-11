# Data Abstraction
## Data Abstraction
### Data Abstraction
![ 2024-08-22 133126.png](https://s2.loli.net/2024/08/22/ljzrStCPBHxAk2o.png)
### Rational Numbers
![ 2024-08-22 133308.png](https://s2.loli.net/2024/08/22/fC6QgVmnqOTcdsG.png)
### Rational Number Arithmetic
![ 2024-08-22 133324.png](https://s2.loli.net/2024/08/22/1rkMUhf2wns3qdW.png)
### Rational Number Arithmetic Implementation
![ 2024-08-22 133336.png](https://s2.loli.net/2024/08/22/SBTHQl4pUAsGaXV.png)
## Pairs
### Representing Pairs Using Lists
![ 2024-08-22 133649.png](https://s2.loli.net/2024/08/22/FDkPm4JoCUMXL5q.png)
### Representing Rational Numbers
![ 2024-08-22 133659.png](https://s2.loli.net/2024/08/22/D2V7E6cUzhXqpgW.png)
### Reducing to Lowest Terms
![ 2024-08-22 133709.png](https://s2.loli.net/2024/08/22/J8BlKmUhWO7cEzo.png)
## Abstraction Barriers
### Abstraction Barriers
![ 2024-08-22 134215.png](https://s2.loli.net/2024/08/22/n3CPy8a7GQEWYKo.png)
### Violating Abstraction Barriers
![ 2024-08-22 134338.png](https://s2.loli.net/2024/08/22/WVynOFC2xUhbzp1.png)
![ 2024-08-22 135438.png](https://s2.loli.net/2024/08/22/qLzkO9Riw5tWV8G.png)
## Data Representations
### What are Data?
- We need to guarantee that constructor and selector functions work together to specify the right behavior 
- Behavior condition: If we construct rational number x from numerator n and denominator d, then numer(x)/denom(x) must equal n/d 
- Data abstraction uses selectors and constructors to define behavior 
- If behavior conditions are met, then the representation is valid
- __You can recognize an abstract data representation by its behavior__
### Rationals Implemented as Functions
![ 2024-08-22 135201.png](https://s2.loli.net/2024/08/22/uweX24i5Dyogcnr.png)
## Dictionaries
```py
# demo
>>> {'I': 1, 'V': 5, 'X': 10}
{'X': 10, 'V': 5, 'I': 1}
>>> numerals = {'I': 1, 'V': 5, 'X': 10}
>>> numerals
{'I': 1, 'V': 5, 'X': 10}
>>> numerals['X']
10
>>> numerals.key()
dict_keys(['X', 'V', 'I'])
>>> numerals.values()
dict_values([10, 5, 1])
>>> numerals.item()
dict_items([('X', 10), ('V', 5), ('I', 1)])

>>> items = [('X', 10), ('V', 5), ('I', 1)]
>>> items
[('X', 10), ('V', 5), ('I', 1)]
>>> dict(items)
{'X': 10, 'V': 5, 'I': 1}
>>> dict(items)['X']
10

>>> 'X' in numerals
True
>>> 'X-ray' in numerals
False
>>> numerals.get('X', 0)
10
>>> numerals.get('X-ray', 0)
0
>>> {x: x * x for x in range(10)}

>>> {x: x * x for x in range(10)}
{0: 0, 1: 1, 2: 4, 3: 9, 4: 16, 5: 25, 6: 36, 7: 49, 8: 64, 9: 81}
>>> squares = {x: x * x for x in range(10)}
>>> squares[7]
49
>>> {1: 2, 1: 3}
{1: 3}
>>> {1: [2, 3]}
{1: [2, 3]}
```
### Limitation on Dictionaries
- Dictionaries are __unordered__ collections of key-value pairs 
- Dictionary keys do have two restrictions: 
    - A key of a dictionary __cannot be__ a list or a dictionary (or any mutable type) 
    - Two __keys cannot be equal__; There can be at most one value for a given key 
- This first restriction is tied to Python's underlying implementation of dictionaries 
- The second restriction is part of the dictionary abstraction 
- If you want to associate multiple values with a key, store them all in a sequence value
## Not covered
### Expressions
*shield from*: to protect someone or something from. 
## cats
```sh
MI-wsf# python3 ok -q 01 --local
=====================================================================
Assignment: Project 2: Cats
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    101 test cases passed! No cases failed.

MI-wsf# python3 ok -q 02 --local
=====================================================================
Assignment: Project 2: Cats
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    101 test cases passed! No cases failed.

MI-wsf# python3 ok -q 03 --local
=====================================================================
Assignment: Project 2: Cats
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    102 test cases passed! No cases failed.

MI-wsf# python3 ok -q 04 --local
=====================================================================
Assignment: Project 2: Cats
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    103 test cases passed! No cases failed.

MI-wsf# python3 ok -q 05 --local
=====================================================================
Assignment: Project 2: Cats
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    103 test cases passed! No cases failed.

MI-wsf# python3 ok -q 06 --local
=====================================================================
Assignment: Project 2: Cats
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    104 test cases passed! No cases failed.

MI-wsf# python3 ok -q 07 --local
=====================================================================
Assignment: Project 2: Cats
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    103 test cases passed! No cases failed.

MI-wsf# python3 ok -q 08 --local
=====================================================================
Assignment: Project 2: Cats
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    101 test cases passed! No cases failed.

MI-wsf# python3 ok -q 09 --local
=====================================================================
Assignment: Project 2: Cats
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    102 test cases passed! No cases failed.

MI-wsf# python3 ok -q 10 --local
=====================================================================
Assignment: Project 2: Cats
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    102 test cases passed! No cases failed.

Point breakdown
    Problem 1: 1.0/1
    Problem 2: 2.0/2
    Problem 3: 1.0/1
    Problem 4: 1.0/1
    Problem 5: 2.0/2
    Problem 6: 2.0/2
    Problem 7: 3.0/3
    Problem 8: 2.0/2
    Problem 9: 1.0/1
    Problem 10: 2.0/2

Score:
    Total: 17.0
```