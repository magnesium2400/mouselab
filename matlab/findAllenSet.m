function p = findAllenSet(setId)

p = fullfile(getMouselabDir(), 'structures', sprintf('%i.json', setId)); 
if ~exist(p, 'file')
    warning("Structure set json not detected. Considering running \n" + ...
        "`mouselab.structure_set_info_to_json(%i)` in python.", ...
        setId);
end

end
