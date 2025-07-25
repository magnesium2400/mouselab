function [V, dataInfoTable] = getAllenSet(setId, res, hemi)
% Documentation for the getAllenSet function
% 
% This function retrieves and processes data from the Allen Brain Atlas 
% based on the specified set ID, resolution, and hemisphere.
%
% Inputs:
%   setId - (optional) Identifier for the specific dataset to retrieve. 
%           Default is 2 if not provided.
%   res   - (optional) Resolution of the data to retrieve. 
%           Default is 100 if not provided.
%   hemi  - (optional) Hemisphere to consider in the data processing. 
%           Default is 3 (which may represent both hemispheres) if not provided.
%
% Outputs:
%   V             - A matrix representing the processed data from the Allen 
%                   Brain Atlas, where each element corresponds to a specific 
%                   structure ID.
%   dataInfoTable - A table containing metadata about the dataset, including 
%                   structure IDs and other relevant information.
%
% Example usage:
%   [V, dataInfoTable] = getAllenSet(1, 200, 1);
%
% Note:
%   Ensure that the JSON file at the path returned by findAllenSet is 
%   correctly formatted and accessible for successful parsing.
if nargin<1||isempty(setId); setId = 2;   end
if nargin<2||isempty(res);     res = 100; end
if nargin<3||isempty(hemi);   hemi = 3;   end

%%
p = findAllenSet(setId); 

% Prelims
dataInfo = jsondecode(fileread(p));
if ~isstruct(dataInfo)
    error('Structure information json not parsed correctly. Is the json at %s correct?', p); 
end
dataInfoTable = struct2table(dataInfo); 


%%

id = dataInfoTable{1,'id'}; 
V = double(getAllenStructure(id, res))*id; 

for ii = 2:height(dataInfoTable)
    id = dataInfoTable{ii,'id'}; 
    V2 = getAllenStructure(id,res); 
    V(logical(V2)) = id; 
end

V = V.*cast(getAllenHMask(res,hemi),'like',V); 

end
