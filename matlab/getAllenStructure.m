function V = getAllenStructure(structureId, res, hemi)
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
