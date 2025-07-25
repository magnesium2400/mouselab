function out = getAllenTform(resolution)
% This function computes the transformation matrix for converting voxel coordinates
% from the Allen Brain Atlas (ABA) space to the specified resolution. The output
% transformation matrix is used to align and shift the coordinates appropriately 
% based on the given resolution. The function supports two coordinate systems: 
% RAS (Right-Anterior-Superior) and PIR (Postero-Inferior-Rostral).
%
% Inputs:
%   resolution - A scalar value representing the desired resolution in micrometers.
%
% Outputs:
%   out - A 4x4 transformation matrix that includes a scaling factor based on the 
%         resolution and a translation vector that shifts the origin to the 
%         specified coordinates in the PIR system.
%
% Example usage:
%   tform = getAllenTform(25);
%   % This will return the transformation matrix for a resolution of 25 micrometers.

% scale is dependent on resolution; subsequent shift is not

% in RAS (see https://scalablebrainatlas.incf.org/mouse/ABA_v3):
% out = [eye(3,4).* resolution/1000; [-228,-313,-113,40]/40];

% in PIR (send same voxel to origin): 
out = [eye(3,4).* resolution/1000; [-214,-206,-228,40]/40];

end

%% An example showing how the two function move the same voxel to the origin: 
% % % %%
% % % Vpir = double(getAllenTemplate(25, 'ara_nissl'));
% % % vpir = V2v(Vpir, getAllenTform(25), 1); 
% % % dpir = nonzeros(Vpir);
% % % ipir = all(isclose(vpir,[0,0,0]),2);
% % % dpir(ipir)
% % % 
% % % 
% % % %%
% % % Vras = rotateVolume(Vpir, 'pir', 'ras');
% % % Tras = [eye(3,4).* 25/1000; [-228,-313,-113,40]/40];
% % % vras = V2v(Vras, Tras, 1); 
% % % dras = nonzeros(Vras); 
% % % iras = all(isclose(vras,[0,0,0]),2);
% % % dras(iras)

