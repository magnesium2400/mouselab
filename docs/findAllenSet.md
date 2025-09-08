---
layout: default
title: findAllenSet
checksum: 6de82fe86fdf9e97db5905864a566cd5
---


 
# findAllenSet Finds the path to a structure set JSON file
 
# Syntax
```matlab
filename = findAllenSet(setId)
```
 
# Description

`filename = findAllenSet(setId)` generates the full path to a structure set JSON file based on the provided `setId`.

 
# Examples
```matlab
p = findAllenSet(2)
p = findAllenSet(688152357)
```
 
# Input Arguments

`setId - ID of the structure set (integer)` The unique identifier for the structure set whose JSON file path is to be retrieved.

 
# Output Arguments

`filename - Path to the structure set JSON file (character vector)` The full path to the JSON file corresponding to the specified `setId`.

 
# Usage Notes
-  If the file does not exist, a warning is issued with a suggestion to generate the file using Python. 
 
# Authors

Mehul Gajwani, Monash University, 2025

 
# See also

getAllenSet

