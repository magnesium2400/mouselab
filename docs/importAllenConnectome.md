---
layout: default
title: importAllenConnectome
checksum: a0ed4b8a9da30b09439ffc7aa455f328
---


 
# importAllenConnectome Loads connectome weights after downloading from python
 
# Syntax
```matlab
W = importAllenConnectome(sourceId, targetId, sourceHemi, targetHemi) [W,
sourceIdx, targetIdx] = importAllenConnectome(___)
```
 
# Description

`W = importAllenConnectome(sourceId, targetId, sourceHemi, targetHemi)` loads the connectome weights for the specified source and target structure IDs and hemispheres.


`[W, sourceIdx, targetIdx] = importAllenConnectome(_)` also returns the voxel indices for the source and target masks in PIR orientation.

 
# Examples
```matlab
W = importAllenConnectome(184, 184, 2, 3);
W = importAllenConnectome(184, 184, 2, 2);
[W, sIdx, tIdx] = importAllenConnectome(184, 184, 2, 2);
```
 
# Input Arguments

`sourceId - source structure ID (numeric scalar)` Allen structure ID for the source region.


`targetId - target structure ID (numeric scalar)` Allen structure ID for the target region.


`sourceHemi - source hemisphere selector (3 (default) | 1 | 2)` 1 for left, 2 for right, 3 for both hemispheres.


`targetHemi - target hemisphere selector (3 (default) | 1 | 2)` 1 for left, 2 for right, 3 for both hemispheres.

 
# Output Arguments

`W - connectome weight matrix (numeric array)` Matrix of connection weights from source to target voxels.


`sourceIdx - source voxel indices (numeric array)` Indices of source voxels in PIR orientation.


`targetIdx - target voxel indices (numeric array)` Indices of target voxels in PIR orientation.

 
# Authors

Mehul Gajwani, Monash University, 2025

 
# See also

findAllenConnectome, getAllenStructure

