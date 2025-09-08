function [fig, tl, ax, V] = layoutAllenSlices(varargin)

% all this needs to do is convert the volume to a true colour image and
% then call `plotMouseAnnotation`. the true colour image will be a 4D image
% with RGB channels. it will be of size [originalSize, 3]


%% Prelims
ip = inputParser;

% Copy the order of plotMouseAnnotation
ip.addOptional('type', 'average_template', @(x) ismember(x, ["annotation", "average_template", "ara_nissl"]));
ip.addParameter('resolution', 100, @(x) ismember(x, [10 25 50 100]));
ip.addParameter('cmap', gray);
ip.addParameter('clims', []);
ip.addParameter('mask', @(x) true(size(x)));

ip.addParameter('d', 0.2);
ip.addParameter('c', 0.3);
ip.addParameter('s', 0.7);
ip.addParameter('t', 0.4);
ip.addParameter('roundResolution', 1); 
ip.addParameter('lineOptions', {'LineWidth', 1, 'Color', int2color(3)});

ip.addParameter('Parent', []);
ip.addParameter('figureOptions', {'Color', 'k', 'Position', [100 100 1230 1060]}); 
ip.addParameter('add', 'none', @(x) ismember(x, ["none", "surface", "slices"]));

% Parse
ip.parse(varargin{:}); % most arguments are only used once/passed on
ipr = ip.Results; 

% Get volume
V = getAllenTemplate(ipr.type, ipr.resolution);

% Apply mask to template and remove from future operations
ipr.mask = processMask(V, ipr.mask); 
% V = V.*cast(ipr.mask, 'like', V); 
% ipr = rmfield(ipr, 'mask'); 

% Convert to true colour
V = data2rgb(double(V), ipr.cmap, ipr.clims);
ipr.mask = repmat(ipr.mask, 1, 1, 1, size(V,4)); 

% Plot
[fig, tl, ax] = layoutCcfAnnotations(V, ipr);


end
