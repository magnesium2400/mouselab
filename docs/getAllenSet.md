---
layout: default
title: getAllenSet
checksum: 6f70e93554a804768181a92891eb1396
---


 
# getAllenSet Generates a labeled Allen structure volume and info table for a given set, resolution, and hemisphere
 
# Syntax
```matlab
V = getAllenSet(setId) V = getAllenSet(setId, res) V = getAllenSet(setId,
res, hemi) [V, dataInfoTable] = getAllenSet(___)
```
 
# Description

`V = getAllenSet(setId)` loads the structure set with the specified set ID, using default resolution 100 and both hemispheres.


`V = getAllenSet(setId, res)` loads the structure set with the specified set ID and resolution, using both hemispheres.


`V = getAllenSet(setId, res, hemi)` loads the structure set with the specified set ID, resolution, and hemisphere selector.


`[V, dataInfoTable] = getAllenSet(_)` also returns a table of structure metadata for the selected set, resolution, and hemisphere.

 
# Examples
```matlab
V = getAllenSet(2); % Default resolution and both hemispheres V =
getAllenSet(12, 50); % Set 12 at resolution 50, both hemispheres V =
getAllenSet(2, 100, 1); % Set 2 at resolution 100, left hemisphere only [V,
info] = getAllenSet(2, 25, 3); % Set 2 at resolution 25, both hemispheres,
with info table
```
 
# Input Arguments

`setId - structure set ID (2 (default) | numeric scalar)` ID of the Allen structure set to load.


`res - resolution (100 (default) | numeric scalar)` Resolution of the output volume.


`hemi - hemisphere selector (3 (default) | 1 | 2)` 1 for left, 2 for right, 3 for both hemispheres.

 
# Output Arguments

`V - labeled volume (numeric array)` 3D array with each voxel labeled by structure ID.


`dataInfoTable - structure info table (table)` Table containing metadata for each structure in the set.

 
# Usage Notes
-  Structure metadata is loaded from a JSON file using findAllenSet that must first be generated using python. 
-  Overlapping structures will trigger a warning. 
 
# Authors

Mehul Gajwani, Monash University, 2025

 
# See also

findAllenSet, getAllenStructure

