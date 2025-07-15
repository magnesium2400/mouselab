%% Comparison to ground truth
V = rand(4,4,4); 
figure; 
nexttile; imagesc(squeeze(V(1,:,:))); clim(minmax(V(:)));  axis image off; set(gca(), 'XDir', 'reverse');
nexttile; plotCcfAnnotation(V, 'slice', 1); 
%% Use `annotation` as dummy volume data and plot
V = denumber(getAllenTemplate('annotation', 100, 2))-1;  
figure; plotCcfAnnotation(V); 
%% Interactive
V = denumber(getAllenTemplate('annotation', 100, 2))-1;  
videofigs(132, @(n) plotCcfAnnotation(V, 'slice', n)); 
videofigs( 80, @(n) plotCcfAnnotation(V, 'slice', n, 'dim', 's')); 
videofigs(114, @(n) plotCcfAnnotation(V, 'slice', n, 'dim', 't')); 

%% Plot dummy data combined with background
V = getAllenTemplate('annotation', 50);
V = (denumber(double(V))-1).*getAllenRMask(50);  
videofigs(100, @(n) cla, @(n) plotAllenSlice('dim', 'c', 'slice', n/100, 'resolution', 50), ...
    @(n) hold('on'), @(n) plotCcfAnnotation(V, 'dim', 'c', 'slice', n/100, 'resolution', 50), ...
    @(n) axis('image', 'off'), @(n) colormap('lines'));

%% Combine with annotation data
V = getAllenTemplate('ara_nissl',25); % example volumetric data
figure;  plotAllenSlice('dim', 's', 'slice', 30, 'resolution', 100); 
hold on; plotCcfAnnotation(V, 'dim', 's', 'slice', 117, 'resolution', 25); 
colormap('sky'); 

%% Compare high res nissl with low res MRI
V = getAllenTemplate('ara_nissl',25).*getAllenRMask(25); % example volumetric data
videofigs(132, @(n) cla, @(n) plotAllenSlice('dim', 'c', 'slice', n, 'resolution', 100), ...
@(n) hold('on'), @(n) plotCcfAnnotation(V, 'dim', 'c', 'slice', n*4-3, 'resolution', 25), ... 
@(n) colormap('sky')); 

%% Visual inspection that scatter lines up in the centre of the voxels and vice versa
res = 50; 
V = getAllenStructure(315,res) & getAllenRMask(res);
figuremax; 
for ii = ["c","t","s"]
uit = uitab("Title",ii); ax = axes('Parent', uit); 
p = plotAllenSlice('resolution', res, 'slice', 0.55, 'dim', ii); 
v = V2v(V, getAllenTform(res), 1); 
hold on; scat3(v, '.'); 
end

