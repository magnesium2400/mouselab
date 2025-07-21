V = maskR(denumber(getAllenTemplate())-1); 
figure; plotVolume(V); 
%% Simple demo
layoutCcfAnnotations(V); 
%% Demo with anatomy
fig = layoutAllenSlices(); layoutCcfAnnotations(V, 'Parent', fig); 
%% Demo with anatomy @ different resolution
fig = layoutAllenSlices('resolution', 25, 'c', 157, 't', 157, 's', 317); 
layoutCcfAnnotations(V, 'Parent', fig, 'resolution', 100, ...
    'c', 40, 't', 40, 's', 80); 
%% Demo with params changed
layoutCcfAnnotations(V, 'resolution', 100, 'd', 1, ...
    'lineOptions', {'LineStyle', ':', 'Color', 'g', 'LineWidth', 3}); 
colormap('cool'); 
%% Show surface in fourth quadrant - need to generate surface
V = maskR(denumber(getAllenTemplate([],100))-1); 
v = V2v(V, getAllenTform(100), 1); 
f = alphaShape(v).alphaTriangulation; 
layoutCcfAnnotations(V, 'add', 'surface', 'vertices', v, 'faces', f, 'data', nonzeros(V)); 
layoutCcfAnnotations(V, 'add', 'surface', 'vertices', v, 'faces', f, 'data', nonzeros(V), ...
    'Parent', layoutAllenSlices('add', 'slices')); 
