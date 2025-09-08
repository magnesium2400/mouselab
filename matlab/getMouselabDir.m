function dirpath = getMouselabDir()
%% getMouselabDir Returns the root directory of the mouselab repository
%% Syntax
%  dirpath = getMouselabDir()
% 
% 
%% Description
% `dirpath = getMouselabDir()` returns the root directory path as a character
% vector.
% 
% 
%% Examples
%   dirpath = getMouselabDir()
% 
% 
%% Output Arguments
% dirpath - mouselab repository root directory (character vector)`
% 
% 
%% Authors
% Mehul Gajwani, Monash University, 2025
% 
% 

dirpath = fileparts(which('mouselab.m'));
dirpath = dirpath(1:end-6); 
% setenv('MOUSELAB', out);
end
