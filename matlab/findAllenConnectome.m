function [filename, sourceMask, targetMask] = ...
    findAllenConnectome(sourceId, targetId, sourceHemi, targetHemi)
% findAllenConnectome - Retrieves connectivity data between two brain regions.
%
% Syntax:
%   [filename, sourceMask, targetMask] = findAllenConnectome(sourceId, targetId, sourceHemi, targetHemi)
%
% Inputs:
%   sourceId   - Identifier for the source brain region.
%   targetId   - Identifier for the target brain region.
%   sourceHemi - Hemisphere of the source region (1 for left, 2 for right).
%   targetHemi - Hemisphere of the target region (1 for left, 2 for right).
%
% Outputs:
%   filename    - Full path to the connectivity data file.
%   sourceMask  - Binary mask for the source brain region.
%   targetMask  - Binary mask for the target brain region.
%
% Description:
%   This function generates the filename for the connectivity data based on the
%   provided source and target identifiers and hemispheres. It also retrieves
%   the binary masks for the specified brain regions using the Allen Brain Atlas.
res = 100; % only implementation by Allen
hl = ["L","R","B"]; % hemisphere letter

filename = fullfile(getMouselabDir(), 'connectivity', ...
    sprintf('source-knox2018_desc-MouseConnectivity_space-ccf%i%sto%i%s_res-%ium_feature.h5', ...
    sourceId, hl(sourceHemi), targetId, hl(targetHemi), res));

sourceMask = getAllenStructure(sourceId, res, sourceHemi); 
targetMask = getAllenStructure(targetId, res, targetHemi); 


end
