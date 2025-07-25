function V = getAllenStructure(structureId, res, hemi)

% Documentation for the getAllenStructure function
% 
% This function retrieves the Allen brain structure data for a specified
% structure ID, resolution, and hemisphere.
%
% Inputs:
%   structureId - (optional) The ID of the brain structure to retrieve.
%                 Default is 997.
%   res         - (optional) The resolution of the data to retrieve.
%                 Default is 100.
%   hemi        - (optional) The hemisphere to retrieve data for.
%                 1 = left, 2 = right, 3 = both. Default is 3.
%
% Outputs:
%   V          - A 3D matrix containing the brain structure data.
%
% Example:
%   V = getAllenStructure(997, 100, 3);
%
% Note:
%   The function uses nrrdread to read the data and applies a mask
%   obtained from getAllenHMask to the retrieved data.
 
if nargin<1||isempty(structureId); structureId = 997; end
if nargin<2||isempty(res);                 res = 100; end
if nargin<3||isempty(hemi);               hemi = 3;   end
V = nrrdread(findAllenStructure(structureId, res)); 
V = V.*cast(getAllenHMask(res,hemi),'like',V); 
