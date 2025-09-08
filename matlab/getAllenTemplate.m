function V = getAllenTemplate(type, res, hemi)
%% getAllenTemplate Loads the anatomical data from AIBS in CCF space
%% Syntax
%  V = getAllenStructure()
%  V = getAllenStructure(type)
%  V = getAllenStructure(type, res)
%  V = getAllenStructure(type, res, hemi)
% 
% 
%% Description
% `V = getAllenStructure(type)` retrieves the structure data for the
% given `type` at the default resolution and for both hemispheres.
% 
% `V = getAllenStructure(type, res)` retrieves the structure data at the
% specified resolution.
% 
% `V = getAllenStructure(type, res, hemi)` retrieves the structure data
% for the specified hemisphere.
% 
% 
%% Examples
%   V = getAllenStructure();
%   V = getAllenStructure('ara_nissl');
%   V = getAllenStructure('annotation', 50);
%   V = getAllenStructure('annotation', 50, 1);
%
%
%% Input Arguments
% `type - Allen Brain Atlas structure ID ('annotation' (default) | 'ara_nissl' | 'average_template')`
% 
% `res - resolution in microns (100 (default) | numeric)` 
% 
% `hemi - hemisphere selection (3 (default) | 1 | 2)` 1 for left, 2 for right, 3 for both hemispheres.
%
%
%% Authors
% Mehul Gajwani, Monash University, 2025
%
%
%% See also
% findAllenStructure, getAllenHMask
%

if nargin<1 || isempty(type);   type = 'annotation';    end
if nargin<2 || isempty(res);    res = 100;              end
if nargin<3 || isempty(hemi);   hemi = 3;               end
V = nrrdread(findAllenTemplate(type, res)); 
V = V.*cast(getAllenHMask(res,hemi),'like',V); 
end
