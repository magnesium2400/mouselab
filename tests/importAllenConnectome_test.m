%%% Documentation
% This script visualizes the connectome data between two specified brain regions.
% 
% User Inputs:
% - sourceId: Identifier for the source brain region.
% - targetId: Identifier for the target brain region.
% - sourceHemi: Hemisphere of the source region (1 = left, 2 = right).
% - targetHemi: Hemisphere of the target region (1 = left, 2 = right).
%
% Outputs:
% - W: The connectome matrix representing the connections between the source and target regions.
% - sourceMask: A binary mask for the source region.
% - targetMask: A binary mask for the target region.
%
% Visualization:
% - The script generates multiple plots to visualize the source and target masks,
%   the unmasked data, and 3D scatter plots of the connectome.
% - It also provides an interactive video feature to explore the connectome data dynamically.

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

