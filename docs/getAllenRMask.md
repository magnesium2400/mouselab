---
layout: default
title: getAllenRMask
checksum: d3d19815f7fe3b333663c9028dcb625f
---


 
# getAllenRMask Generates a right hemisphere mask for Allen volumes at a given resolution
 
# Syntax
```matlab
out = getAllenRMask(resolution)
```
 
# Description

`out = getAllenRMask(resolution)` returns the logical mask, where voxels in the right hemisphere at the specified resolution are set to true and others to false.

 
# Examples
```matlab
mask = getAllenRMask(100);
mask = getAllenRMask(50);
```
 
# Input Arguments

`resolution - target resolution (numeric scalar)` Resolution in microns for the Allen volume. Typical values are 25, 50, or 100.

 
# Output Arguments

`out - right hemisphere mask (logical 3D array)` Logical array with true values for voxels in the right hemisphere.

 
# Usage Notes
-  The mask is generated based on the third dimension (z) of the Allen volume, consistent with Allen mask definitions. 
 
# Authors

Mehul Gajwani, Monash University, 2025

 
# See also

getAllenLMask, getAllenHMask

