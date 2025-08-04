V = maskR(denumber(getAllenTemplate())-1);
figure; plotVolume(V);
%% Simple demo
layoutCcfAnnotations(V);
%% Demo with anatomy
fig = layoutAllenSlices(); layoutCcfAnnotations(V, 'Parent', fig);
%% Demo with anatomy @ different resolution
fig = layoutAllenSlices('resolution', 50, 'round', 100/50);
layoutCcfAnnotations(V, 'Parent', fig, 'resolution', 100);
%% Demo with anatomy @ different resolution
fig = layoutAllenSlices('resolution', 50, 'c', 79, 't', 79, 's', 159);
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
%% Example with background set to white
mask = getAllenStructure(997,50,3);
fig = layoutAllenSlices('mask', mask, 'resolution', 50, 'round', 2);
layoutCcfAnnotations(V, 'Parent', fig, 'resolution', 100);
set(fig, 'Color', 'white');
