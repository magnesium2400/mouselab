function out = getAllenHMask(res, hemi)
%% getAllenHMask Returns hemisphere mask for Allen volume at given resolution
%% Syntax
%  mask = getAllenHMask(res, hemi)
% 
% 
%% Description
% `mask = getAllenHMask(res, hemi)` outputs the mask as a logical array, where
% the hemisphere is selected by the value of `hemi`. If `hemi` is 1, the mask
% corresponds to the left hemisphere. If `hemi` is 2, the mask corresponds to
% the right hemisphere. If `hemi` is 3, the mask includes both hemispheres.
% 
% 
%% Examples
%   mask = getAllenHMask(50, 1); % left hemisphere at resolution 50 mask =
%   getAllenHMask(100, 2); % right hemisphere at resolution 100 mask =
%   getAllenHMask(25, 3); % both hemispheres at resolution 25
% 
% 
%% Input Arguments
% `res - resolution (numeric scalar)` Resolution of the Allen volume mask.
% 
% `hemi - hemisphere selector (1 | 2 | 3)` 1 for left, 2 for right, 3 for both
% hemispheres.
% 
% 
%% Output Arguments
% `mask - logical array` Logical mask for the selected hemisphere at the
% specified resolution.
% 
% 
%% Usage Notes
% * The mask size matches the Allen volume at the given resolution.
% 
% 
%% Authors
% Mehul Gajwani, Monash University, 2025
% 
% 
%% See also
% getAllenLMask, getAllenRMask
% 
% 

out = getAllenLMask(res); 
if hemi==2; out = ~out; end
if hemi==3; out = true(size(out)); end
end