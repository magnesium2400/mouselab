function [V,mask] = maskR(V)
%% maskR Applies a right hemisphere mask to a 3D volume
%% Syntax
%  V = maskR(V)
%  [V, mask] = maskR(V)
% 
% 
%% Description
% `V = maskR(V)` applies a right hemisphere mask to the input volume V, zeroing out voxels in the left hemisphere.
% 
% `[V, mask] = maskR(V)` also returns the logical mask used to select the right hemisphere.
% 
% 
%% Examples
%   V = maskR(rand(100,100,50));
%   [V, mask] = maskR(getAllenTemplate(100));
% 
% 
%% Input Arguments
% `V - input volume (numeric array)` 3D array to be masked.
% 
% 
%% Output Arguments
% `V - masked volume (numeric array)` Volume with left hemisphere voxels set to zero.
% 
% `mask - logical mask (logical array)` Logical array indicating right hemisphere voxels.
% 
% 
%% Authors
% Mehul Gajwani, Monash University, 2025
% 
% 
%% See also
% maskL, getAllenRMask
%
%

mask = repmat(permute(1:size(V,3),[1 3 2]), size(V,1), size(V,2)); 
V = V .* cast(mask>size(V,3)/2, 'like', V); % this defintion is constitent with Allen masks
end
