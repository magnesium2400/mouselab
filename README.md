# `mouselab` - package for interacting with Allen Mouse Brain Connectivity Data with MATLAB

## I want to get started!
- Clone/download this directory
- Install the python environment using `conda` and `environment.yaml`
  - This will install both `allensdk` (needed for doanloading volumetric masks at various resolutions) and `mcmodels` (for accessing the actual connectomic data). 
  - `allensdk` documentation can be found [here](https://allensdk.readthedocs.io/en/latest/) and code [here](https://github.com/AllenInstitute/AllenSDK)
  - `mcmodels` documentation can be found [here](https://mouse-connectivity-models.readthedocs.io/en/latest/index.html) and code [here](https://github.com/AllenInstitute/mouse_connectivity_models)
- Open the `conda` environment and run `import mouselab; mouselab.download_common_data` (this should run without any errors).
  - This will take ~5 mins but only needs to be done once. It will populate the directories in the repo with the most commonly used AIBS data. 
  - Have a look at `mouselab.py` and the `IPython` notebooks (`masks`, `connectivity`, `structures`) for examples of the (simple) python functionality for downloading the data.
- Now we can get started doing visualisations in MATLAB! Add the `matlab` and `tests` directories of this repo to your MATLAB path. This repo also requires [nihelp](https://github.com/magnesium2400/nihelp) - please clone/download and add to your MATLAB path.
	- Run `test_commonData` from the MATLAB Command Editor (this should run without any errors). Then try `test_simpleVisualisation`. 
	- Then run `plotAllenSlice();` and `layoutAllenSlices();`. Then try `layoutAllenSlices_test();` and `layoutCcfAnnotations_test();`.
	- Then, you can import your own volumetric data (in CCF format) and run `plotCcfAnnotation(myData);` and `layoutCcfAnnotations(myData);` and you are good to go!


## Information about AIBS data
- This package focuses on the ccf_2017 release. It is not the most recent (e.g. 2022 is available) but it is the most comprehensive. 
- All the data are available from [here](https://download.alleninstitute.org/informatics-archive/current-release/mouse_ccf/). The python API is used to interact with (download and index) the data from here. 

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


## Python Information
- For a gentle introduction to the Allen API, explore the notebooks in the following order: 
  1. `structures.ipynb`
  2. `masks.ipynb`
  3. `connectivity.ipynb`


## MATLAB Information











