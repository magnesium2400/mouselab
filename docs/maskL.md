---
layout: default
title: maskL
checksum: abd30bbac5aef7948b07f2f5c391e820
---


 
# maskL Applies a left hemisphere mask to a 3D volume
 
# Syntax
```matlab
V = maskL(V)
[V, mask] = maskL(V)
```
 
# Description

`V = maskL(V)` applies a left hemisphere mask to the input volume V, zeroing out voxels in the right hemisphere.


`[V, mask] = maskL(V)` also returns the logical mask used to select the left hemisphere.

 
# Examples
```matlab
V = maskL(rand(100,100,50));
[V, mask] = maskL(getAllenTemplate(100));
```
 
# Input Arguments

`V - input volume (numeric array)` 3D array to be masked.

 
# Output Arguments

`V - masked volume (numeric array)` Volume with right hemisphere voxels set to zero.


`mask - logical mask (logical array)` Logical array indicating left hemisphere voxels.

 
# Authors

Mehul Gajwani, Monash University, 2025

 
# See also

maskR, getAllenLMask

