Memory Puzzle
=============

Today we're going to implement a simple command-line version of the classic [Match 2 memory card game](http://mypuzzle.org/find-the-pair).

Here is a glimpse of what the final product will look like when you are done:

![memory-gif](https://assets.aaonline.io/fullstack/ruby/projects/memory/memory.gif)

Learning Goals
--------------

-   Understand how classes interact in an object-oriented program
-   Be able to use `require_relative`
-   Be able to write the methods `[]` and `[]=` and explain how they work
-   Develop a workflow that uses pry to test small parts of your code
-   Know how to initialize an Array with a default value
-   Know how to use duck typing to allow different classes to interact with your program

Write classes for Card, Board, and Game. Please put each class in its own file and use `require_relative` to include other files in your program.

Card
----

A Card has two useful bits of information: its face value, and whether it is face-up or face-down. You'll want instance variables to keep track of this information. You'll also want a method to display information about the card: nothing when face-down, or its value when face-up. I also wrote `#hide`, `#reveal`, `#to_s`, and `#==` methods.

Common problem: Having issues with `#hide` and `#reveal`? Try [testing small](https://open.appacademy.io/learn/full-stack-online/ruby/testing-small--from-memory-puzzle-). Accessing this on GitHub? Use [this link](https://github.com/appacademy/curriculum/blob/master/ruby/readings/testing-small.md).

Board
-----

The Board is responsible for keeping track of all your Cards. You'll want a grid instance variable to contain Cards. Useful methods:

-   `#populate` should fill the board with a set of shuffled Card pairs
-   `#render` should print out a representation of the Board's current state
-   `#won?` should return true if all cards have been revealed.
-   `#reveal` should reveal a Card at `guessed_pos` (unless it's already face-up, in which case the method should do nothing). It should also return the value of the card it revealed (you'll see why later).

#### Parallel Assignment

In Ruby you can declare and assign multiple variables at once using commas to separate multiple variables and values. For example,

```
x, y, z = 1, 2, 3 # x = 1, y = 2, z = 3
```

And if there's not the same number of variables and values?

```
x, y = 1, 2, 3 # x = 1, y = 2, 3 is not assigned
a, b, c = 10, 20 # a = 10, b = 20, c = nil
```

When there are multiple variables assigned to an array, Ruby expands the array so that each element becomes its own value! For example,

```
x, y, z = [1, 2, 3] # x = 1, y = 2, z = 3
a, b, c = [10, 20] # a = 10, b = 20, c = nil
```

This is very helpful to use when writing `[](pos)` and `[]=(pos, value)` for your Board to access `row` and `col`. Because the `pos` exists as an array, it's better to pass it as an array in a method call, relying on the method to index the array.

Game
----

The Game should have instance variable for the Board and the previously-guessed position (if any). It should also have methods for managing the Board-Player interaction. You may want a `play` loop that runs until the game is `over`. Inside the loop, you should `render` the board, `prompt` the player for input, and get a guessed `pos`. Pass this `pos` to a `make_guess` method, where you will handle the actual memory/matching logic. Some tips on implementing this:

-   If we're not already checking another Card, leave the card at `guessed_pos`face-up and update the `previous_guess` variable.
-   If we **are** checking another card, we should compare the Card at`guessed_pos` with the one at `previous_guess`.
    -   If the cards match, we should leave them both face-up.
    -   Else, flip both cards face-down.
    -   In either case, reset `previous_guess`.

It wouldn't be an interesting game if the player could see their previous moves. Run `system("clear")` before `render`ing the Board. This will hide any previous output from the player. `sleep(n)` will pause the program for `n`seconds. Use this method to (temporarily) show the player an incorrect guess before flipping the Cards face-down again.

AI
--

#### Refactor game to include a HumanPlayer class

Before actually implementing the computer player, let's make things easier on ourselves and refactor the game to accept player classes. In order to accomplish this, move all of your user input logic into the player class. I moved the following methods out of the Game class into the player:

-   `prompt`
-   `get_input`

Before moving on, make sure your game runs successfully with a `HumanPlayer`.

#### Create a ComputerPlayer class

The computer player's strategy should be as follows:

-   On its first guess, if it knows where 2 matching cards are, guess one of them, otherwise guess randomly among cards it has not yet seen.
-   On its second guess, if its first guess revealed a card whose value matches a known location, guess that location, otherwise guess randomly among cards it has not yet seen.

Now comes the tricky part. With the HumanPlayer, we didn't need to explicitly receive the data from the card we're flipping over; we just read it off the terminal output. The computer won't be quite so savvy. Let's write some methods to have it accept the revealed card information from the game:

-   `receive_revealed_card` should take in a position and the value of the card revealed at that location. It should then store it in a `@known_cards`hash.
-   `receive_match` should take in two positions which are a successful match. I stored these in an instance variable `@matched_cards`

The game should then call these methods on the player in addition to displaying the revealed cards to the terminal.

**NB:** The game shouldn't have to know whether a human or computer is playing. Instead, it should use [duck typing](http://rubylearning.com/satishtalim/duck_typing.html). This may involve writing some "dummy" methods on the `HumanPlayer` class. That's ok.