%%% Shared variables
V = double(getAllenStructure(315)).*(denumber(getAllenTemplate())-1);
doPlot = true; 
assert(nnz(V)==123245)
if doPlot; figure; nexttile; plotVolume(V); end
%% maskR
V2 = maskR(V); 
assert(nnz(V2)==61878); 
if doPlot; nexttile; plotVolume(V2); end
%% maskL
V2 = maskL(V); 
assert(nnz(V2)==61367); 
if doPlot; nexttile; plotVolume(V2); end
%% getAllenMaskR
V2 = V.*double(getAllenRMask(100)); 
assert(nnz(V2)==61878); 
if doPlot; nexttile; plotVolume(V2); end
%% getAllenMaskL
V2 = V.*double(getAllenLMask(100)); 
assert(nnz(V2)==61367); 
if doPlot; nexttile; plotVolume(V2); end

