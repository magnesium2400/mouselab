---
layout: default
title: maskR
checksum: cf425be22c8540c76c4499b2cd97981a
---


 
# maskR Applies a right hemisphere mask to a 3D volume
 
# Syntax
```matlab
V = maskR(V)
[V, mask] = maskR(V)
```
 
# Description

`V = maskR(V)` applies a right hemisphere mask to the input volume V, zeroing out voxels in the left hemisphere.


`[V, mask] = maskR(V)` also returns the logical mask used to select the right hemisphere.

 
# Examples
```matlab
V = maskR(rand(100,100,50));
[V, mask] = maskR(getAllenTemplate(100));
```
 
# Input Arguments

`V - input volume (numeric array)` 3D array to be masked.

 
# Output Arguments

`V - masked volume (numeric array)` Volume with left hemisphere voxels set to zero.


`mask - logical mask (logical array)` Logical array indicating right hemisphere voxels.

 
# Authors

Mehul Gajwani, Monash University, 2025

 
# See also

maskL, getAllenRMask

