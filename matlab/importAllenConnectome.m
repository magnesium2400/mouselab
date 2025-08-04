function [W,sourceIdx,targetIdx] = importAllenConnectome(sourceId, targetId, sourceHemi, targetHemi)

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

% sourcev = V2v(sourceMask, getAllenTform(res), 1); 
% targetv = V2v(targetMask, getAllenTform(res), 1); 