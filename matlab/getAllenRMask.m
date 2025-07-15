function out = getAllenRMask(resolution)
sz = [132,80,114]*100/resolution; 
z = repmat(permute(1:sz(3),[1 3 2]),sz(1),sz(2));
out = z>sz(3)/2; % this defintion is constitent with Allen masks
end
