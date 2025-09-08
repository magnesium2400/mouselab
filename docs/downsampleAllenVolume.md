---
layout: default
title: downsampleAllenVolume
checksum: 00985a60ce58892cc461b85ed76a66cb
---


 
# downsampleAllenVolume Downsamples a 3D volume by a specified ratio
 
# Syntax
```matlab
Vdownsampled = downsampleAllenVolume(V, ratio)
Vdownsampled = downsampleAllenVolume(V, ratio, fillVal)
[Vdownsampled, Vresampled] = downsampleAllenVolume(___)
```
 
# Description

`Vdownsampled = downsampleAllenVolume(V, ratio)` returns a downsampled version of `V` containing every nth slice (in every dimension) based on the specified ratio.


`Vdownsampled = downsampleAllenVolume(V, ratio, fillVal)` returns a downsampled version of `V` and allows specifying a fill value for the resampled volume.


`[Vdownsampled, Vresampled] = downsampleAllenVolume(_)` returns both the downsampled volume and a resampled version of `V` where the nth slices are kept, and the other elements are set to a specified fill value (default is NaN).

 
# Examples
```matlab
V = downsampleAllenVolume(getAllenStructure(703, 50, 2), 2);
[Vdownsampled, Vresampled] = downsampleAllenVolume(getAllenStructure(703, 50, 2), 2, 0);
```
 
# Input Arguments

`V - Input 3D volume (numeric array)`


`ratio - Downsampling ratio (positive integer)` Specifies the step size for downsampling in each dimension.


`fillVal - Fill value for resampled volume (numeric scalar | NaN (default))` Specifies the value to fill in the resampled volume for elements not included in the downsampling.

 
# Output Arguments

`Vdownsampled - Downsampled volume (numeric array)` Contains every nth slice of the input volume `V` in each dimension.


`Vresampled - Resampled volume (numeric array)` Contains the nth slices of the input volume `V`, with other elements set to the specified fill value.

 
# Usage Notes
-  The function assumes the input volume `V` is a 3D numeric array. 
-  The Allen downsampling always starts from the 1st index (in PIR format). 
 
# Authors

Mehul Gajwani, Monash University, 2025

 
# See also

demo_downsampling

