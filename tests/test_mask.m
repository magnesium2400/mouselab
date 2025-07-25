%%% Documentation
% This script processes a 3D volume data structure obtained from the Allen Brain Atlas.
% The volume is manipulated through various masking functions to isolate specific regions.
% 
% Variables:
% V - The initial volume data, adjusted by the Allen template.
% doPlot - A boolean flag to control the plotting of the volume data.
% V2 - The volume data after applying different masks.
% 
% Functions:
% - getAllenStructure: Retrieves the structure data for a given ID.
% - denumber: Converts the Allen template to a numerical format.
% - maskR: Applies a right hemisphere mask to the volume.
% - maskL: Applies a left hemisphere mask to the volume.
% - getAllenRMask: Retrieves the right hemisphere mask for a given ID.
% - getAllenLMask: Retrieves the left hemisphere mask for a given ID.
% - plotVolume: Visualizes the volume data.
% 
% Assertions are used to ensure the integrity of the volume data after each operation.
% The script includes plotting functionality to visualize the results of each masking operation.

%%% Shared variables
V = double(getAllenStructure(315)).*(denumber(getAllenTemplate())-1);
doPlot = true; 
assert(nnz(V)==123245)
if doPlot; figure; nexttile; plotVolume(V); end
%% maskR
V2 = maskR(V); 
assert(nnz(V2)==61878); 
if doPlot; nexttile; plotVolume(V2); end
%% maskL
V2 = maskL(V); 
assert(nnz(V2)==61367); 
if doPlot; nexttile; plotVolume(V2); end
%% getAllenMaskR
V2 = V.*double(getAllenRMask(100)); 
assert(nnz(V2)==61878); 
if doPlot; nexttile; plotVolume(V2); end
%% getAllenMaskL
V2 = V.*double(getAllenLMask(100)); 
assert(nnz(V2)==61367); 
if doPlot; nexttile; plotVolume(V2); end

