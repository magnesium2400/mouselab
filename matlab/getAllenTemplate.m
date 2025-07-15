function V = getAllenTemplate(type, res, hemi)
if nargin<1 || isempty(type);   type = 'annotation';    end
if nargin<2 || isempty(res);    res = 100;              end
if nargin<3 || isempty(hemi);   hemi = 3;               end
V = nrrdread(findAllenTemplate(type, res)); 
V = V.*cast(getAllenHMask(res,hemi),'like',V); 
end
