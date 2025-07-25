%% Documentation
% This section of the code tests the function getAllenTemplate with various parameters.
% The function is called with different types of templates, resolutions, and hemispheres.
% 
% Test types include:
% - Default template
% - Nissl annotation
% - General annotation
% - Average template
%
% Test resolutions include:
% - 50 microns
% - 100 microns
%
% Test hemispheres include:
% - Left hemisphere (1)
% - Right hemisphere (2)
% - Both hemispheres (3)
%
% Each test case is executed to ensure the function behaves as expected across different inputs.

echo on
%% Test type
getAllenTemplate(); 
getAllenTemplate('ara_nissl'); 
getAllenTemplate('annotation'); 
getAllenTemplate('average_template'); 
%% Test resolution
getAllenTemplate('ara_nissl',  50); 
getAllenTemplate('ara_nissl', 100); 
getAllenTemplate('annotation',  50); 
getAllenTemplate('annotation', 100); 
getAllenTemplate('average_template',  50); 
getAllenTemplate('average_template', 100); 
%% Test hemi
getAllenTemplate('annotation',  50, 1); 
getAllenTemplate('annotation',  50, 2); 
getAllenTemplate('annotation',  50, 3); 
getAllenTemplate('annotation', 100, 1); 
getAllenTemplate('annotation', 100, 2); 
getAllenTemplate('annotation', 100, 3); 
echo off
disp('Tests complete');