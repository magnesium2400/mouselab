function p = findAllenStructure(structureId, res)

m = getMouselabDir(); 
p = fullfile(m, 'annotation', 'ccf_2017', 'structure_masks', ...
    sprintf('resolution_%i', res), sprintf('structure_%i.nrrd', structureId));

if ~exist(p, 'file')
    warning("Structure mask not detected. Considering running \n" + ...
        "`mouselab.download_structure_mask(structure_id=%i, resolution=%i)`.", ...
        structureId, res);
end

end
