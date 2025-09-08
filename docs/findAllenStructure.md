---
layout: default
title: findAllenStructure
checksum: 3d80cd583453cc95e3d7c51c39ceea0f
---


 
# findAllenStructure Finds the file path for an Allen Brain Atlas structure mask
 
# Syntax
```matlab
filename = findAllenStructure(structureId, res)
```
 
# Description

`filename = findAllenStructure(structureId, res)` generates the file path for a specific Allen Brain Atlas structure mask based on the provided structure ID and resolution.

 
# Examples
```matlab
filename = findAllenStructure(997, 100)
filename = findAllenStructure(8, 50)
```
 
# Input Arguments

`structureId - ID of the structure (integer)` The unique identifier for the structure in the Allen Brain Atlas.


`res - resolution (integer)` The resolution of the structure mask in microns.

 
# Output Arguments

`filename - file path (character vector)` The full file path to the structure mask file.

 
# Usage Notes
-  If the file does not exist, a warning is issued suggesting the use of `mouselab.download_structure_mask` to download the required file. 
 
# Authors

Mehul Gajwani, Monash University, 2025

 
# See also

getMouselabDir, mouselab.download_structure_mask

