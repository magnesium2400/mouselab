function [out,V] = plotAllenSlice(varargin)
% plotAllenSlice generates a true color image from a given volume and
% plots it with mouse annotations.
%
% Syntax:
%   [out, V] = plotAllenSlice('type', typeValue, 'dim', dimValue, 
%                              'slice', sliceValue, 'resolution', resolutionValue, 
%                              'cmap', colormapValue, 'clims', climValues, 
%                              'mask', maskFunction, 'Parent', parentHandle)
%
% Inputs:
%   'type'      - (optional) Type of the volume to be plotted. 
%                 Choices: 'annotation', 'average_template', 'ara_nissl'.
%                 Default is 'average_template'.
%   'dim'       - (optional) Dimension to slice through. 
%                 Choices: 'c', 's', 't'. Default is 'c'.
%   'slice'     - (optional) Position of the slice in the specified dimension. 
%                 Default is 0.25.
%   'resolution' - (optional) Resolution of the output image. 
%                  Choices: 10, 25, 50, 100. Default is 100.
%   'cmap'      - (optional) Colormap to use for the image. 
%                 Default is gray.
%   'clims'     - (optional) Color limits for the image. 
%                 Default is empty, which uses the full range of the data.
%   'mask'      - (optional) Function handle for masking the volume. 
%                 Default is a function that returns true for all elements.
%   'Parent'    - (optional) Handle to the parent axes for plotting. 
%                 Default is empty, which uses the current axes.
%
% Outputs:
%   out         - Output from the plotCcfAnnotation function, which contains 
%                 the plotted annotation.
%   V           - The volume data converted to double precision.
%
% Example:
%   [out, V] = plotAllenSlice('type', 'annotation', 'dim', 's', 'slice', 0.5);

% all this needs to do is convert the volume to a true colour image and
% then call `plotMouseAnnotation`. the true colour image will be a 4D image
% with RGB channels. it will be of size [originalSize, 3]


%% Prelims
ip = inputParser;

% Copy the order of plotMouseAnnotation
ip.addOptional('type', 'average_template', @(x) ismember(x, ["annotation", "average_template", "ara_nissl"])); 
ip.addOptional('dim', 'c', @(x) ismember(x,["c","s","t"]));
ip.addOptional('slice', 0.25);

ip.addParameter('resolution', 100, @(x) ismember(x, [10 25 50 100]));
ip.addParameter('cmap', gray);
ip.addParameter('clims', []);
ip.addParameter('mask', @(x) true(size(x)));

ip.addParameter('Parent', []); 

% Parse
ip.parse(varargin{:}); % most arguments are only used once/passed on
type = ip.Results.type; 
res  = ip.Results.resolution;


%% Get volume
persistent plotAllenSlice
fname = sprintf('type_%s_resolution_%i', type, res); 
if ~isfield(plotAllenSlice, fname)
    V = getAllenTemplate(type,res); 
    plotAllenSlice.(fname) = V;
else
    V = plotAllenSlice.(fname);
end
V = double(V); 


%% Convert to true colour and pass on for plotting
Vc = data2rgb(V, ip.Results.cmap, ip.Results.clims); 

out = plotCcfAnnotation(Vc, ...
    'dim', ip.Results.dim, 'slice', ip.Results.slice, ...
    'mask', ip.Results.mask, 'resolution', res, 'Parent', ip.Results.Parent);


end







