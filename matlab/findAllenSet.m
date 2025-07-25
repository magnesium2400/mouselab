function p = findAllenSet(setId)
% This function retrieves the structure set associated with a given setId.
% Input:
%   setId - An integer representing the identifier of the structure set.
% Output:
%   p - A string representing the full path to the JSON file of the structure set.
p = fullfile(getMouselabDir(), 'structures', sprintf('%i.json', setId)); 
if ~exist(p, 'file')
    warning("Structure set json not detected. Considering running \n" + ...
        "`mouselab.structure_set_info_to_json(%i)` in python.", ...
        setId);
end

end
