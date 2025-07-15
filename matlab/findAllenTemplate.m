function p = findAllenTemplate(type, resolution)

if nargin<1 || isempty(type);       type = 'annotation'; end
if nargin<2 || isempty(resolution); resolution = 100; end


p = getMouselabDir();

switch type
    case {'ara_nissl', 'average_template'}
        s = fullfile(type, sprintf('%s_%i.nrrd', type, resolution)); 
    case 'annotation'
        s = fullfile('annotation', 'ccf_2017', sprintf('annotation_%i.nrrd', resolution)); 
    otherwise
        error('type must be "ara_nissl", "average_template", or "annotation"');
end

p = fullfile(p, s);

if ~exist(p, 'file')
    warning("Template data not detected. Considering downloading from \n" + ...
        "https://download.alleninstitute.org/informatics-archive/current-release/mouse_ccf/ and adding to %s", p);
end

end
