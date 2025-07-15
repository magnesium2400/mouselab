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


