%% Documentation
% This script visualizes the Allen Brain Atlas data using various layouts and annotations.
% 
% The main steps involved are:
% 1. Load the Allen template and preprocess the data.
% 2. Visualize the volume data using different layouts.
% 3. Demonstrate the visualization with annotations at various resolutions.
% 4. Generate and display a surface representation of the data.
% 
% Functions used:
% - getAllenTemplate: Retrieves the Allen Brain Atlas template.
% - maskR: Applies a mask to the data.
% - plotVolume: Plots the 3D volume of the data.
% - layoutCcfAnnotations: Adds annotations to the layout.
% - layoutAllenSlices: Creates a layout for Allen slices.
% - V2v: Converts volume data to vertex data for surface representation.
% - alphaShape: Generates a surface from vertex data.
% 
% The script is designed to provide a comprehensive visualization of the brain atlas,
% allowing for exploration of anatomical structures at different resolutions.

V = maskR(denumber(getAllenTemplate())-1); 
figure; plotVolume(V); 
%% Simple demo
layoutCcfAnnotations(V); 
%% Demo with anatomy
fig = layoutAllenSlices(); layoutCcfAnnotations(V, 'Parent', fig); 
%% Demo with anatomy @ different resolution
fig = layoutAllenSlices('resolution', 25, 'c', 157, 't', 157, 's', 317); 
layoutCcfAnnotations(V, 'Parent', fig, 'resolution', 100, ...
    'c', 40, 't', 40, 's', 80); 
%% Demo with params changed
layoutCcfAnnotations(V, 'resolution', 100, 'd', 1, ...
    'lineOptions', {'LineStyle', ':', 'Color', 'g', 'LineWidth', 3}); 
colormap('cool'); 
%% Show surface in fourth quadrant - need to generate surface
V = maskR(denumber(getAllenTemplate([],100))-1); 
v = V2v(V, getAllenTform(100), 1); 
f = alphaShape(v).alphaTriangulation; 
layoutCcfAnnotations(V, 'add', 'surface', 'vertices', v, 'faces', f, 'data', nonzeros(V)); 
layoutCcfAnnotations(V, 'add', 'surface', 'vertices', v, 'faces', f, 'data', nonzeros(V), ...
    'Parent', layoutAllenSlices('add', 'slices')); 
