function out = getAllenHMask(res, hemi)
% 1 = lh, 2 = rh, 3 = bh
out = getAllenLMask(res); 
if hemi==2; out = ~out; end
if hemi==3; out = true(size(out)); end
end