function [W,sourceIdx,targetIdx] = importAllenConnectome(sourceId, targetId, sourceHemi, targetHemi)
%% Documentation
% This function imports the Allen Connectome data based on specified source 
% and target IDs, as well as their respective hemispheres. It retrieves the 
% necessary data files, processes the source and target masks to obtain 
% indices for reordering, and finally reads and rearranges the connectivity 
% matrix W accordingly.
%
% Inputs:
%   sourceId   - Identifier for the source region
%   targetId   - Identifier for the target region
%   sourceHemi - Hemisphere of the source region ('L' for left, 'R' for right)
%   targetHemi - Hemisphere of the target region ('L' for left, 'R' for right)
%
% Outputs:
%   W          - Reordered connectivity matrix
%   sourceIdx  - Indices corresponding to the source region
%   targetIdx  - Indices corresponding to the target region

%% Get data
[filename, sourceMask, targetMask] = ...
    findAllenConnectome(sourceId, targetId, sourceHemi, targetHemi);

%% Get indices for re-ordering
sourceIdx = unrotateVolumeIdx(sourceMask, 'rip', 'pir'); 
targetIdx = unrotateVolumeIdx(targetMask, 'rip', 'pir'); 

%% Reorder, transpose and output
W = h5read(filename, '/W'); 
W = W(targetIdx, sourceIdx)'; 

% sourcev = V2v(sourceMask, getAllenTform(res), 1); 
% targetv = V2v(targetMask, getAllenTform(res), 1); 