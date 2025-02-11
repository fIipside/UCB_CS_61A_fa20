# Mutable Functions
## Mutable Functions
### A Function with Behavior That Varies Over Time
![ 2024-08-27 205247.png](https://s2.loli.net/2024/08/27/fHnXp8Fdtcy5EbW.png)
### Persistent Local State Using Environments
![ 2024-08-27 205521.png](https://s2.loli.net/2024/08/27/KeENRvOSzMr49jJ.png)
### Reminder: Local Assignment
![ 2024-08-27 205714.png](https://s2.loli.net/2024/08/27/OkBondUJ1ilQKcD.png)
### Non-Local Assignment & Persistent Local State
![ 2024-08-27 205936.png](https://s2.loli.net/2024/08/27/84FVXdJkpoGOqD7.png)
## Non-Local Assignment
### The Effect of Nonlocal Statements
![ 2024-08-27 213211.png](https://s2.loli.net/2024/08/27/9HNVJQnrGoL7d4i.png)
### The Many Meanings of Assignment Statements
![ 2024-08-27 213456.png](https://s2.loli.net/2024/08/27/l4q9IdZUBTYO8Ev.png)
### Python Particulars
![ 2024-08-27 213650.png](https://s2.loli.net/2024/08/27/6mFTi4vIsBSGhPq.png)
### Mutable Values & Persistent Local State
![ 2024-08-27 214000.png](https://s2.loli.net/2024/08/27/7HkKyExTwudpNIv.png)
## Multiple Mutable Functions
```py
# demo
>>> steven = make_withdraw(100000)
>>> john = make_withdraw(100)
>>> john is not steven
True
>>> john == steven
False
>>> john(10)
90
>>> john(10)
80
>>> steven(1000)
99000
>>> john(10)
70
>>> steven(1000)
98000
>>> john(1000)
'Insufficient fund'
```
### Referential Transparency, Lost
```py
# demo
def f(x):
    x = 4
    def g(y):
        def h(z):
            nonlocal x
            x = x + 1
            return x + y + z
        return h
    return g
a = f(1)
b = a(2)
b(3) + b(4)
```
![ 2024-08-27 214811.png](https://s2.loli.net/2024/08/27/ZcfU9vAlVqRu1YD.png)
```py
def combo(a, b):
    """Return the smallest integer with all of the degits of a and b (in order).

    >>> combo(531, 432)    # 45312 contains both _531_ and 4_3_2.
    45312
    >>> combo(531, 4321)   # 45312 contains both _53_1 and 4_321.
    45321
    >>> combo(1234, 9123)  # 91234 contains both _1234 and 9123_.
    45321
    >>> combo(0, 321)      # The number 0 has no digits, so 0 is not in the result.
    321
    """
    if a == 0 or b == 0:
        return b + a
    elif a % 10 < b % 10:
        return combo(a // 10, b) * 10 + a % 10
    return combo(a, b // 10) * 10 + b % 10
```
## lab 06
```py
>>> lst
[9, 5, 6, 7, 8, 6]
>>> x = lst.pop(2)
>>> lst
[9, 5, 7, 8, 6]
>>> lst.remove(x)
>>> lst
[9, 5, 7, 8]
>>> a, b = lst, lst[:]
>>> a is lst
True
>>> b == lst
True
>>> b is lst
False
```
```sh
MI-wsf# python3 ok -q make_adder_inc --local
=====================================================================
Assignment: Lab 6
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

MI-wsf# python3 ok -q make_fib --local
=====================================================================
Assignment: Lab 6
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

MI-wsf# python3 ok -q insert_items --local
=====================================================================
Assignment: Lab 6
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.
```
