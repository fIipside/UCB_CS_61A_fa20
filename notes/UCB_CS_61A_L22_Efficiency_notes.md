# Efficiency
## Measuring Efficiency
### Recursive Computation of the Fibonacci Sequence
![image.png](https://s2.loli.net/2025/01/14/c4oN9RfdpeIKW1U.png)
```py
# demo
def fib(n):
    if n == 0 or n == 1:
        return n
    else:
        return fib(n-2) + fib(n-1)

def count(f):
    def counted(n):
        counted.call_count += 1
        return f(n)
    counted.call_count = 0
    return counted

>>> fib = count(fib)
>>> fib(5)
5
>>> fib.call_count
15
>>> fib(5)
5
>>> fib.call_count
30
>>> fib(30)
832040
>>> fib.call_count
2692567
```
## Memoization
### Memoization
- **Idea**: Remember the results that have been computed before
![image.png](https://s2.loli.net/2025/01/14/rYCyIBAWs8xPc5l.png)
```py
# demo
def memo(f):
    cache = {}
    def memoized(n):
        if n not in cache:
            cache[n] = f(n)
        return cache[n]
    return memoized

>>> fib = memo(fib)
>>> fib(30)
832040
>>> fib(50)
12586269025
>>> fib(300)
222232244629420445529739893461909967206666939096499764990979600

>>> fib(30)
832040
>>> fib = count(fib)
>>> counted_fib = fib
>>> fib = memo(fib)
>>> fib = count(fib)
>>> fib(30)
832040
>>> fib.call_count
59
>>> counted_fib.call_count
31
```
### Memoized Tree Recursion
![image.png](https://s2.loli.net/2025/01/14/bvNmWUKFylp6LQf.png)
## Exponentiation
### Exponentiation
![image.png](https://s2.loli.net/2025/01/14/mKUVPxs6cG73LXN.png)
![image.png](https://s2.loli.net/2025/01/14/NckegC4ioGKfDtB.png)
## Orders of Growth
### Quadratic Time
![image.png](https://s2.loli.net/2025/01/14/W3LdYGkVbZeOpTj.png)
### Exponential Time
![image.png](https://s2.loli.net/2025/01/14/PhoUtDCjNSyIpX5.png)
### Common Orders of Growth
![image.png](https://s2.loli.net/2025/01/14/x4UjB2CfXFsAoTh.png)
## Order of Growth Notation
### Big Theta and Big O Notation for Orders of Growth
![image.png](https://s2.loli.net/2025/01/14/7IkG1VJsgDwWOSy.png)
## Space
### Space and Environments
- Which environment frames do we need to keep during evaluation? 
    - At any moment there is a set of active environments 
    - Values and frames in active environments consume memory 
    - Memory that is used for other values and frames can be recycled
- **Active environments**:  
    - Environments for any function calls currently being evaluated 
    - Parent environments of functions named in active environments
```python
# demo
def count_frames(f):
    def counted(n):
        counted.open_count += 1
        counted.max_count = max(counted.max_count, counted.open_count)
        result = f(n)
        counted.open_count -= 1
        return result
    counted.open_count = 0
    counted.max_count = 0
    return counted

>>> fib = count_frames(fib)
>>> fib(20)
6765
>>> fib.open_count
0
>>> fib.max_count
20
```
### Fibonacci Space Consumption
![image.png](https://s2.loli.net/2025/01/14/1MLyVzNnse52Zuf.png)
## Not covered
### Expressions
- *prototypical*: relating to a particular type of person or thing that is seen as very typical. 
## lab 08
```sh
---------------------------------------------------------------------
OK! All cases for Link unlocked.

Cannot backup when running ok with --local.

PS C:\Users\vanad\Desktop\UCB_CS_61A\lab08\lab08_sol> python3 ok -q convert_link --local
=====================================================================
Assignment: Lab 8
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

PS C:\Users\vanad\Desktop\UCB_CS_61A\lab08\lab08_sol> python3 ok -q every_other --local
=====================================================================
Assignment: Lab 8
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

PS C:\Users\vanad\Desktop\UCB_CS_61A\lab08\lab08_sol> python3 ok -q cumulative_mul --local
=====================================================================
Assignment: Lab 8
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

PS C:\Users\vanad\Desktop\UCB_CS_61A\lab08\lab08_sol> python3 ok -q has_cycle --local
=====================================================================
Assignment: Lab 8
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

PS C:\Users\vanad\Desktop\UCB_CS_61A\lab08\lab08_sol> python3 ok -q has_cycle_constant --local
=====================================================================
Assignment: Lab 8
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

PS C:\Users\vanad\Desktop\UCB_CS_61A\lab08\lab08_sol> python3 ok -q reverse_other --local
=====================================================================
Assignment: Lab 8
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.
```
