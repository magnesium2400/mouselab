---
layout: default
title: getAllenLMask
checksum: f8a9f28a3c7301f4b1cadc41d2e1fe72
---


 
# getAllenLMask Generates a left hemisphere mask for Allen volumes at a given resolution
 
# Syntax
```matlab
out = getAllenLMask(resolution)
```
 
# Description

`out = getAllenLMask(resolution)` returns the logical mask, where voxels in the left hemisphere at the specified resolution are set to true and others to false.

 
# Examples
```matlab
mask = getAllenLMask(100);
mask = getAllenLMask(50);
```
 
# Input Arguments

`resolution - target resolution (numeric scalar)` Resolution in microns for the Allen volume. Typical values are 25, 50, or 100.

 
# Output Arguments

`out - left hemisphere mask (logical 3D array)` Logical array with true values for voxels in the left hemisphere.

 
# Usage Notes
-  The mask is generated based on the third dimension (z) of the Allen volume, consistent with Allen mask definitions. 
 
# Authors

Mehul Gajwani, Monash University, 2025

 
# See also

getAllenLMask, getAllenHMask

