function filename = findAllenStructure(structureId, res)
%% findAllenStructure Finds the file path for an Allen Brain Atlas structure mask
%% Syntax
%  filename = findAllenStructure(structureId, res)
% 
% 
%% Description
% `filename = findAllenStructure(structureId, res)` generates the file path for
% a specific Allen Brain Atlas structure mask based on the provided structure ID
% and resolution.
% 
% 
%% Examples
%   filename = findAllenStructure(997, 100)
%   filename = findAllenStructure(8, 50)
%
%
%% Input Arguments
% `structureId - ID of the structure (integer)` The unique identifier for the
% structure in the Allen Brain Atlas.
% 
% `res - resolution (integer)` The resolution of the structure mask in microns.
% 
% 
%% Output Arguments
% `filename - file path (character vector)` The full file path to the structure
% mask file.
% 
% 
%% Usage Notes
% * If the file does not exist, a warning is issued suggesting the use of
%   `mouselab.download_structure_mask` to download the required file.
%
%
%% Authors
% Mehul Gajwani, Monash University, 2025
%
%
%% See also
% getMouselabDir, mouselab.download_structure_mask
%
%

filename = fullfile(getMouselabDir(), 'annotation', 'ccf_2017', 'structure_masks', ...
    sprintf('resolution_%i', res), sprintf('structure_%i.nrrd', structureId));

if ~exist(filename, 'file')
    warning("Structure mask not detected. Considering running \n" + ...
        "`mouselab.download_structure_mask(structure_id=%i, resolution=%i)`.", ...
        structureId, res);
end

end
