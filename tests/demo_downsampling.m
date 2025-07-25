%% Documentation for downsampling verification

% This section of code verifies the downsampling of 3D matrices obtained 
% from the function getAllenStructure. The matrices V1, V2, and V3 are 
% generated with different downsampling factors (25, 50, and 100 respectively). 
% The assertions check that:
% - V2 is a downsampled version of V1 by a factor of 2 in each dimension.
% - V3 is a downsampled version of V1 by a factor of 4 in each dimension.
% - V3 is also a downsampled version of V2 by a factor of 2 in each dimension.
%
% Additional sanity checks ensure that the downsampling is not trivially true 
% by asserting that certain slices of V1 do not equal V2, confirming that 
% the downsampling process is correctly implemented and that the matrices 
% contain distinct values in the specified slices.

%% Demonstrate downsampling starts at [1,1,1] (in PIR)
V1 = getAllenStructure(703,  25); 
V2 = getAllenStructure(703,  50); 
V3 = getAllenStructure(703, 100); 
assert(isequal(V1(1:2:end,1:2:end,1:2:end), V2))
assert(isequal(V1(1:4:end,1:4:end,1:4:end), V3))
assert(isequal(V2(1:2:end,1:2:end,1:2:end), V3))

% sanity check that it's not always trivially true
assert(~isequal(V1(2:2:end,1:2:end,1:2:end), V2))
assert(~isequal(V1(1:2:end,2:2:end,1:2:end), V2))
assert(~isequal(V1(1:2:end,1:2:end,2:2:end), V2))
assert(~isequal(V1(2:2:end,2:2:end,1:2:end), V2))
assert(~isequal(V1(1:2:end,2:2:end,2:2:end), V2))
assert(~isequal(V1(2:2:end,1:2:end,2:2:end), V2))
assert(~isequal(V1(2:2:end,2:2:end,2:2:end), V2))

disp('Tests completed');
