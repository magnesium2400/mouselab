%% Documentation Generation
% This section generates documentation for the functions used in the code.
% The documentation includes descriptions of the functions, their inputs, 
% outputs, and examples of usage.

% Function: getAllenTemplate
% Description: Retrieves volumetric data from the Allen Brain Atlas.
% Inputs:
%   - type: The type of data to retrieve (e.g., 'annotation', 'ara_nissl').
%   - resolution: The resolution of the data.
% Outputs:
%   - V: The volumetric data array.

% Function: denumber
% Description: Converts numerical data to a specific format.
% Inputs:
%   - data: The input data to be converted.
% Outputs:
%   - convertedData: The formatted output data.

% Function: plotCcfAnnotation
% Description: Plots the CCF (Common Coordinate Framework) annotations.
% Inputs:
%   - V: The volumetric data.
%   - varargin: Additional parameters for customization (e.g., 'slice', 'dim').
% Outputs:
%   - None (plots directly to the current figure).

% Function: videofigs
% Description: Creates a video figure for interactive visualization.
% Inputs:
%   - figNum: The figure number.
%   - func1, func2, ...: Functions to be executed for each frame.
% Outputs:
%   - None (creates an interactive video figure).

% Function: plotAllenSlice
% Description: Plots a slice of the Allen Brain Atlas data.
% Inputs:
%   - dim: The dimension to slice ('c', 't', or 's').
%   - slice: The specific slice number.
%   - resolution: The resolution of the data.
% Outputs:
%   - None (plots directly to the current figure).

% Function: getAllenStructure
% Description: Retrieves structural data from the Allen Brain Atlas.
% Inputs:
%   - structureId: The ID of the structure to retrieve.
%   - resolution: The resolution of the data.
% Outputs:
%   - V: The structural data array.

% Function: getAllenRMask
% Description: Retrieves the region mask for the specified resolution.
% Inputs:
%   - resolution: The resolution of the mask.
% Outputs:
%   - mask: The region mask array.

% Note: Ensure that all functions are properly documented in their respective files.

%% Comparison to ground truth
V = rand(4,4,4); 
figure; 
nexttile; imagesc(squeeze(V(1,:,:))); clim(minmax(V(:)));  axis image off; set(gca(), 'XDir', 'reverse');
nexttile; plotCcfAnnotation(V, 'slice', 1); 
%% Use `annotation` as dummy volume data and plot
V = denumber(getAllenTemplate('annotation', 100, 2))-1;  
figure; plotCcfAnnotation(V); 
%% Interactive
V = denumber(getAllenTemplate('annotation', 100, 2))-1;  
videofigs(132, @(n) plotCcfAnnotation(V, 'slice', n)); 
videofigs( 80, @(n) plotCcfAnnotation(V, 'slice', n, 'dim', 's')); 
videofigs(114, @(n) plotCcfAnnotation(V, 'slice', n, 'dim', 't')); 

%% Plot dummy data combined with background
V = getAllenTemplate('annotation', 50);
V = (denumber(double(V))-1).*getAllenRMask(50);  
videofigs(100, @(n) cla, @(n) plotAllenSlice('dim', 'c', 'slice', n/100, 'resolution', 50), ...
    @(n) hold('on'), @(n) plotCcfAnnotation(V, 'dim', 'c', 'slice', n/100, 'resolution', 50), ...
    @(n) axis('image', 'off'), @(n) colormap('lines'));

%% Combine with annotation data
V = getAllenTemplate('ara_nissl',25); % example volumetric data
figure;  plotAllenSlice('dim', 's', 'slice', 30, 'resolution', 100); 
hold on; plotCcfAnnotation(V, 'dim', 's', 'slice', 117, 'resolution', 25); 
colormap('sky'); 

%% Compare high res nissl with low res MRI
V = getAllenTemplate('ara_nissl',25).*getAllenRMask(25); % example volumetric data
videofigs(132, @(n) cla, @(n) plotAllenSlice('dim', 'c', 'slice', n, 'resolution', 100), ...
@(n) hold('on'), @(n) plotCcfAnnotation(V, 'dim', 'c', 'slice', n*4-3, 'resolution', 25), ... 
@(n) colormap('sky')); 

%% Visual inspection that scatter lines up in the centre of the voxels and vice versa
res = 50; 
V = getAllenStructure(315,res) & getAllenRMask(res);
figuremax; 
for ii = ["c","t","s"]
uit = uitab("Title",ii); ax = axes('Parent', uit); 
p = plotAllenSlice('resolution', res, 'slice', 0.55, 'dim', ii); 
v = V2v(V, getAllenTform(res), 1); 
hold on; scat3(v, '.'); 
end

