function out = getAllenRMask(resolution)
%% getAllenRMask Generates a right hemisphere mask for Allen volumes at a given resolution
%% Syntax
%  out = getAllenRMask(resolution)
% 
% 
%% Description
% `out = getAllenRMask(resolution)` returns the logical mask, where voxels in
% the right hemisphere at the specified resolution are set to true and others to
% false.
% 
% 
%% Examples
%   mask = getAllenRMask(100);
%   mask = getAllenRMask(50);
% 
% 
%% Input Arguments
% `resolution - target resolution (numeric scalar)` Resolution in microns for
% the Allen volume. Typical values are 25, 50, or 100.
% 
% 
%% Output Arguments
% `out - right hemisphere mask (logical 3D array)` Logical array with true
% values for voxels in the right hemisphere.
% 
% 
%% Usage Notes
% * The mask is generated based on the third dimension (z) of the Allen volume,
% consistent with Allen mask definitions.
% 
% 
%% Authors
% Mehul Gajwani, Monash University, 2025
% 
% 
%% See also
% getAllenLMask, getAllenHMask
% 
% 

sz = [132,80,114]*100/resolution; 
z = repmat(permute(1:sz(3),[1 3 2]),sz(1),sz(2));
out = z>sz(3)/2; % this defintion is constitent with Allen masks
end
