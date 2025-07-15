function out = getMouselabDir()
out = fileparts(which('mouselab.m'));
% setenv('MOUSELAB', out); 
end
