%% Documentation for layoutAllenSlices function
% This function visualizes anatomical structures in the Allen Brain Atlas.
% 
% Usage:
%   layoutAllenSlices(); 
%   layoutAllenSlices('ara_nissl', 'c', 0.8, 's', 0.8, 't', 0.8, ...
%       'lineOptions', {'none'}, 'cmap', sky, 'resolution', 25);
%   layoutAllenSlices('add', 'slices');
%
% Inputs:
%   - 'ara_nissl': (string) The type of atlas to visualize.
%   - 'c': (char) Color scaling for the visualization.
%   - 's': (numeric) Scaling factor for slice thickness.
%   - 't': (numeric) Transparency level for the slices.
%   - 'lineOptions': (cell array) Options for line display.
%   - 'cmap': (matrix) Colormap for the visualization.
%   - 'resolution': (numeric) Resolution of the displayed slices.
%
% Outputs:
%   - Visual representation of the specified slices from the Allen Brain Atlas.
%
% Example:
%   To visualize the Nissl-stained sections with specific parameters, use:
%   layoutAllenSlices('ara_nissl', 'c', 0.8, 's', 0.8, 't', 0.8, ...
%       'lineOptions', {'none'}, 'cmap', sky, 'resolution', 25);

%% Simple demo
layoutAllenSlices(); 
%% Another example showing most of the features
layoutAllenSlices('ara_nissl', 'c', 0.8, 's', 0.8', 't', 0.8, ...
    'lineOptions', {'none'}, 'cmap', sky, 'resolution', 25); 
%% Add slices
layoutAllenSlices('add', 'slices'); 