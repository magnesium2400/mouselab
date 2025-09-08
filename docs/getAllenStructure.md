---
layout: default
title: getAllenStructure
checksum: 3aaf9d4c1a298e8b79f756ca4779bde5
---


 
# getAllenStructure Get structure volume/mask in CCF space
 
# Syntax
```matlab
V = getAllenStructure(structureId)
V = getAllenStructure(structureId, res)
V = getAllenStructure(structureId, res, hemi)
```
 
# Description

`V = getAllenStructure(structureId)` retrieves the structure data for the given `structureId` at the default resolution and for both hemispheres.


`V = getAllenStructure(structureId, res)` retrieves the structure data at the specified resolution.


`V = getAllenStructure(structureId, res, hemi)` retrieves the structure data for the specified hemisphere.

 
# Examples
```matlab
V = getAllenStructure(997);
V = getAllenStructure(997, 50);
V = getAllenStructure(997, 50, 1);
```
 
# Input Arguments

`structureId - Allen Brain Atlas structure ID (997 (default) | positive integer scalar)`


`res - resolution in microns (100 (default) | numeric)`


`hemi - hemisphere selection (3 (default) | 1 | 2)` 1 for left, 2 for right, 3 for both hemispheres.

 
# Authors

Mehul Gajwani, Monash University, 2025

 
# See also

findAllenStructure, getAllenHMask

