# Inheritance
## Attributes
### Terminology: Attributes, Functions, and Methods
![ 2024-09-01 125940.png](https://s2.loli.net/2024/09/01/Sj1ivdOqhaPRlTm.png)
### Looking Up Attributes by Name
![ 2024-09-01 130005.png](https://s2.loli.net/2024/09/01/2XQf9Tb81mNKu6E.png)
## Attribute Assignment
### Assignment to Attributes
- Assignment statements with a dot expression on their left-hand side affect attributes for 
the object of that dot expression 
    - If the object is an instance, then assignment sets an instance attribute 
    - If the object is a class, then assignment sets a class attribute

![ 2024-09-01 132640.png](https://s2.loli.net/2024/09/01/peG3DHQJECZYSTa.png)
### Attribute Assignment Statements
![ 2024-09-01 132651.png](https://s2.loli.net/2024/09/01/T1zdfsnOv9BX5mo.png)
## Inheritance
### Inheritance
- Inheritance is a technique for relating classes together 
- A common use: Two similar classes differ in their degree of specialization

![ 2024-09-01 133022.png](https://s2.loli.net/2024/09/01/Uv1e93amTCpYzSh.png)
### Inheritance Example
![ 2024-09-01 153529.png](https://s2.loli.net/2024/09/01/pmHaiX1oWctJUsQ.png)
### Looking Up Attribute Names on Classes
![ 2024-09-01 133522.png](https://s2.loli.net/2024/09/01/UMkvjzYiNH9d3al.png)
```py
# demo
>>> a = Account('John')
>>> b = CheckingAccount('Jack')
>>> a
<__main__.Account object at 0x000001D403E98850>
>>> b
<__main__.CheckingAccount object at 0x000001D403E986A0>
>>> a.balance
0
>>> b.balance
0
>>> a.deposit(100)
100
>>> b.deposit(100)
100
>>> a.withdraw(10)
90
>>> b.withdraw(10)
89
```
## Object-Oriented Design
### Designing for Inheritance
![ 2024-09-01 134317.png](https://s2.loli.net/2024/09/01/Irjnu9lC4MBpwgL.png)
### Inheritance and Composition
- Object-oriented programming shines when we adopt the metaphor 
Inheritance is best for representing is-a relationships 
    - E.g., a checking account is a specific type of account 
    - So, CheckingAccount inherits from Account 
- Composition is best for representing has-a relationships 
    - E.g., a bank has a collection of bank accounts it manages 
    - So, A bank has a list of accounts as an attribute
```py
# demo
class Bank:
    """A bank has accounts and pays interest.

    >>> bank = Bank()
    >>> john = bank.open_account('John', 10)
    >>> jack = bank.open_account('Jack', 5, CheckingAccount)
    >>> john.interest
    0.02
    >>> jack.interest
    0.01
    >>> bank.pay_interest()
    >>> john.balance
    10.2
    >>> bank.too_big_to_fail()
    True
    """
    def __init__(self):
        self.accounts = []

    def open_account(self, holder, amount, kind=Account):
        account = kind(holder)
        account.deposit(amount)
        self.accounts.append(account)
        return account

    def pay_interest(self):
        for account in self.accounts:
            account.deposit(account.balance * account.interest)
    
    def too_big_to_fail(self):
        return len(self.accounts) > 1
```
## Attributes Lookup Practice
### Inheritance and Attribute Lookup
![ 2024-09-01 135615.png](https://s2.loli.net/2024/09/01/23dAwFehuK6mvcP.png)
## Multiple Inheritance
### Multiple 
![ 2024-09-01 140444.png](https://s2.loli.net/2024/09/01/LuoWpO6QXDlFAke.png)
![ 2024-09-01 140653.png](https://s2.loli.net/2024/09/01/uHX6FNJfwnmZgVy.png)
### Resolving Ambiguous Class Attribute Names
![ 2024-09-01 140730.png](https://s2.loli.net/2024/09/01/whcKfPvSRHGo8W2.png)
## Complicated Inheritance
### Biological InheritanceS
![ 2024-09-01 140815.png](https://s2.loli.net/2024/09/01/kJ5NKnU1T3pSaZO.png)
## Not covered
### Expressions
*vroom*: used in writing to represent the sound of a car engine at high speed. 
*namesake*: a person or thing having the same name as another person or thing. 
*vanquish*: to defeat an enemy or opponent, especially in war. 
*antagonistic*: actively opposing or showing unfriendliness towards something or someone. 
## lab 07
```sh
MI-wsf# python3 ok -q scale --local
=====================================================================
Assignment: Lab 7
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

MI-wsf# python3 ok -q hailstone --local
=====================================================================
Assignment: Lab 7
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

MI-wsf# python3 ok -q Card.__init__ --local
=====================================================================
Assignment: Lab 7
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

MI-wsf# python3 ok -q Card.power --local
=====================================================================
Assignment: Lab 7
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.
    
MI-wsf# python3 ok -q Player.__init__ --local
=====================================================================
Assignment: Lab 7
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

MI-wsf# python3 ok -q Player.draw --local
=====================================================================
Assignment: Lab 7
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

MI-wsf# python3 ok -q Player.play --local
=====================================================================
Assignment: Lab 7
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

MI-wsf# python3 ok -q TutorCard.effect --local
=====================================================================
Assignment: Lab 7
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

MI-wsf# python3 ok -q TACard.effect --local
=====================================================================
Assignment: Lab 7
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

MI-wsf# python3 ok -q ProfessorCard.effect --local
=====================================================================
Assignment: Lab 7
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.
```
## ants
```sh
PS C:\Users\vanad\Desktop\UCB_CS_61A\ants\ants\ants> python3 ok -q 01 --local
=====================================================================
Assignment: Project 3: Ants Vs. SomeBees
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    5 test cases passed! No cases failed.

PS C:\Users\vanad\Desktop\UCB_CS_61A\ants\ants\ants> python3 ok -q 02 --local
=====================================================================
Assignment: Project 3: Ants Vs. SomeBees
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    5 test cases passed! No cases failed.

PS C:\Users\vanad\Desktop\UCB_CS_61A\ants\ants\ants> python3 ok -q 03 --local
=====================================================================
Assignment: Project 3: Ants Vs. SomeBees
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    11 test cases passed! No cases failed.

PS C:\Users\vanad\Desktop\UCB_CS_61A\ants\ants\ants> python3 ok -q 04 --local
=====================================================================
Assignment: Project 3: Ants Vs. SomeBees
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    25 test cases passed! No cases failed.

PS C:\Users\vanad\Desktop\UCB_CS_61A\ants\ants\ants> python3 ok -q 05 --local
=====================================================================
Assignment: Project 3: Ants Vs. SomeBees
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    16 test cases passed! No cases failed.

PS C:\Users\vanad\Desktop\UCB_CS_61A\ants\ants\ants> python3 ok -q 06 --local
=====================================================================
Assignment: Project 3: Ants Vs. SomeBees
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    14 test cases passed! No cases failed.

PS C:\Users\vanad\Desktop\UCB_CS_61A\ants\ants\ants> python3 ok -q 07 --local
=====================================================================
Assignment: Project 3: Ants Vs. SomeBees
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    8 test cases passed! No cases failed.

PS C:\Users\vanad\Desktop\UCB_CS_61A\ants\ants\ants> python3 ok -q 08 --local
=====================================================================
Assignment: Project 3: Ants Vs. SomeBees
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    8 test cases passed! No cases failed.

PS C:\Users\vanad\Desktop\UCB_CS_61A\ants\ants\ants> python3 ok -q 09 --local
=====================================================================
Assignment: Project 3: Ants Vs. SomeBees
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    9 test cases passed! No cases failed.

PS C:\Users\vanad\Desktop\UCB_CS_61A\ants\ants\ants> python3 ok -q EC --local
=====================================================================
Assignment: Project 3: Ants Vs. SomeBees
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    18 test cases passed! No cases failed.

PS C:\Users\vanad\Desktop\UCB_CS_61A\ants\ants\ants> python3 ok -q optional1 --local
=====================================================================
Assignment: Project 3: Ants Vs. SomeBees
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    15 test cases passed! No cases failed.

PS C:\Users\vanad\Desktop\UCB_CS_61A\ants\ants\ants> python3 ok -q optional2 --local
=====================================================================
Assignment: Project 3: Ants Vs. SomeBees
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    18 test cases passed! No cases failed.

PS C:\Users\vanad\Desktop\UCB_CS_61A\ants\ants\ants> python3 ok -q optional3 --local
=====================================================================
Assignment: Project 3: Ants Vs. SomeBees
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    13 test cases passed! No cases failed.

PS C:\Users\vanad\Desktop\UCB_CS_61A\ants\ants\ants> python3 ok -q optional4 --local
=====================================================================
Assignment: Project 3: Ants Vs. SomeBees
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    10 test cases passed! No cases failed.

PS C:\Users\vanad\Desktop\UCB_CS_61A\ants\ants\ants> python3 ok -q optional5 --local
=====================================================================
Assignment: Project 3: Ants Vs. SomeBees
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    2 test cases passed! No cases failed.

Point breakdown
    Problem 0: 0.0/0
    Problem 1: 1.0/1
    Problem 2: 3.0/3
    Problem 3: 3.0/3
    Problem 4: 3.0/3
    Problem 5: 3.0/3
    Problem 6: 3.0/3
    Problem 7: 2.0/2
    Problem 8: 2.0/2
    Problem 9: 2.0/2
    Problem EC: 2.0/2

Score:
    Total: 24.0
```


