function out = maskL(V)
% maskL - Applies a mask to a 3D matrix V.
%
% Syntax:
%   out = maskL(V)
%
% Inputs:
%   V - A 3D matrix of any numeric type.
%
% Outputs:
%   out - A 3D matrix of the same size and type as V, where elements
%         corresponding to the mask condition are retained, and others
%         are set to zero.
%
% Description:
%   The function creates a mask based on the third dimension of the input
%   matrix V. It retains elements in the first half of the third dimension
%   and sets the rest to zero, consistent with Allen masks.
mask = repmat(permute(1:size(V,3),[1 3 2]), size(V,1), size(V,2)); 
out = V .* cast(mask<=size(V,3)/2, 'like', V); % this defintion is constitent with Allen masks
