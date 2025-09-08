---
layout: default
title: getAllenTform
checksum: 4ec80ffd002373611f33ab2cc40b3e88
---


 
# getAllenTform Returns affine transformation matrix for Allen volume at given resolution
 
# Syntax
```matlab
T = getAllenTform(resolution)
```
 
# Description

`T = getAllenTform(resolution)` returns the affine transformation matrix for the Allen volume at the specified resolution in PIR orientation. The transformation is always in PIR orientation, sending the same voxel to the origin regardless of resolution.

 
# Examples
```matlab
T = getAllenTform();
T = getAllenTform(25)
```
 
# Input Arguments

`resolution - volume resolution in microns (100 (default) | numeric scalar)`

 
# Output Arguments

`T - affine transformation matrix (numeric array)` 4x4 matrix for scaling and shifting Allen volume coordinates in PIR orientation.

 
# Usage Notes
-  The scale is dependent on the resolution; the shift is fixed for PIR orientation. 
-  For RAS orientation, use the commented example in the code. 
 
# Authors

Mehul Gajwani, Monash University, 2025

 
# See also

getAllenTemplate, rotateVolume

