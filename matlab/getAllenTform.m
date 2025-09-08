function out = getAllenTform(resolution)
%% getAllenTform Returns affine transformation matrix for Allen volume at given resolution
%% Syntax
%  T = getAllenTform(resolution)
% 
% 
%% Description
% `T = getAllenTform(resolution)` returns the affine transformation matrix for
% the Allen volume at the specified resolution in PIR orientation. The
% transformation is always in PIR orientation, sending the same voxel to the
% origin regardless of resolution.
% 
% 
%% Examples
%   T = getAllenTform(); 
%   T = getAllenTform(25)
% 
% 
%% Input Arguments
% `resolution - volume resolution in microns (100 (default) | numeric scalar)`
% 
% 
%% Output Arguments
% `T - affine transformation matrix (numeric array)` 4x4 matrix for scaling and
% shifting Allen volume coordinates in PIR orientation.
% 
% 
%% Usage Notes
% * The scale is dependent on the resolution; the shift is fixed for PIR
% orientation.
% * For RAS orientation, use the commented example in the code.
% 
% 
%% Authors
% Mehul Gajwani, Monash University, 2025
% 
% 
%% See also
% getAllenTemplate, rotateVolume
%
%


% scale is dependent on resolution; subsequent shift is not

% in RAS (see https://scalablebrainatlas.incf.org/mouse/ABA_v3): out =
% [eye(3,4).* resolution/1000; [-228,-313,-113,40]/40];

% in PIR (send same voxel to origin):
out = [eye(3,4).* resolution/1000; [-214,-206,-228,40]/40];

end

%% An example showing how the two function move the same voxel to the origin: 
% % % %% % % Vpir = double(getAllenTemplate(25, 'ara_nissl')); % % vpir =
% V2v(Vpir, getAllenTform(25), 1); % % dpir = nonzeros(Vpir); % % ipir =
% all(isclose(vpir,[0,0,0]),2); % % dpir(ipir) % % % % % % %% % % Vras =
% rotateVolume(Vpir, 'pir', 'ras'); % % Tras = [eye(3,4).* 25/1000;
% [-228,-313,-113,40]/40]; % % vras = V2v(Vras, Tras, 1); % % dras =
% nonzeros(Vras); % % iras = all(isclose(vras,[0,0,0]),2); % % dras(iras)

