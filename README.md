# Connect four

## Thoughts before dropping in

I think that this project will be one that proves to be extremely challenging,
testing is a thing that I don't really completely understand how it works
in its entirety just yet, but I guess that's kind of the point of the work
that I'm about to do. Anyway, let's get to it!

21 / April / 2020

## Thoughts after finishing project

This project took me a while to completely grasp the full extent of the
"algorithm" that I was supposed to use in order to make it work in a sufficiently 
satisfying manner, the first time around I held every column in a
variable of its own, but soon realized that column-to-column traversal
would be close to impossible; then I switched to a bi-dimensional array
and I was set to work, but that too gave me trouble in little to no time.
Which is when I transformed the cell class to be a little bit more like a
binary tree node in that it was connected to other cells the moment in
which a chip was dropped in the game board.

After I got the hang of writing tests and creating the code to get the 
desired results things turned out relatively smoothly, leading to a more
structured way of creating the program.

Overall, I really understand the importance of tdd, in a way, I guess that
I see it as "writing pseudocode++" in that you understand the end goal of
the behavior you want to create and then get around to "retconning" it in 
your code.

28 / Apr / 2020
