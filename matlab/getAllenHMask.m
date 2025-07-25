function out = getAllenHMask(res, hemi)
% getAllenHMask generates a binary mask for the Allen brain atlas.
% 
% Syntax:
%   out = getAllenHMask(res, hemi)
%
% Inputs:
%   res  - Resolution of the mask (scalar).
%   hemi - Hemisphere indicator (1 for left hemisphere, 2 for right hemisphere, 3 for both).
%
% Outputs:
%   out  - Binary mask corresponding to the specified hemisphere.
%
% Description:
%   This function creates a binary mask based on the specified resolution
%   and hemisphere. The mask is generated using the getAllenLMask function,
%   and it is inverted for the right hemisphere. If both hemispheres are
%   requested, the output will be a mask with all true values.
% 1 = lh, 2 = rh, 3 = bh
out = getAllenLMask(res); 
if hemi==2; out = ~out; end
if hemi==3; out = true(size(out)); end
end