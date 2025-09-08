function [filename, sourceMask, targetMask] = ...
    findAllenConnectome(sourceId, targetId, sourceHemi, targetHemi)
%% findAllenConnectome Finds connectivity data between two brain regions
%% Syntax
%  filename = findAllenConnectome(sourceId, targetId, sourceHemi, targetHemi)
%  [filename, sourceMask, targetMask] = findAllenConnectome(___)
%
%
%% Description
% `filename = findAllenConnectome(sourceId, targetId, sourceHemi,
% targetHemi)` finds the filename for connectivity data between two
% specified brain regions in the Allen Mouse Brain Atlas, after it has been
% downloaded from python.
%
% `[filename, sourceMask, targetMask] = findAllenConnectome(___)` also
% returns binary masks for the source and target brain regions at a fixed
% resolution of 100 microns.
%
%
%% Input Arguments
% `sourceId - ID of the source brain region (integer)`
%
% `targetId - ID of the target brain region (integer)`
%
% `sourceHemi - Hemisphere of the source region (1 = Left, 2 = Right, 3 = Both)`
%
% `targetHemi - Hemisphere of the target region (1 = Left, 2 = Right, 3 = Both)`
%
%
%% Output Arguments
% `filename - Full path to the connectivity data file (character vector)`
%
% `sourceMask - Mask for the source brain region (logical array)`
%
% `targetMask - Mask for the target brain region (logical array)`
%
%
%% Usage Notes
% * The resolution of the connectivity data is fixed at 100 microns.
%
%
%% Authors
% Mehul Gajwani, Monash University, 2025
%
%
%% See also
% getAllenStructure, importAllenConnectome
%
%

res = 100; % only implementation by Allen
hl = ["L","R","B"]; % hemisphere letter

filename = fullfile(getMouselabDir(), 'connectivity', ...
    sprintf('source-knox2018_desc-MouseConnectivity_space-ccf%i%sto%i%s_res-%ium_feature.h5', ...
    sourceId, hl(sourceHemi), targetId, hl(targetHemi), res));

sourceMask = getAllenStructure(sourceId, res, sourceHemi);
targetMask = getAllenStructure(targetId, res, targetHemi);


end
