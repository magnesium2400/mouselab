function [filename, sourceMask, targetMask] = ...
    findAllenConnectome(sourceId, targetId, sourceHemi, targetHemi)

res = 100; % only implementation by Allen
hl = ["L","R","B"]; % hemisphere letter

filename = fullfile(getMouselabDir(), 'connectivity', ...
    sprintf('source-knox2018_desc-MouseConnectivity_space-ccf%i%sto%i%s_res-%ium_feature.h5', ...
    sourceId, hl(sourceHemi), targetId, hl(targetHemi), res));

sourceMask = getAllenStructure(sourceId, res, sourceHemi); 
targetMask = getAllenStructure(targetId, res, targetHemi); 


end
