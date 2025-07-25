% Documentation for the getAllenSet_test function
% 
% Function Name: getAllenSet_test
%
% Example Calls:
%   V = getAllenSet();                % Retrieves default data set
%   V = getAllenSet(687527670);       % Retrieves data set for the specified id
%   V = getAllenSet(2,50);            % Retrieves data set for id 2 with range 50
%   V = getAllenSet(2,100);           % Retrieves data set for id 2 with range 100
%   V = getAllenSet(688152357,100,1); % Retrieves data set for id 688152357 with range 100 and option 1
%   V = getAllenSet(688152357,100,2); % Retrieves data set for id 688152357 with range 100 and option 2
%   V = getAllenSet(688152357,100,3); % Retrieves data set for id 688152357 with range 100 and option 3

echo on
V = getAllenSet();
V = getAllenSet(687527670);
V = getAllenSet(2,50);
V = getAllenSet(2,100);
V = getAllenSet(688152357,100,1); 
V = getAllenSet(688152357,100,2); 
V = getAllenSet(688152357,100,3);
echo off
disp('tests completed');
