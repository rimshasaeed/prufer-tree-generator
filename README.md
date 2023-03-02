# Prufer Tree Generator
This repository contains MATLAB code for generating a tree from a given Prüfer sequence. The code takes a Prüfer code as input and produces a tree in the form of an edge matrix that can be plotted using MATLAB's built-in `graph` function.

### How to use
To use this code, simply run the `prufer_tree_generator.m` script in MATLAB. You will be prompted to enter a Prüfer code as input, which should be a sequence of integers separated by commas. For example:b
```
Enter your prufer code separated by comma: 2,5,5,2,3
```
The script will then generate a tree and display the edge matrix, as well as the `lst` and `L` arrays.

## How it works
The code works by first computing the number of vertices in the tree based on the length of the input Prüfer code. It then loops over the entire Prüfer code, finding the minimum value in the vertices that is not included in the code. It uses this value to compute the tree edges and store them in a cell array. It then updates the Prüfer code by removing the first element and adding the missing vertex to the end.
Once all edges have been computed, the code checks for the missing vertex and connects it to the last node. It then plots the tree using MATLAB's built-in `graph` function and computes the edge matrix, `lst` array, and `L` array.
