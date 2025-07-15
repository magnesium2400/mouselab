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
