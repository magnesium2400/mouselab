function p = findAllenTemplate(type, resolution)
% FINDALLENTEMPLATE - Retrieves the file path for the specified Allen template.
%
% Syntax:
%   p = findAllenTemplate(type, resolution)
%
% Inputs:
%   type      - (string) The type of template to retrieve. Options are:
%               'ara_nissl', 'average_template', or 'annotation'.
%               Default is 'annotation'.
%   resolution - (integer) The resolution of the template. Default is 100.
%
% Outputs:
%   p        - (string) The full file path to the requested template.
%
% Description:
%   This function constructs the file path for the specified Allen template
%   based on the provided type and resolution. If the file does not exist,
%   a warning is issued suggesting the user download the template from the
%   Allen Institute's website.
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
    % for windows
    URL = strrep(['https://download.alleninstitute.org/informatics-archive/current-release/mouse_ccf/' s], '\', '/');

    websave(p, URL);
    %%https://download.alleninstitute.org/informatics-archive/current-release/mouse_ccf/ and adding to C:\Users\addo8\OneDrive\Documents\GitHub\mouselab\ara_nissl\ara_nissl_25.nrrd

end

end
