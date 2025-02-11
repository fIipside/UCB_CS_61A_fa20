# Tables
## Joining Tables
### Joining Two Tables
![image.png](https://s2.loli.net/2025/02/05/keWpmsJXyNR6zAU.png)
```sql
sql> CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
...>   SELECT "eisenhower"       , "fillmore";
sql> CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur UNION
  SELECT "barack"         , "short"       UNION
  SELECT "clinton"        , "long"        UNION
  SELECT "delano"         , "long"        UNION
  SELECT "eisenhower"     , "short"       UNION
  SELECT "fillmore"       , "curly"       UNION
  SELECT "grover"         , "short"       UNION
...>   SELECT "herbert"        , "curly";
sql> SELECT * FROM parents, dogs;
```
![image.png](https://s2.loli.net/2025/02/05/315b9FVuvzlecRw.png)
![image.png](https://s2.loli.net/2025/02/05/FzoR7r2sAfTH3CP.png)
## Aliases and Dot Expressions
### Joining a Table with Itself
![image.png](https://s2.loli.net/2025/02/05/pc81CRWNMgJoEZb.png)
### Joining Multiple Tables
![image.png](https://s2.loli.net/2025/02/05/qzvYApFyIG1CBeQ.png)
![image.png](https://s2.loli.net/2025/02/05/mEheKDvVkCMQu7s.png)
## Numerical Expressions
### Numerical Expressions
![image.png](https://s2.loli.net/2025/02/05/VfcSWUwqnpLgekx.png)
![image.png](https://s2.loli.net/2025/02/05/dD8NbkBRO4a3v91.png)
![image.png](https://s2.loli.net/2025/02/05/fALlw78xzFWI1nm.png)
## String Expressions
### String Expressions
![image.png](https://s2.loli.net/2025/02/05/HTolKxs1NiGCX2J.png)
![image.png](https://s2.loli.net/2025/02/05/CVRHd5A28lbuZp7.png)
## Q&A
- times of apply procedure
![image.png](https://s2.loli.net/2025/02/09/fhBaWrupjLtiPkn.png)
## lab 12
```sql
SELECT [columns] FROM [tables] WHERE [condition] ORDER BY [columns] LIMIT [limit];
-- LIMIT [limit] limits the number of rows in the output table by the integer [limit]
-- Note: We capitalize SQL keywords purely because of style convention. It makes queries much easier to read, though they will still work if you don't capitalize keywords.
```
```sh
PS E:\UCB_CS_61A\lab12\lab12_sol> python3 ok -q bluedog --local
=====================================================================
Assignment: Lab 12
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

PS E:\UCB_CS_61A\lab12\lab12_sol> python3 ok -q smallest-int --local
=====================================================================
Assignment: Lab 12
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

PS E:\UCB_CS_61A\lab12\lab12_sol> python3 ok -q matchmaker --local
=====================================================================
Assignment: Lab 12
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

PS E:\UCB_CS_61A\lab12\lab12_sol> python3 ok -q sevens --local
=====================================================================
Assignment: Lab 12
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.
```
## Not covered
### Expressions
- *genealogy*:
- *pedigree*:
- *lineage*:
- *hand-inspecting*:
- *elf*:
- *quarantine*：