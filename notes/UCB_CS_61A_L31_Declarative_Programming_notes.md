# Declarative Programming
## Declarative Languages
### Database Management Systems
![image.png](https://s2.loli.net/2025/02/04/RpYPXBNo1TuHm8k.png)
### Declarative Programming
![image.png](https://s2.loli.net/2025/02/04/TFLaKGp2Yihs4Iz.png)
## Structured Query Language (SQL)
### SQL Overview
![image.png](https://s2.loli.net/2025/02/04/5iZCWpxUflVHRDc.png)
### Getting Started with SQL
Install sqlite (version 3.8.3 or later): http://sqlite.org/download.html 
Use sqlite online: http://kripken.github.io/sql.js/GUI/
Use the SQL example from the textbook: http://composingprograms.com/examples/sql/sql.zip
### Selecting Value Literals
![image.png](https://s2.loli.net/2025/02/04/fJyoY2XtT6lzich.png)
### Naming Tables
![image.png](https://s2.loli.net/2025/02/04/wGPOBRDWhunUMpH.png)
## Projecting Tables
### Select Statements Project Existing Tables
![image.png](https://s2.loli.net/2025/02/04/3Bj2NYHgvVy84ik.png)
```sql
-- demo
sql> create table parents as
  select "abraham" as parent, "barack" as child union
  select "abraham"          , "clinton"         union
  select "delano"           , "herbert"         union
  select "fillmore"         , "abraham"         union
  select "fillmore"         , "delano"          union
  select "fillmore"         , "grover"          union
...>   select "eisenhower"       , "fillmore";
```
![image.png](https://s2.loli.net/2025/02/04/VvrAgMkcB9FjtNP.png)
## Arithmetic
### Arithmetic in Select Expressions
![image.png](https://s2.loli.net/2025/02/04/BIxDQz52aY1W37O.png)
### Discussion Question
![image.png](https://s2.loli.net/2025/02/04/uj8GXaYQczw7hgA.png)
```sql
-- demo
create table ints as
  select "zero" as word, 0 as one, 0 as two, 0 as four, 0 as eight union
  select "one"         , 1       , 0       , 0        , 0          union
  select "two"         , 0       , 2       , 0        , 0          union
  select "three"       , 1       , 2       , 0        , 0          union
  select "four"        , 0       , 0       , 4        , 0          union
  select "five"        , 1       , 0       , 4        , 0          union
  select "six"         , 0       , 2       , 4        , 0          union
  select "seven"       , 1       , 2       , 4        , 0          union
  select "eight"       , 0       , 0       , 0        , 8          union
  select "nine"        , 1       , 0       , 0        , 8;
```
![image.png](https://s2.loli.net/2025/02/04/VtHo843vQixAWhX.png)
## hw 08
```sh
---------------------------------------------------------------------
OK! All cases for quasiquote unlocked.

---------------------------------------------------------------------
OK! All cases for derive-sum unlocked.

PS E:\UCB_CS_61A\hw08\hw08_sol> python3 ok -q derive-sum --local
=====================================================================
Assignment: Homework 8
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    2 test cases passed! No cases failed.

---------------------------------------------------------------------
OK! All cases for derive-product unlocked.

PS E:\UCB_CS_61A\hw08\hw08_sol> python3 ok -q derive-product --local
=====================================================================
Assignment: Homework 8
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    2 test cases passed! No cases failed.

---------------------------------------------------------------------
OK! All cases for make-exp unlocked.

PS E:\UCB_CS_61A\hw08\hw08_sol> python3 ok -q make-exp --local
=====================================================================
Assignment: Homework 8
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

---------------------------------------------------------------------
OK! All cases for derive-exp unlocked.

PS E:\UCB_CS_61A\hw08\hw08_sol> python3 ok -q derive-exp --local
=====================================================================
Assignment: Homework 8
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    2 test cases passed! No cases failed.
```
## Not covered
### Expressions
- *ubiquitous*:
- *paradigm*:
- *proprietary*:
- *nautical*:
- *alias*:
- *an awful lot*: