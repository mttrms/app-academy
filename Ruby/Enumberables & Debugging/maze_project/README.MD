Maze solver
===========

In this exercise, we want to write a program that will find a route between two points in a maze.

Here's an example [maze](http://assets.aaonline.io/fullstack/ruby/projects/maze_solver/maze1.txt). It has an 'S' for the start point, and an 'E' for an end point.

You should write a program that will read in the maze, try to explore a path through it to the end, and then print out a completed path [like so](http://assets.aaonline.io/fullstack/ruby/projects/maze_solver/maze1_solution.txt). If there is no such path, it should inform the user.

Make your program run as a command line script, taking in the name of a maze file on the command line.

Your path through the maze should not be self-intersecting, of course.

When you have found a first solution, write a version which will be sure to find the *shortest path* through the maze.