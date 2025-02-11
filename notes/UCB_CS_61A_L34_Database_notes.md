# Database
## Create Table and Drop Table
### Create Table
![image.png](https://s2.loli.net/2025/02/06/i1MuJgAb7DPZj2R.png)
### Drop Table
![image.png](https://s2.loli.net/2025/02/06/VCedsTXLr4MEIxD.png)
## Modifying Tables
### Insert
![image.png](https://s2.loli.net/2025/02/06/oxVL6WNHsQbfJTc.png)
![image.png](https://s2.loli.net/2025/02/06/cHb6FeEKGxa7Rml.png)
### Update
![image.png](https://s2.loli.net/2025/02/06/VKGfTOhod9LDZkE.png)
![image.png](https://s2.loli.net/2025/02/06/vMVZ2RceikzHSsx.png)
### Delete
![image.png](https://s2.loli.net/2025/02/06/BxMU7E8oyKGem1w.png)
![image.png](https://s2.loli.net/2025/02/06/lIQaFhEoBb43sPd.png)
## Python and SQL
![image.png](https://s2.loli.net/2025/02/06/QE8IZUdK9k7oaMH.png)
## SQL Injection Attack
### A Program Vulnerable to a SQL Injection Attack
![image.png](https://s2.loli.net/2025/02/06/41tsl3xebDHhrCv.png)
## Database Connections
### Casino Blackjack
![image.png](https://s2.loli.net/2025/02/06/EiWC267eDKVBwhF.png)
```py
# demo

import random
import readline
import sqlite3

points = {'A': 1, 'J': 10, 'Q': 10, 'K':10}
points.update({n: n for n in range(2, 11)})

def hand_score(hand):
    """Total score for a hand."""
    total = sum([points[card] for card in hand])
    if total <= 11 and 'A' in hand:
        return total + 10
    return total

db = sqlite3.Connection('cards.db')
sql = db.execute
sql('DROP TABLE IF EXISTS cards')
sql('CREATE TABLE cards(card, place);')

def play(card, place):
    """Play a card so that the player can see it."""
    sql('INSERT INTO cards VALUES (?, ?)', (card, place))
    db.commit()

def score(who):
    """Compute the hand score for the player or dealer."""
    cards = sql('SELECT * from cards where place = ?;', [who])
    return hand_score([card for card, place in cards.fetchall()])

def bust(who):
    """Check if the player or dealer went bust."""
    return score(who) > 21

player, dealer = "Player", "Dealer"

def play_hand(deck):
    """Play a hand of Blackjack."""
    play(deck.pop(), player)
    play(deck.pop(), dealer)
    play(deck.pop(), player)
    hidden = deck.pop()

    while 'y' in input("Hit? ").lower():
        play(deck.pop(), player)
        if bust(player):
            print(player, "went bust!")
            return

    play(hidden, dealer)

    while score(dealer) < 17:
        play(deck.pop(), dealer)
        if bust(dealer):
            print(dealer, "went bust!")
            return

    print(player, score(player), "and", dealer, score(dealer))

deck = list(points.keys()) * 4
random.shuffle(deck)
while len(deck) > 10:
    print('\nDealing...')
    play_hand(deck)
    sql('UPDATE cards SET place="Discard";')

```
![image.png](https://s2.loli.net/2025/02/06/5pTWKDAiFked9oZ.png)
![image.png](https://s2.loli.net/2025/02/06/agpnktDJq9Trcid.png)
## hw 09
```sh
PS E:\UCB_CS_61A\hw09\hw09_sol> python3 ok -q size_of_dogs --local
=====================================================================
Assignment: Homework 9
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

PS E:\UCB_CS_61A\hw09\hw09_sol> python3 ok -q by_parent_height --local
=====================================================================
Assignment: Homework 9
OK, version v1.18.1
=====================================================================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Running tests

---------------------------------------------------------------------
Test summary
    1 test cases passed! No cases failed.

PS E:\UCB_CS_61A\hw09\hw09_sol> python3 ok -q sentences --local
=====================================================================
Assignment: Homework 9
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
- *protocol*:
- *semantic*:
- *delimit*:
- *latency*:
- *interchangeable*:
- *scaffolding*:
- *supernodes*:
- *poodle*: