% This function retrieves the Allen structure data based on specified parameters.
% The function can be called with varying numbers of arguments to obtain different datasets.
%
% Usage:
% V = getAllenStructure();          % Retrieves default dataset
% V = getAllenStructure(id);       % Retrieves dataset for specified id
% V = getAllenStructure(id, size); % Retrieves dataset for specified id and size
% V = getAllenStructure(id, size, type); % Retrieves dataset for specified id, size, and type
%
% Inputs:
%   id   - (optional) Identifier for the dataset
%   size - (optional) Size of the dataset to retrieve
%   type - (optional) Type of dataset to retrieve (1, 2, or 3)
%
% Outputs:
%   V    - Structure containing the retrieved dataset

V = getAllenStructure(); 
V = getAllenStructure(997); 
V = getAllenStructure(315,50); 
V = getAllenStructure(315,100); 
V = getAllenStructure(703,100,1); 
V = getAllenStructure(703,100,2); 
V = getAllenStructure(703,100,3); 

disp('Tests completed');