function p = findAllenStructure(structureId, res)
% FINDALLENSTRUCTURE retrieves the file path for the specified Allen structure mask.
% 
% Inputs:
%   structureId - Integer representing the ID of the structure.
%   res - Integer representing the resolution level.
%
% Outputs:
%   p - String containing the full file path to the structure mask.
%
% Example:
%   p = findAllenStructure(123, 1);
%   This would return the path to the structure mask for structure ID 123 at resolution 1.
m = getMouselabDir(); 
p = fullfile(m, 'annotation', 'ccf_2017', 'structure_masks', ...
    sprintf('resolution_%i', res), sprintf('structure_%i.nrrd', structureId));

if ~exist(p, 'file')
    warning("Structure mask not detected. Considering running \n" + ...
        "`mouselab.download_structure_mask(structure_id=%i, resolution=%i)`.", ...
        structureId, res);
end

end
