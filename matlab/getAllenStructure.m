function V = getAllenStructure(structureId, res, hemi)
if nargin<1||isempty(structureId); structureId = 997; end
if nargin<2||isempty(res);                 res = 100; end
if nargin<3||isempty(hemi);               hemi = 3;   end
V = nrrdread(findAllenStructure(structureId, res)); 
V = V.*cast(getAllenHMask(res,hemi),'like',V); 
end
