# Recursion
## Recursive Functions
### Recursive Functions
- __Definition__: A function is called recursive if the body of that function calls itself, either directly or indirectly 
- __Implication__: Executing the body of a recursive function may require applying that function
### Digit Sums
![ 2024-08-19 121549.png](https://s2.loli.net/2024/08/19/T8fIa9xyAVCNOXt.png)
```py
# demo
 def split(n): 
    """Split positive n into all but its last digit and its last digit.""" 
    return n // 10, n % 10 

def sum_digits(n): 
    """Return the sum of the digits of positive integer n.""" 
    if n < 10: 
        return n 
    else: 
        all_but_last, last = split(n) 
        return sum_digits(all_but_last) + last
```
### The Anatomy of a Recursive Function
![ 2024-08-19 122241.png](https://s2.loli.net/2024/08/19/Tu7nmo6A4yY5w2l.png)
## Recursion in Environment Diagrams
### Recursion in Environment Diagrams
![ 2024-08-19 122800.png](https://s2.loli.net/2024/08/19/kliIAoNtu13KLa8.png)
- Credit cards actually use the Luhn algorithm, which we'll implement after sum_digits
### Iteration vs Recursion
![ 2024-08-19 123143.png](https://s2.loli.net/2024/08/19/bPQKB5MCLG3zsym.png)
## Verifying Recursive Functions
### The Recursive Leap of Faith
![ 2024-08-19 134158.png](https://s2.loli.net/2024/08/19/5XsWgkI62Gzo4Tq.png)
## Mutual Recursion
### The Luhn Algorithm
-  Used to verify credit card numbers 
- From Wikipedia: http://en.wikipedia.org/wiki/Luhn_algorithm

![ 2024-08-19 135932.png](https://s2.loli.net/2024/08/19/tl1cjOUbmzMuJAZ.png)
- The Luhn sum of a valid credit card number is a multiple of 10
```py
# demo
def luhn_sum(n):
    if n < 10:
        return n
    else:
        all_but_last, last = split(n)
        return luhn_sum_double(all_but_last) + last

def luhn_sum_double(n):
    all_but_last, last = split(n)
    luhn_digit = sum_digits(2 * last)
    if n < 10:
        return luhn_digit
    else:
        return luhn_sum(all_but_last) + luhn_digit
```
## Recursion and Iteration
### Converting Recursion to Iteration
- __Can be tricky__: Iteration is a special case of recursion. 
- __Idea__: Figure out what state must be maintained by the iterative function.
```py
# demo
def sum_digits_iter(n): 
    digit_sum = 0 
    while n > 0: 
        n, last = split(n) 
        digit_sum = digit_sum + last 
    return digit_sum
```
- __More formulaic__: Iteration is a special case of recursion. 
- __Idea__: The state of an iteration can be passed as arguments.

![ 2024-08-19 141123.png](https://s2.loli.net/2024/08/19/K8ehlNsP3BunLtr.png)
## Not covered
### Expressions
*unwind*: If you unwind something that is wrapped around an object, you unfasten it, and if it unwinds, it becomes unfastened.
*nuisance*: something or someone that annoys you or causes trouble for you. 
*cascade*: to pass on information by giving it to just a few people, who then give it to more people; to be passed on in this way. 