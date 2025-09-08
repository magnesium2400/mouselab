function [Vdownsampled, Vresampled] = downsampleAllenVolume(V, ratio, fillVal)
% The Allen downsampling always starts from the 1st index (in PIR format).
% See `demo_downsampling.m` for examples/validation. 
% 
% Vdownsampled is every nth slice of V (in every dimension)
% Vresampled   is has the nth slices of V kept, and the other elements set
% to 0
%% Examples
%   V = getAllenStructure(703,50,2); 
%
%

if nargout>1 && (nargin<3||isempty(fillVal)); fillVal = NaN; end

idx = arrayfun(@(x) 1:ratio:x, size(V), 'Uni', 0);
Vdownsampled = V(idx{:});  
if nargout==1; return; end

Vresampled = onesz(V)*fillVal; 
Vresampled(idx{:}) = V(idx{:}); 

end
