%%% User inputs - select data
sourceId = 184; 
targetId = 184; 
sourceHemi = 2; 
targetHemi = 3; 

%%% Get connectome and masks
W = importAllenConnectome(sourceId, targetId, sourceHemi, targetHemi); 
[~,sourceMask,targetMask] = findAllenConnectome(sourceId, targetId, sourceHemi, targetHemi);


%% Many ways to plot!
figure; 
nexttile; plotVolume(sourceMask, 'c', W(:,1));
nexttile; plotVolume(targetMask, 'c', W(1,:));

sourceData = reshape(unmask(sourceMask,W(:,1),0),size(sourceMask));
targetData = reshape(unmask(targetMask,W(1,:)',0),size(targetMask)); 
nexttile; plotVolume(sourceData); 
nexttile; plotVolume(targetData); 

sourcev = V2v(sourceMask,getAllenTform(100),1); 
targetv = V2v(targetMask,getAllenTform(100),1); 
nexttile; scat3(sourcev, [], W(:,1), 'filled'); axis equal; 
nexttile; scat3(targetv, [], W(1,:), 'filled'); axis equal; 


%% Interactive
videofigs(height(W), @(n) plotVolume(sourceMask, 'c', W(:,n)));
videofigs(width(W),  @(n) plotVolume(targetMask, 'c', W(n,:)));

