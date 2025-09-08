function filename = findAllenTemplate(type, resolution)
%% findAllenTemplate Finds the path to Allen Institute template files
%% Syntax
%  filename = findAllenTemplate(type)
%  filename = findAllenTemplate(type, resolution)
% 
% 
%% Description
% `filename = findAllenTemplate(type)` returns the local path to the template
% file from the AIBS of the specified type.
% 
% `filename = findAllenTemplate(type, resolution)` additionally specifies the
% resolution of the template file.
% 
% 
%% Examples
%   filename = findAllenTemplate('annotation')
%   filename = findAllenTemplate('average_template', 50)
%   filename = findAllenTemplate('ara_nissl', 100)
%
%
%% Input Arguments
% `type - type of template file ('annotation' (default) | 'ara_nissl' |
% 'average_template')` Specifies the type of template file.
%
% `resolution - resolution of the template file (100 (default) | numeric
% scalar)` Specifies the resolution of the template file in microns.
% 
% 
%% Usage Notes
% * If the requested file does not exist, a warning is issued with a suggested
% URL to download the file.
%
%
%% Authors
% Mehul Gajwani, Monash University, 2025
%
%
%% See also
% getAllenTemplate
%
%

    
if nargin<1 || isempty(type);       type = 'annotation'; end
if nargin<2 || isempty(resolution); resolution = 100; end


filename = getMouselabDir();

switch type
    case {'ara_nissl', 'average_template'}
        s = fullfile(type, sprintf('%s_%i.nrrd', type, resolution)); 
    case 'annotation'
        s = fullfile('annotation', 'ccf_2017', sprintf('annotation_%i.nrrd', resolution)); 
    otherwise
        error('type must be "ara_nissl", "average_template", or "annotation"');
end

filename = fullfile(filename, s);

if ~exist(filename, 'file')
    warning("Template data not detected. Considering downloading from \n" + ...
        "https://download.alleninstitute.org/informatics-archive/current-release/mouse_ccf/%s \n" + ...
        "and adding to %s", s, filename);
end

end
