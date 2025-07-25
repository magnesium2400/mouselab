function out = getMouselabDir()
% Documentation for the getMouselabDir function
% 
% This function retrieves the directory path where the 'mouselab.m' file is located.
% 
% Output:
%   out - A string representing the directory path of the 'mouselab.m' file.
% 
% Usage:
%   Call this function to obtain the directory path for further use in your MATLAB scripts.

out = fileparts(which('mouselab.m'));
