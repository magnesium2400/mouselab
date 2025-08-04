function out = getMouselabDir()
out = fileparts(which('mouselab.m'));
out = out(1:end-6); 
% setenv('MOUSELAB', out); 
end
