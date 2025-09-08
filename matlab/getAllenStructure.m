function V = getAllenStructure(structureId, res, hemi)
%% getAllenStructure Get structure volume/mask in CCF space
%% Syntax
%  V = getAllenStructure(structureId)
%  V = getAllenStructure(structureId, res)
%  V = getAllenStructure(structureId, res, hemi)
% 
% 
%% Description
% `V = getAllenStructure(structureId)` retrieves the structure data for the
% given `structureId` at the default resolution and for both hemispheres.
% 
% `V = getAllenStructure(structureId, res)` retrieves the structure data at the
% specified resolution.
% 
% `V = getAllenStructure(structureId, res, hemi)` retrieves the structure data
% for the specified hemisphere.
% 
% 
%% Examples
%   V = getAllenStructure(997);
%   V = getAllenStructure(997, 50);
%   V = getAllenStructure(997, 50, 1);
%
%
%% Input Arguments
% `structureId - Allen Brain Atlas structure ID (997 (default) | positive integer scalar)`
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
%


if nargin<1||isempty(structureId); structureId = 997; end
if nargin<2||isempty(res);                 res = 100; end
if nargin<3||isempty(hemi);               hemi = 3;   end

% Override warnings
ws = "medical:medicalVolume:noEndian"; 
w = warning("query", ws); 
warning("off", ws); 

% Get data and reset warnings
V = nrrdread(findAllenStructure(structureId, res)); 
V = V.*cast(getAllenHMask(res,hemi),'like',V); 
warning(w.state, ws); 

end
