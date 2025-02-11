# Objects
## Class & Objects
- A class combines (and abstracts) data and functions
- An object is an instantiation of a class

![ 2024-08-31 132621.png](https://s2.loli.net/2024/08/31/jqUiNJWKYFIOGR8.png)
_String_ is a built-in class, _append_ is a function
_Int_ is a built-in class, + is a function
- We can define our own classes
myball = Ball(10.0, 15.0, 0.0, -5.0)
- constructor: 
    - allocate memory for a Ball object
    - initializes the Ball object with values
    - returns address of the Ball object
    - similar to a list

![ 2024-08-31 133732.png](https://s2.loli.net/2024/08/31/oMJYmA6GK4ihvOc.png)
![ 2024-08-31 133329.png](https://s2.loli.net/2024/08/31/giD6NT9xLmKyeqO.png)
## Object-Oriented Programming
### Object-Oriented Programming
![ 2024-08-31 204317.png](https://s2.loli.net/2024/08/31/ia1HJ7p9Yd8cSXm.png)
## Classes
- A class serves as a template for its instances
![ 2024-08-31 205043.png](https://s2.loli.net/2024/08/31/wOaUVq9QzGbjTLo.png)
## Class Statements
### The Class Statement
![ 2024-08-31 205424.png](https://s2.loli.net/2024/08/31/NAkr4uRlzMnwHCf.png)
### Object Construction
![ 2024-08-31 205043.png](https://s2.loli.net/2024/08/31/wOaUVq9QzGbjTLo.png)
### Object Identity
![ 2024-08-31 210350.png](https://s2.loli.net/2024/08/31/RpmCHQ28ELgljqh.png)
## Methods
### Methods
- Methods are functions defined in the suite of a class statement

![ 2024-08-31 221007.png](https://s2.loli.net/2024/08/31/lgOjoXGhF2dyn9b.png)
### Invoking Methods
![ 2024-08-31 211331.png](https://s2.loli.net/2024/08/31/GArqiL2QwapuWsb.png)
### Dot Expressions
![ 2024-08-31 211732.png](https://s2.loli.net/2024/08/31/MvGPuCBsjlxwkIa.png)
```py
# demo
class Account:
    def __init__(self, account_holder):
        self.holder = account_holder
        self.balance = 0

    def deposit(self, amount):
        """Add amount to balance."""
        self.balance = self.balance + amount
        return self.balance

    def withdraw(self, amount):
        """Subtract amount from balance if funds are available."""
        if amount > self.balance:
            return 'Insufficient funds'
        self.balance = self.balance - amount
        return self.balance

>>> Account
<class '__main__.Account'>
>>> john = Account('John')
>>> john
<__main__.Account object at 0x000002231656B070>
>>> type(john)
<class '__main__.Account'>
>>> john.balance
0
>>> john.holder
'John'
>>> john.deposit(10)
10
>>> john.deposit(10)
20
>>> john.deposit(10)
30
>>> john.balance
30
>>> john.withdraw(30)
0
>>> john.withdraw(30)
'Insufficient funds'
```
## Attributes
### Accessing Attributes
```py
>>> getattr
<built-in function getattr>
>>> getattr(john, 'balance')
0
>>> john.deposit(100)
100
>>> getattr(john, 'balance')
100
>>> hasattr(john, 'balance')
True
>>> hasattr(john, 'lance')
False
```
![ 2024-08-31 220421.png](https://s2.loli.net/2024/08/31/p1LHtiGEASn69vX.png)
### Methods and Functions
![ 2024-08-31 220431.png](https://s2.loli.net/2024/08/31/vrlXA4ZhDMNW8Oe.png)
### Looking Up Attributes by Name
![ 2024-08-31 220638.png](https://s2.loli.net/2024/08/31/th2QdoYjeTJ4zuZ.png)
### Class Attributes
- Class attributes are "shared" across all instances of a class because they are attributes 
of the class, not the instance
![ 2024-08-31 221007.png](https://s2.loli.net/2024/08/31/lgOjoXGhF2dyn9b.png)
## Q&A
```py
class Account:
    def _check_that_balance_is_not_negative(self):
        assert self.balance >= 0
    # With one or two underscore it means that you are not supposed to use it (hack on it).
```
```py
class Math:
    @staticmethod
    def square(x):
        return x * x

>>> Math.square(12)
144
>>> m = Math()
>>> m.square(12)
144
```
## Not covered
### Expressions
*instantiate*: to represent or be an example of something. 
*as opposed to*: rather than. 
*permutation*: any of the various ways in which a set of things can be ordered.
## hw 04
```sh
MI-wsf# python3 ok -q make_bank --local
=====================================================================
Assignment: Homework 4
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

MI-wsf# python3 ok -q make_withdraw --local
=====================================================================
Assignment: Homework 4
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

MI-wsf# python3 ok -q repeated --local
=====================================================================
Assignment: Homework 4
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

MI-wsf# python3 ok -q permutations --local
=====================================================================
Assignment: Homework 4
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

MI-wsf# python3 ok -q make_joint --local
=====================================================================
Assignment: Homework 4
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

MI-wsf# python3 ok -q remainders_generator --local
=====================================================================
Assignment: Homework 4
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

Cannot backup when running ok with --local.
```