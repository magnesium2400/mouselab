function out = getAllenRMask(resolution)
% getAllenRMask generates a binary mask based on the specified resolution.
% 
% Syntax:
%   out = getAllenRMask(resolution)
%
% Inputs:
%   resolution - A scalar value representing the resolution to scale the mask.
%
% Outputs:
%   out - A binary 3D matrix where the values are true for the upper half 
%         of the z-dimension and false for the lower half, consistent with 
%         Allen brain masks.
%
% Example:
%   mask = getAllenRMask(100);
%
% Notes:
%   The mask size is determined by the fixed dimensions [132, 80, 114] 
%   scaled according to the input resolution.
sz = [132,80,114]*100/resolution; 
z = repmat(permute(1:sz(3),[1 3 2]),sz(1),sz(2));
out = z>sz(3)/2; % this defintion is constitent with Allen masks
end
