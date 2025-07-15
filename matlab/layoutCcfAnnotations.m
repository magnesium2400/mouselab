function [out, V] = layoutCcfAnnotations(V, varargin)

% all this needs to do is convert the volume to a true colour image and
% then call `plotMouseAnnotation`. the true colour image will be a 4D image
% with RGB channels. it will be of size [originalSize, 3]


%% Prelims
ip = inputParser;
ip.KeepUnmatched = true; 

% Copy the order of plotMouseAnnotation
ip.addParameter('resolution', 100, @(x) ismember(x, [10 25 50 100]));
ip.addParameter('mask', @logical);

ip.addOptional('d', 0.2);
ip.addOptional('c', 0.3);
ip.addOptional('s', 0.7);
ip.addOptional('t', 0.4);
ip.addOptional('lineOptions', {'LineWidth', 1, 'Color', int2color(3)}); 

ip.addParameter('Parent', []); 


%% Parse/clean inputs
ip.parse(varargin{:}); % most arguments are only used once/passed on
V     = double(V); 
res   = ip.Results.resolution;
d     = ip.Results.d;
par   = ip.Results.Parent; 
lineOptions = ip.Results.lineOptions; 

isfig = @(x) strcmp(get(x, 'type'), 'figure'); 
istl =  @(x) strcmp(get(x, 'type'), 'tiledlayout'); 
if isfig(par)
    out = par; 
    tl = par.Children; 
    if isempty(tl); tl = tiledlayout(out,212,246,'TileSpacing','none','Position',[0 0 1 1]); 
    elseif ~istl(tl); error("If parent is a figure, its only child may be a tiledlayout.");
    else; tlfunc(tl, @(ax) hold(ax,'on'), 'axnone');  % child is a tiledlayout
    end
elseif istl(par)
    tl = par; tlfunc(tl, @(ax) hold(ax,'on'), 'axnone'); 
    out = tl.Parent; 
    if ~isfig(out); error("If parent is a tiledlayout, its parent must be a figure."); end
else 
    out = figure('Color', 'k'); scfw(1230); scfh(1060); 
    tl = tiledlayout(212,246,'TileSpacing','none','Position',[0 0 1 1]); 
end


%% Plot slices
ax(1) = nexttile(tl, 1,    [ 80 114]); 
ax(2) = nexttile(tl, 115,  [ 80 132]); 
ax(3) = nexttile(tl, 19681,[132 114]); 
ax(4) = nexttile(tl, 19795,[132 132]); axis(ax(4), 'off');
 
c     = ip.Results.c; 
s     = ip.Results.s; 
t     = ip.Results.t; 
if c<1; c = ceil(size(V,1)*c); end
if t<1; t = ceil(size(V,2)*t); end
if s<1; s = ceil(size(V,3)*s); end

common = {'resolution', res, 'mask', ip.Results.mask};
plotCcfAnnotation(V, 'dim', 'c', 'Parent', ax(1), 'slice', c, common{:}); 
plotCcfAnnotation(V, 'dim', 's', 'Parent', ax(2), 'slice', s, common{:}); 
plotCcfAnnotation(V, 'dim', 't', 'Parent', ax(3), 'slice', t, common{:}); 


%% Plot lines
if ~strcmp(lineOptions{1}, 'none')
xyz = affineVerts([c,t,s]-1, getAllenTform(res), 1); 

line(ax(1), [xyz(1),xyz(1)], [xyz(2),xyz(2)], [min(zlim(ax(1))),xyz(3)-d], lineOptions{:}); 
line(ax(1), [xyz(1),xyz(1)], [xyz(2),xyz(2)], [max(zlim(ax(1))),xyz(3)+d], lineOptions{:}); 
line(ax(1), [xyz(1),xyz(1)], [min(ylim(ax(1))),xyz(2)-d], [xyz(3),xyz(3)], lineOptions{:}); 
line(ax(1), [xyz(1),xyz(1)], [max(ylim(ax(1))),xyz(2)+d], [xyz(3),xyz(3)], lineOptions{:}); 

line(ax(2), [min(xlim(ax(2))),xyz(1)-d], [xyz(2),xyz(2)], [xyz(3),xyz(3)], lineOptions{:}); 
line(ax(2), [max(xlim(ax(2))),xyz(1)+d], [xyz(2),xyz(2)], [xyz(3),xyz(3)], lineOptions{:}); 
line(ax(2), [xyz(1),xyz(1)], [min(ylim(ax(2))),xyz(2)-d], [xyz(3),xyz(3)], lineOptions{:}); 
line(ax(2), [xyz(1),xyz(1)], [max(ylim(ax(2))),xyz(2)+d], [xyz(3),xyz(3)], lineOptions{:}); 

line(ax(3), [xyz(1),xyz(1)], [xyz(2),xyz(2)], [min(zlim(ax(3))),xyz(3)-d], lineOptions{:}); 
line(ax(3), [xyz(1),xyz(1)], [xyz(2),xyz(2)], [max(zlim(ax(3))),xyz(3)+d], lineOptions{:}); 
line(ax(3), [min(xlim(ax(3))),xyz(1)-d], [xyz(2),xyz(2)], [xyz(3),xyz(3)], lineOptions{:}); 
line(ax(3), [max(xlim(ax(3))),xyz(1)+d], [xyz(2),xyz(2)], [xyz(3),xyz(3)], lineOptions{:}); 
end

end
