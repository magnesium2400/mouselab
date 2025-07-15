function out = plotCcfAnnotation(V, varargin)


%% Prelims
ip = inputParser();
ip.KeepUnmatched = true; 

ip.addOptional('dim', 'c', @(x) ismember(x,["c","s","t"]));
ip.addOptional('slice', 0.25);

ip.addParameter('mask', @logical); 
ip.addParameter('resolution', 100);
ip.addParameter('Parent', []); 

ip.parse(varargin{:});

V       = double(V); 
dim     = lower(ip.Results.dim);
slice   = ip.Results.slice;
res     = ip.Results.resolution; 
ax      = ip.Results.Parent;        if isempty(ax); ax = gca(); end


%% Get data - assume in pir format (Allen default)
% Get dim and slice
dl = struct('c',1, 't',2, 's',3); % dimension letter
dim = dl.(lower(dim)); 
if slice<1; slice = ceil(size(V,dim)*slice); 
elseif mod(slice,1); error('slice must be an integer, or a number less than 1'); end

% Get data, then pad it so that there are (n+1) vertices --> n faces in
% each dimension (data will be plotted on each face, not on each vertex).
cdata = sliceDim(V,dim,slice); % can be true color or scaled color
cdata = padarray(cdata, [1 1 0], 0, 'post'); 


%% Get coordinates to plot (in voxel space and transform to template)
[X,Y,Z] = ndgrid(0:size(V,1), 0:size(V,2), 0:size(V,3)); 
% these are adjusted s.t. the first voxel (ie face, NOT vertex of the
% surface) is centred at zero
xdata = sliceDim(X,dim,slice); 
ydata = sliceDim(Y,dim,slice);
zdata = sliceDim(Z,dim,slice);
if ~all(isclose(xdata(:),xdata(1))); xdata = xdata-0.5; end
if ~all(isclose(ydata(:),ydata(1))); ydata = ydata-0.5; end
if ~all(isclose(zdata(:),zdata(1))); zdata = zdata-0.5; end
% transform to template space
v = [xdata(:), ydata(:), zdata(:)];
v = affineVerts(v, getAllenTform(res), 1); 
xdata = reshape(v(:,1), size(xdata)); 
ydata = reshape(v(:,2), size(ydata)); 
zdata = reshape(v(:,3), size(zdata)); 


%% Plot
out = surfsc(cdata, 'XData', xdata, 'YData', ydata, 'ZData', zdata, 'Parent', ax, ...
    'mask', ip.Results.mask, 'surfOptions', {'EdgeColor', 'none', 'FaceColor', 'flat'}); 


%% Beautify
if ismatrix(cdata); clim(ax, minmax(V,[],'all')); end % if cdata is scaled color (not true color)

switch dim 
    case 1; view(ax, -90, 0); camup(ax, [0 0 1]); camroll(ax, 90); 
    case 2; view(ax, 180, 0); camup(ax, [0 0 1]); camroll(ax, 90); 
    case 3; view(ax, 180,90); %camup(ax, [0 0 1]); 
end

axis(ax, 'image','off');


end

% ori = replace(lower(ori), {'p','a','i','s','r','l'}, {'c','c','t','t','s','s'});
% dim = find(char(dim) == char(ori)); 
