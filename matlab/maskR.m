function out = maskR(V)
mask = repmat(permute(1:size(V,3),[1 3 2]), size(V,1), size(V,2)); 
out = V .* cast(mask>size(V,3)/2, 'like', V); % this defintion is constitent with Allen masks
end
