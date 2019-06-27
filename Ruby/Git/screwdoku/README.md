Screwedoku
==========

Overview
--------

At the surface, this project is about learning and recognizing common ruby errors.

Almost all of these errors are bugs that students hit in their projects (and that engineers hit in the real world).

But this project is really about training you to think and debug like an engineer. The faster you narrow down bugs:

1.  The faster you learn.
2.  The more time you save each time you debug something new.
3.  The more you can solve problems on your own.

Learning Goals
--------------

-   Be able to read a stack trace and work backwards toward the source of your error
-   Be able to use a debugger effectively
-   Be comfortable using `git branch`, `git checkout`, and `git commit`
-   Know how to `git push` to your own Github repo

Don'ts
------

**Do NOT look up code on the master branch during the project. Looking up the answer is cheating and defies the purpose of the project.**

**Do NOT give other students the solution when they ask you. Only offer them new approaches that they can take.**

Tips
----

Make a list of strategies you've been using to debug as you go along.

If you want to print something out, use the debugger instead. Stop the code and poke around. Don't use `puts` statements if you can avoid it.

If you get stuck and need ideas, reference our [debugging cheatsheet](https://open.appacademy.io/learn/full-stack-online/ruby/debugging-cheatsheet). Accessing this on GitHub? Use [this link](https://github.com/appacademy/curriculum/blob/master/ruby/readings/debugging_cheatsheet.md).

Instructions
------------

### Before Getting Started

-   Create a directory on the aA machine desktop named `W1D4`.
-   Move your HTML files from this morning into this new directory.
-   Follow the [git-workflow](https://open.appacademy.io/learn/full-stack-online/ruby/git-workflow) to set up your repo, commit, change authorship, and push your files! Accessing this on GitHub? Use [this link](https://github.com/appacademy/curriculum/blob/master/ruby/readings/git-workflow.md).

### Setup

-   Download the [zip](http://assets.aaonline.io/fullstack/ruby/projects/screwdoku/screwedoku.zip) file.
    -   NOTE: We will not be including this project in our `W1D4` repo because it a big project with a lot of commits from some previous a/A celebrities. Save the skeleton to a different location than inside the `W1D4` directory we created.
-   Run `bundle install`.
-   Start on the `master` branch, which has a working version of the game.

### Gameplay

Fix all the levels.

-   List all the levels by running `git branch`.
-   Run `ruby sudoku.rb` on the master branch and fill a few spots to get a feel for how the game works with correct code.

Starting with `level-1`, for each level:

-   Check out that level's code (e.g., run `git checkout level-1`, `git checkout level-2`, etc.).
-   Run `ruby sudoku.rb` and try to fill a few spots. You can catch every bug within two turns.
-   Your game will break somehow.
-   Figure out how to fix it using the strategies you've learned. You are allowed to write extra code and new methods if necessary. You are allowed to use the scientific method. Your approaches are allowed to be creative.
-   If you run out of approaches and are dumbfounded for more than 5 minutes, ask students near you for approaches to try.
-   Run `ruby sudoku.rb` and make sure the game plays like the master version. If the game works after two turns, you're done!
-   Add and commit your change once the code works. **Don't push**. Reference [git-workflow](https://open.appacademy.io/learn/full-stack-online/ruby/git-workflow) if you need to (especially the "Working" section). Accessing this on GitHub? Use [this link](https://github.com/appacademy/curriculum/blob/master/ruby/readings/git-workflow.md).
-   Before checking out the next branch, close all of your file tabs in VS Code. VS Code caches open files when switching branches. If you don't close them, you may be viewing/editing a file that doesn't exist on the branch you just checked-out.

Check out the `final-level` and `super-evil-level` at the end.

### Bonus

If you'd like, change the git `origin` to point at a Github repo you create and push your completed project there. ***Hint:*** You'll want to push **all** of your branches. Maybe [Google](https://www.google.com/) can help you find out how...

Make up three new levels (each on different branches) with three new tricky errors. Get another group that has finished to try them.