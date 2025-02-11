# Decomposition
## Modular Design
### Separation of Concerns
- A design principle: Isolate different parts of a program that address different concerns 
- A modular component can be developed and tested independently
![image.png](https://s2.loli.net/2025/01/15/R93pxHjuefizcM1.png)
## Example: Restaurant Search
### Restaurant Search Data
![image.png](https://s2.loli.net/2025/01/15/rfDYb6SzuetcKVq.png)
![image.png](https://s2.loli.net/2025/01/15/eCfDvFBoHat4Q7A.png)
## Example: Similar Restaurants
### Discussion Question: Most Similar Restaurants
![image.png](https://s2.loli.net/2025/01/15/aByEup7DH5lwMkc.png)
## Example: Reading Files
```shell
# demo
PS C:\Users\vanad\Desktop\UCB_CS_61A\notes\23\yelp_example> python3 -i search.py
>>> results = search('Thai')
>>> for r in results:
...     print(r, 'is similar to', r.similar(3))
...
<Thai Basil Cuisine> is similar to [<Gypsy's Trattoria Italiano>, <Top Dog>, <Smart Alec's Intelligent Food>]
<Thai Noodle II> is similar to [<La Cascada Taqueria>, <Cafe Milano>, <Chinese Express>]
<Jasmine Thai> is similar to [<Hummingbird Cafe>, <La Burrita 2>, <The Stuffed Inn>]
<Berkeley Thai House> is similar to [<Smart Alec's Intelligent Food>, <Thai Basil Cuisine>, <Top Dog>]
<Viengvilay Thai Cuisine> is similar to [<La Val's Pizza>, <Thai Basil Cuisine>, <La Burrita 2>]
```
## Set Intersection
### Linear-Time Intersection of Sorted Lists
![image.png](https://s2.loli.net/2025/01/15/8IjHp6w7CNxSQze.png)
## Sets
### Sets
![image.png](https://s2.loli.net/2025/01/15/qbBF6dijnhr2ykx.png)
## Q&A
```py
>>> s = set([1, 2, 2, 3])
>>> s
{1, 2, 3}
```