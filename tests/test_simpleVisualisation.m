% Get data
resolution = 50; 
V = getAllenTemplate([],resolution); 
d = nonzeros(V); 
v = V2v(V,getAllenTform(resolution),1); 

% Plot
ss = (100/resolution); % step size
mask = repmat(diag([1, zeros(1,ss-1)]).* cat(3,1,zeros(1,1,ss-1)), size(V)./ss); % downsample just for plotting
figure;
nexttile; plotVolume(V.*cast(mask, 'like', V)); 
nexttile; scat3(v(1:(ss^3):end,:),[],d(1:(ss^3):end),'.'); axis image; xyzlabel; 



