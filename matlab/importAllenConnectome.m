function [W,sourceIdx,targetIdx] = importAllenConnectome(sourceId, targetId, sourceHemi, targetHemi)
%% importAllenConnectome Loads connectome weights after downloading from python
%% Syntax
%  W = importAllenConnectome(sourceId, targetId, sourceHemi, targetHemi) [W,
%  sourceIdx, targetIdx] = importAllenConnectome(___)
% 
% 
%% Description
% `W = importAllenConnectome(sourceId, targetId, sourceHemi, targetHemi)` loads
% the connectome weights for the specified source and target structure IDs and
% hemispheres.
% 
% `[W, sourceIdx, targetIdx] = importAllenConnectome(___)` also returns the
% voxel indices for the source and target masks in PIR orientation.
% 
% 
%% Examples
%   W = importAllenConnectome(184, 184, 2, 3); 
%   W = importAllenConnectome(184, 184, 2, 2); 
%   [W, sIdx, tIdx] = importAllenConnectome(184, 184, 2, 2);
% 
% 
%% Input Arguments
% `sourceId - source structure ID (numeric scalar)` Allen structure ID for the
% source region.
% 
% `targetId - target structure ID (numeric scalar)` Allen structure ID for the
% target region.
% 
% `sourceHemi - source hemisphere selector (3 (default) | 1 | 2)` 1 for left, 2
% for right, 3 for both hemispheres.
% 
% `targetHemi - target hemisphere selector (3 (default) | 1 | 2)` 1 for left, 2
% for right, 3 for both hemispheres.
% 
% 
%% Output Arguments
% `W - connectome weight matrix (numeric array)` Matrix of connection weights
% from source to target voxels.
% 
% `sourceIdx - source voxel indices (numeric array)` Indices of source voxels in
% PIR orientation.
% 
% `targetIdx - target voxel indices (numeric array)` Indices of target voxels in
% PIR orientation.
% 
% 
%% Authors
% Mehul Gajwani, Monash University, 2025
% 
% 
%% See also
% findAllenConnectome, getAllenStructure
%
%


%% Get data
[filename, sourceMask, targetMask] = ...
    findAllenConnectome(sourceId, targetId, sourceHemi, targetHemi);

%% Get indices for re-ordering
w = warning('query', 'nihelp:rotateVolume:OddChanges'); 
warning('off', 'nihelp:rotateVolume:OddChanges'); 
sourceIdx = unrotateVolumeIdx(sourceMask, 'rip', 'pir'); 
targetIdx = unrotateVolumeIdx(targetMask, 'rip', 'pir'); 
warning(w); 

%% Reorder, transpose and output
W = h5read(filename, '/W'); 
W = W(targetIdx, sourceIdx)'; 

end

% sourcev = V2v(sourceMask, getAllenTform(res), 1); targetv = V2v(targetMask,
% getAllenTform(res), 1);