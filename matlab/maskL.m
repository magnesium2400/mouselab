function [V,mask] = maskL(V)
%% maskL Applies a left hemisphere mask to a 3D volume
%% Syntax
%  V = maskL(V)
%  [V, mask] = maskL(V)
% 
% 
%% Description
% `V = maskL(V)` applies a left hemisphere mask to the input volume V, zeroing out voxels in the right hemisphere.
% 
% `[V, mask] = maskL(V)` also returns the logical mask used to select the left hemisphere.
% 
%% Examples
%   V = maskL(rand(100,100,50));
%   [V, mask] = maskL(getAllenTemplate(100));
% 
% 
%% Input Arguments
% `V - input volume (numeric array)` 3D array to be masked.
% 
% 
%% Output Arguments
% `V - masked volume (numeric array)` Volume with right hemisphere voxels set to zero.
% 
% `mask - logical mask (logical array)` Logical array indicating left hemisphere voxels.
% 
% 
%% Authors
% Mehul Gajwani, Monash University, 2025
% 
% 
%% See also
% maskR, getAllenLMask
% 
% 

mask = repmat(permute(1:size(V,3),[1 3 2]), size(V,1), size(V,2)); 
V = V .* cast(mask<=size(V,3)/2, 'like', V); % this defintion is constitent with Allen masks
end
