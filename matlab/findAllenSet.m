function filename = findAllenSet(setId)
%% findAllenSet Finds the path to a structure set JSON file
%% Syntax
%  filename = findAllenSet(setId)
%
%
%% Description
% `filename = findAllenSet(setId)` generates the full path to a structure set
% JSON file based on the provided `setId`.
%
%
%% Examples
%   p = findAllenSet(2)
%   p = findAllenSet(688152357)
%
%
%% Input Arguments
% `setId - ID of the structure set (integer)` The unique identifier for the
% structure set whose JSON file path is to be retrieved.
%
%
%% Output Arguments
% `filename - Path to the structure set JSON file (character vector)` The full
% path to the JSON file corresponding to the specified `setId`.
%
%
%% Usage Notes
% * If the file does not exist, a warning is issued with a suggestion to
%   generate the file using Python.
%
%
%% Authors
% Mehul Gajwani, Monash University, 2025
%
%
%% See also
% getAllenSet
%
%

filename = fullfile(getMouselabDir(), 'structures', sprintf('%i.json', setId));
if ~exist(filename, 'file')
    warning("Structure set json not detected. Considering running \n" + ...
        "`mouselab.structure_set_info_to_json(%i)` in python.", ...
        setId);
end

end
