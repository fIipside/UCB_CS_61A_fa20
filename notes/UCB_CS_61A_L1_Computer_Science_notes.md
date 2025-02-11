# Computer Science
## About the course
### What is Computer Science
The study of *What problems can be solved using computation*, and *How to solve those problems*, and *What techniques lead to effective solutions*. 
### What is This Course about
- A course about managing complexity: Managing abstarction, Programming paradigms. 
- An introduction to programing: Full understanding of Python fundamentals, Combining multiple ideas in large projects, How computers interpret programming languages. 
- Different types of languages: Scheme & SQL. 

**A challenging course will demand a lot of you.** 
## Fuctions, Values, Objects, Interpreters, and Data
```py
>>> {w for w in words if len(w) == 6 and w[::-1] in words}
{'redder', 'drawer', 'reward', 'diaper', 'repaid'}
```
## Not covered
### Errors

> The fundamental equation of computers is:
$computer = powerful + stupid$
Computers are very powerful, looking at volumes of data very quickly. Computers can perform billions of operations per second, where each operation is pretty simple.
Computers are also shockingly stupid and fragile. The operations that they can do are extremely rigid, simple, and mechanical. The computer lacks anything like real insight ... it's nothing like the HAL 9000 from the movies. If nothing else, you should not be intimidated by the computer as if it's some sort of brain. It's very mechanical underneath it all.
Programming is about a person using their real insight to build something useful, constructed out of these teeny, simple little operations that the computer can do.
&#160; &#160; &#160; —Francisco Cai and Nick Parlante, Stanford CS101
### Expressions
*facility*: an ability to do something easily or well. 
*sneak review*: an opportunity to see (a part of) something new before the rest of the public see it. 
*encapsulate*: to express or show the most important facts about something. 
*tuck away*: to put something in a private, safe place. 
*to the letter*: If you obey instructions or rules to the letter, you do exactly what you have been told to do, giving great attention to every detail. 
*intimidate*: to frighten or threaten someone, usually in order to persuade them to do something that you want them to do.
*shortcut*: a route that leads from one place to another and is quicker and more direct than the usual route. 
*outgun*: to win a war or fight by having more weapons than the other side. 
*maintain the spirit of*, *borrow heavily from*

## lab 00
- The lines in the triple-quotes `"""` are called a **docstring**, which is a description of what the function is supposed to do. When writing code in 61A, you should always read the docstring!
- The lines that begin with `>>>` are called **doctests**. Recall that when using the Python interpreter, you write Python expressions next to `>>>` and the output is printed below that line. Doctests explain what the function does by showing actual Python code. It answers the question: "If we input this Python code, what should the expected output be?"
- Numbers may be combined with mathematical operators to form compound expressions. In addition to `+` operator (addition), the `-` operator (subtraction), the `*` operator (multiplication) and the `**` operator (exponentiation), there are three division-like operators to remember:
    - Floating point division (`/`): divides the first number number by the second, evaluating to a number with a decimal point even if the numbers divide evenly.
    - Floor division (`//`): divides the first number by the second and then rounds down, evaluating to an integer.
    - Modulo (`%`): evaluates to the positive remainder left over from division.
```sh
=====================================================================
Assignment: Lab 0
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    3 test cases passed! No cases failed.

Cannot backup when running ok with --local.
```
**I may download the version in 2021, but it is not big deal.**