%% Check masks
res = [25,50,100]; 
sid = [997,8,512,703,1089,1097,315,313,354,698,771,803,477,549,73];
for r = res; for s = sid %#ok<ALIGN>
        p = findAllenStructure(s, r); 
        assert(~isempty(p)); 
        assert(exist(p, 'file')); 
end; end

%% Check sets
sid = [2,12,691663206,687527670,688152357]; 
arrayfun(@(s) assert(~isempty(findAllenSet(s))), sid); 

%% Check templates
res = [50,100]; 
for r = res; for s = ["annotation", "ara_nissl", "average_template"] %#ok<ALIGN>
        p = findAllenTemplate(s, r); 
        assert(~isempty(p)); 
        assert(exist(p, 'file')); 
end; end

%% Check connectome data are downloaded
d = fullfile(getMouselabDir(), 'voxel_model'); 
assert(exist(fullfile(d, "nodes.csv.gz"           ),'file'))
assert(exist(fullfile(d, "weights.csv.gz"         ),'file'))
assert(exist(fullfile(d, "source_mask_params.json"),'file'))
assert(exist(fullfile(d, "target_mask_params.json"),'file'))
