function [out, V] = layoutAllenSlices(varargin)

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

ip.addOptional('d', 0.2);
ip.addOptional('c', 0.3);
ip.addOptional('s', 0.7);
ip.addOptional('t', 0.4);
ip.addOptional('lineOptions', {'LineWidth', 1, 'Color', int2color(3)}); 

ip.addParameter('Parent', []); 

% Parse
ip.parse(varargin{:}); % most arguments are only used once/passed on

% Get volume
V = getAllenTemplate(ip.Results.type, ip.Results.resolution);

% TODO : Apply mask
% mask = ip.Results.mask; 
% if isa(mask, 'function_handle'); mask = mask(V); end

% Convert to true colour
V = data2rgb(double(V), ip.Results.cmap, ip.Results.clims); 

% Plot
out = layoutCcfAnnotations(V, ip.Results); 


end
