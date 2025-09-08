---
layout: default
title: findAllenTemplate
checksum: 5fdd8f89bf3085da63e220cacc2917fc
---


 
# findAllenTemplate Finds the path to Allen Institute template files
 
# Syntax
```matlab
filename = findAllenTemplate(type)
filename = findAllenTemplate(type, resolution)
```
 
# Description

`filename = findAllenTemplate(type)` returns the local path to the template file from the AIBS of the specified type.


`filename = findAllenTemplate(type, resolution)` additionally specifies the resolution of the template file.

 
# Examples
```matlab
filename = findAllenTemplate('annotation')
filename = findAllenTemplate('average_template', 50)
filename = findAllenTemplate('ara_nissl', 100)
```
 
# Input Arguments

`type - type of template file ('annotation' (default) | 'ara_nissl' | 'average_template')` Specifies the type of template file.


`resolution - resolution of the template file (100 (default) | numeric scalar)` Specifies the resolution of the template file in microns.

 
# Usage Notes
-  If the requested file does not exist, a warning is issued with a suggested URL to download the file. 
 
# Authors

Mehul Gajwani, Monash University, 2025

 
# See also

getAllenTemplate

