%% Test type
getAllenTemplate(); 
getAllenTemplate('ara_nissl'); 
getAllenTemplate('annotation'); 
getAllenTemplate('average_template'); 
%% Test resolution
getAllenTemplate('ara_nissl',  50); 
getAllenTemplate('ara_nissl', 100); 
getAllenTemplate('annotation',  50); 
getAllenTemplate('annotation', 100); 
getAllenTemplate('average_template',  50); 
getAllenTemplate('average_template', 100); 
%% Test hemi
getAllenTemplate('annotation',  50, 1); 
getAllenTemplate('annotation',  50, 2); 
getAllenTemplate('annotation',  50, 3); 
getAllenTemplate('annotation', 100, 1); 
getAllenTemplate('annotation', 100, 2); 
getAllenTemplate('annotation', 100, 3); 
