# Binary Numbers
## Binary Numbers
$723 = 7 \times 100 + 2 \times 10 + 3 \times 1$
$723 = 7 \times 10^2 + 2 \times 10^1 + 3 \times 10^0$
### 2-bit binary number
00 &#8195; 0
01 &#8195; 1
10 &#8195; 2
11 &#8195; 3 &#8195; $max value = 2^2 - 1$
### 3-bit binary number
$max value = 2^3 - 1$
### Why 2-bit binary number
- Electrons are hard to keep at 10 distinct levels(like filling the water into the test tubes).

![ 2024-08-24 125815.png](https://s2.loli.net/2024/08/24/HMYxeaRjhbl5iWf.png)
- Distinguish only between two things are reliable.

![ 2024-08-24 130034.png](https://s2.loli.net/2024/08/24/gjEFlOxG58cM7CS.png) 
### How do we encode negative numbers?
0: '+' &#8195; 1: '-'
000 &#8195; 0
001 &#8195; 1
010 &#8195; 2
011 &#8195; 3
100 &#8195; -0 ???
101 &#8195; -1
110 &#8195; -2
111 &#8195; -3
### two's complement
1. start with an unsigned 4-bit binary number when left-most bit is 0
    - 0110 = 6
2. complement your binary number (flip bits)
    - 1001
3. add one to your binary number
    - 1010 = -6

![ 2024-08-24 131615.png](https://s2.loli.net/2024/08/24/uE7ZoFXnUJY5rwj.png)
### we lost a number?
![ 2024-08-24 131952.png](https://s2.loli.net/2024/08/24/oxABEd6kC5qVL1S.png)
### summing signed binary numbers
![ 2024-08-24 132258.png](https://s2.loli.net/2024/08/24/2dCBDzauj1rSXY3.png)
- It makes no sense at all!

![ 2024-08-24 132423.png](https://s2.loli.net/2024/08/24/MKzviT7e5OBCkZX.png)
### Decoding two's complement
![ 2024-08-24 133115.png](https://s2.loli.net/2024/08/24/9mS62Ru71TlF3Dx.png)
### How do we encode fractional numbers?
$\pm mantissa \times base^{\pm exponent} $
## Boolean Logic (truth tables)
![ 2024-08-24 133956.png](https://s2.loli.net/2024/08/24/D3fSKUMgjoOQsCV.png)
![ 2024-08-24 134200.png](https://s2.loli.net/2024/08/24/9WoE63ewdTjfvQH.png)
![ 2024-08-24 134212.png](https://s2.loli.net/2024/08/24/2zLuCF9MtvPVprj.png)
![ 2024-08-24 134308.png](https://s2.loli.net/2024/08/24/bT8l9kpROAW2XyN.png)
### Gates
![ 2024-08-24 175814.png](https://s2.loli.net/2024/08/25/Wc9qkoE5Qh2HSMG.png)
### Building Gates(transistors)
- AND gate

![ 2024-08-24 174950.png](https://s2.loli.net/2024/08/25/45BFOqyCZk1QfnU.png)
- OR gate

![ 2024-08-25 121010.png](https://s2.loli.net/2024/08/25/EDHc81bnRBSG4w5.png)
- NOT gate

![ 2024-08-24 175310.png](https://s2.loli.net/2024/08/25/AaYmpgKcbGw2xC9.png)
## Not covered
### Expressions
*compartmentalize*: to separate something into parts and not allow those parts to mix together. 
*bitty*: made up of a lot of different things that do not fit together well. 
*the nitty-gritty*: the basic facts of a situation. 
*backbone*: the line of bones down the centre of the back that provides support for the body. 
*lurk*: to wait or move in a secret way so that you cannot be seen, especially because you are about to attack someone or do something wrong. 