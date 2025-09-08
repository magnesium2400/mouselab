%% Demonstrate downsampling starts at [1,1,1] (in PIR)
V1 = getAllenStructure(703,  25);
V2 = getAllenStructure(703,  50);
V3 = getAllenStructure(703, 100);
assert(isequal(V1(1:2:end,1:2:end,1:2:end), V2))
assert(isequal(V1(1:4:end,1:4:end,1:4:end), V3))
assert(isequal(V2(1:2:end,1:2:end,1:2:end), V3))

% sanity check that it's not always trivially true
assert(~isequal(V1(2:2:end,1:2:end,1:2:end), V2))
assert(~isequal(V1(1:2:end,2:2:end,1:2:end), V2))
assert(~isequal(V1(1:2:end,1:2:end,2:2:end), V2))
assert(~isequal(V1(2:2:end,2:2:end,1:2:end), V2))
assert(~isequal(V1(1:2:end,2:2:end,2:2:end), V2))
assert(~isequal(V1(2:2:end,1:2:end,2:2:end), V2))
assert(~isequal(V1(2:2:end,2:2:end,2:2:end), V2))

%% Check with downsampling function
V1 = getAllenStructure(703,  25);
V2 = getAllenStructure(703,  50);
V3 = getAllenStructure(703, 100);
assert(isequal(downsampleAllenVolume(V1,2), V2))
assert(isequal(downsampleAllenVolume(V1,4), V3))
assert(isequal(downsampleAllenVolume(V2,2), V3))

%%% Show the two outputs from downsampleAllenVolume
[Vd,Vr] = downsampleAllenVolume(V2, 2, 0); 
assert(isequal(Vd, V3))
assert(all(size(Vr)==size(V2)) && nnz(Vr)==nnz(Vd))

figure('Position', [1,1,13,4.5]*100); 
ff = @() cellfun(@feval, {@xyzlabel, @() axis('tight'), @() subtitle(sprintf('nnz: %i', numel(gca().Children.XData)))});
plotVolume(V2, 's', 2, 'Parent', nexttile); ff(); title("Original");    
plotVolume(Vd, 's', 2, 'Parent', nexttile); ff(); title("Downsampled"); 
plotVolume(Vr, 's', 2, 'Parent', nexttile); ff(); title("Resampled");   



