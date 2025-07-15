# `mouselab` - package for interacting with Allen Mouse Brain Connectivity Data with MATLAB

## Installation
- Install python environment using `conda` and `environment.yaml`. This includes installation of both `allensdk` (needed for doanloading volumetric masks at various resolutions) and `mcmodels` (for accessing the actual connectomic data). 
  - `allensdk` documentation can be found [here](https://allensdk.readthedocs.io/en/latest/) and code [here](https://github.com/AllenInstitute/AllenSDK)
  - `mcmodels` documentation can be found [here](https://mouse-connectivity-models.readthedocs.io/en/latest/index.html) and code [here](https://github.com/AllenInstitute/mouse_connectivity_models)

- MATLAB functions require [nihelp](https://github.com/magnesium2400/nihelp). This can be downloaded/cloned and added to MATLAB path.


## Information about AIBS data
- This package focuses on the ccf_2017 release. It is not the most recent (e.g. 2022 is available) but it is the most comprehensive. 
- All the data are available from [here](https://download.alleninstitute.org/informatics-archive/current-release/mouse_ccf/annotation/ccf_2017/). The python API is used to interact with (download and index) the data from here. 

### Structures and structure sets
- AIBS has split up the mouse brain into ~1000 individual structures. This is somewhat hierarchical: structures can be recursively split into other structures
- There are 12 'major brain divisions' which contain other parenchymal structures within them. These are Cerebellum, Cortical subplate, Hippocampal formation, Hypothalamus, Isocortex, Midbrain, Medulla, Olfactory areas, Pons, Pallidum, Striatum, and Thalamus.
  - e.g. whilst there is a structure called 'Isocortex', there is also a structure called 'Isocortex layer 1', 'Layer 2/3', etc.
  - e.g. whilst there is a structure called 'Isocortex', there is also a structure called 'VISp', 'SSs', etc.
 
- Separately, there are also broader groupings called structure sets. These also contain individual structures. 
  - e.g. the '12 major brain divisions' is one structure set. 
  - e.g. the 'Isocortex' is one structure set. 

#### Examples of structures sets
- 691663206 : has surfaces mesh (list of all structures in the informatics archive i.e. all 840 easily accessible structures)
- 687527670, 2 : 12 brain major divisions
    - 688152368: Cerebellum
    - 688152360: Cortical subplate
    - 688152359: Hippocampal formation
    - 688152364: Hypothalamus
    - 688152357: Isocortex (43 node isocortical parcellation)
    - 688152365: Midbrain
    - 688152367: Medulla
    - 688152358: Olfactory areas
    - 688152366: Pons
    - 688152362: Pallidum
    - 688152361: Striatum
    - 688152363: Thalamus
- 12 : ABA differential search (843 structures, this is different to the above 840 structures)

### Included data
- Included in the repo are downloads for several key structures: 
  - `annotation_{res}.nrrd`
  - 997: The "annotation" masks - these are whole brain masks that correspond to the `annotation_{res}.nrrd` files
  - 8: These are "whole brain" masks containing all the vertices in the 12 major brain divisions (see below). This is also the target of all the injections in the connectome (448962 voxels). 
    - 512: Cerebellum
    - 703: Cortical subplate
    - 1089: Hippocampal formation
    - 1097: Hypothalamus
    - 315: Isocortex
    - 313: Midbrain
    - 354: Medulla
    - 698: Olfactory areas
    - 771: Pons
    - 803: Pallidum
    - 477: Striatum
    - 549: Thalamus
  - 73: Ventricular system


## Python Usage
- For a gentle introduction to the Allen API, explore the notebooks in the following order: 
  1. `structures.ipynb`
  2. `masks.ipynb`
  3. `connectivity.ipynb`


## MATLAB Usage











