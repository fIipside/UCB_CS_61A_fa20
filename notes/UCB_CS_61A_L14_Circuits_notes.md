# Circuits
## Circuits
A _circuit_ is a collection of logical gates that transforms a set of binary inputs into a set of binary output. 
![ 2024-08-24 205153.png](https://s2.loli.net/2024/08/25/tL8NQPYep9Si3qM.png)
$c = a + b, d = ((a + b) \cdot b')'$
### Designing circuits
step 1. build truth-table for all possible input/output values. 
![ 2024-08-24 211319.png](https://s2.loli.net/2024/08/25/xnSehmMT9j8p3oR.png)
step 2. build sub-expressions with _and/not_ for each output column. 
$c = a' \cdot b, c = a \cdot b', d = a \cdot b$
![ 2024-08-25 004335.png](https://s2.loli.net/2024/08/25/eXuVUp2md9C4t7F.png)
step 3. combine, two at a time, sub-expressions with an _or_. 
$c = a' \cdot b + a \cdot b', d = a \cdot b$
step 4. draw ciruit diagram. 
![ 2024-08-24 212126.png](https://s2.loli.net/2024/08/25/eVsgnjWowhXGSO4.png)
### 1-Bit Compare for Equality (CE)
```py
if two bits a, b are equal then
    return 1
else
    return 0
```
![ 2024-08-25 004335.png](https://s2.loli.net/2024/08/25/eXuVUp2md9C4t7F.png)
![ 2024-08-25 004524.png](https://s2.loli.net/2024/08/25/DUHwl625IYej7fq.png)
### 4-Bit Compare for Eqaulity (CE)
```py
if two 4-bit numbers are equal then
    return 1
else
    return 0
```
$a_3a_2a_1a_0 == b_3b_2b_1b_0$
two 4-bit numbers are equal if:
&#8195;&#8195;$a_3 == b_3$ and
&#8195;&#8195;$a_2 == b_2$ and
&#8195;&#8195;$a_1 == b_1$ and
&#8195;&#8195;$a_0 == b_0$
![ 2024-08-25 005617.png](https://s2.loli.net/2024/08/25/HcDuT7UgnjCFpG2.png)
### 1-Bit Adder
0 + 0 = 0
0 + 1 = 1
1 + 0 = 1
1 + 1 = 10 need to carry
input: two digits _a_, _b_ and a carry _c_
output: sum _d_ and carry _e_
![ 2024-08-25 011432.png](https://s2.loli.net/2024/08/25/PxWVogrlUqevJdL.png)
![ 2024-08-25 012011.png](https://s2.loli.net/2024/08/25/eEGH7AFQ8sw4Lat.png)
![ 2024-08-25 012218.png](https://s2.loli.net/2024/08/25/ptrZA5z76KTlU9F.png)
### 4-Bit Adder
![ 2024-08-25 102117.png](https://s2.loli.net/2024/08/25/vnLGkZ2toD3Y4jQ.png)
![ 2024-08-25 102911.png](https://s2.loli.net/2024/08/25/KyoJ73wdmt68VqR.png)
![ 2024-08-25 103057.png](https://s2.loli.net/2024/08/25/MeQkmY3sVJuZwU8.png)
## Equals 0
- build a circuit that determines if an 8-bit number is 0. 

$a_7a_6a_5a_4a_3a_2a_1a_0 == 00000000$
$i = a' \cdot b' \cdot c' \cdot d' \cdot e' \cdot f' \cdot g' \cdot h'$
![ 2024-08-25 104015.png](https://s2.loli.net/2024/08/25/WZfMR3uSIjUgmBD.png)
### Optimization (Karnaugh maps)
![ 2024-08-25 104616.png](https://s2.loli.net/2024/08/25/iVGtI2do3BaTKWF.png)
![ 2024-08-25 105526.png](https://s2.loli.net/2024/08/25/H4Rotl3FnT6IBEC.png)
## Q&A
```py
>>> list(zip([1, 2, 3], [7, 8, 9]))
[(1, 7), (2, 8), (3, 9)]
>>> list(zip([1, 2, 3], [7, 8,]))
[(1, 7), (2, 8)]

# use zip

def add_tree(t1, t2):
    result_label = label(t1) + label(t2)
    result_branches = [add_trees(b1, b2) for b1, b2 in zip(branches(t1), branches(t2))]
    i = len(result_branches)
    result_branches += branches(t1)[i:]
    result_branches += branches(t1)[i:]
    return tree(result_label, result_branches)

# use recursion

def add_tree(t1, t2):
    "bs1 and bs2 are the remaining branches"
    def build_result_branches(bs1, bs2):
        if not bs1:
            return bs2
        if not bs2:
            return bs1
        f = add_trees(bs1[0], bs2[0])
        return [f] + build_result_branches(bs1[1:], bs2[1:])
    
    result_label = label(t1) + label(t2)
    result_branches = build_result_branches(branches(t1), branches(t2))
    return tree(result_label, result_branches)
```
## lab 05
__Note__: There's something wrong with the Internet connection. I change the url but it still fails. 
## Not covered
### Expressions
*crank*: a device that creates movement between parts of a machine or that changes backward and forward movement into circular movement. 