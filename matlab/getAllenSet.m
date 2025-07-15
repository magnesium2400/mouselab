function [V, dataInfoTable] = getAllenSet(setId, res, hemi)

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
