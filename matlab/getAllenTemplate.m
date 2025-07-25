function V = getAllenTemplate(type, res, hemi)
% getAllenTemplate - Retrieves the Allen brain template based on specified parameters.
%
% Syntax:
%   V = getAllenTemplate(type, res, hemi)
%
% Inputs:
%   type - (optional) Type of template to retrieve. Default is 'annotation'.
%   res  - (optional) Resolution of the template. Default is 100.
%   hemi - (optional) Hemisphere to retrieve. Default is 3 (both hemispheres).
%
% Outputs:
%   V    - The retrieved brain template volume.
%
% Description:
%   This function reads the specified Allen brain template using the provided
%   parameters. It applies a mask to the volume based on the specified resolution
%   and hemisphere.
if nargin<1 || isempty(type);   type = 'annotation';    end
if nargin<2 || isempty(res);    res = 100;              end
if nargin<3 || isempty(hemi);   hemi = 3;               end
V = nrrdread(findAllenTemplate(type, res)); 
V = V.*cast(getAllenHMask(res,hemi),'like',V); 
