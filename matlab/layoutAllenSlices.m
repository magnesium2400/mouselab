function [fig, tl, ax, V] = layoutAllenSlices(varargin)
% LAYOUTALLENSLICES Generates a true color image from the Allen brain volume
% and plots the mouse annotations.
%
% Syntax:
%   [fig, tl, ax, V] = layoutAllenSlices(varargin)
%
% Inputs:
%   Optional Name-Value Pair Arguments:
%   'type'       - Type of volume to retrieve. Options: 'annotation', 
%                  'average_template', 'ara_nissl'. Default is 
%                  'average_template'.
%   'resolution' - Resolution of the volume. Options: 10, 25, 50, 100. 
%                  Default is 100.
%   'cmap'      - Colormap to use for the image. Default is gray.
%   'clims'     - Color limits for the colormap. Default is [] (auto).
%   'mask'      - Function handle to apply a mask to the volume. 
%                  Default is @(x) true(size(x)).
%   'd', 'c', 's', 't' - Optional parameters for additional customization.
%   'lineOptions' - Cell array of options for line properties. Default 
%                   is {'LineWidth', 1, 'Color', int2color(3)}.
%   'Parent'    - Parent axes for the plot. Default is [].
%   'add'       - Specifies how to add the plot. Options: 'none', 
%                  'surface', 'slices'. Default is 'none'.
%
% Outputs:
%   fig - Figure handle of the generated plot.
%   tl  - Title handle of the plot.
%   ax  - Axes handle of the plot.
%   V   - The true color image volume.
%
% Example:
%   [fig, tl, ax, V] = layoutAllenSlices('type', 'annotation', 'resolution', 50);

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
ip.addParameter('add', 'none', @(x) ismember(x, ["none", "surface", "slices"]));

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
[fig, tl, ax] = layoutCcfAnnotations(V, ip.Results);


end
