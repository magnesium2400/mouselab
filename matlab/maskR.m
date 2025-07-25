function out = maskR(V)
% maskR - Applies a masking operation to a 3D matrix.
%
% Syntax: out = maskR(V)
%
% Inputs:
%   V - A 3D matrix of numerical values.
%
% Outputs:
%   out - A 3D matrix of the same size as V, where values are retained
%         based on the masking condition.
%
% Description:
%   This function generates a mask based on the third dimension of the input
%   matrix V. The mask is created such that values in the output matrix are
%   retained if their corresponding mask value is greater than half the size
%   of the third dimension of V. The output matrix is computed by element-wise
%   multiplication of the input matrix V and the mask.

mask = repmat(permute(1:size(V,3),[1 3 2]), size(V,1), size(V,2)); 
out = V .* cast(mask>size(V,3)/2, 'like', V); % this defintion is constitent with Allen masks