%% SCRIPT_NAME - runMyNewton
%
% Description: This is a simple execution script to run and test the
% myNewton function. It has two sections, one to execute myNewton with a
% function myFunc and a manually derived function dmyFunc, the other to 
% execute myNewton with only myFunc
%
% Assumptions: None
%
% Syntax:  None
%
% Inputs:
%    None
%
% Outputs:
%    root1 - execute myNewton using the function myFunc and its manually 
%    derived function dmyFunc
%    root2 - execute myNewton using only the function myFunc
%
% Other m-files required: myFunc.m, dmyFunc.m, myNewton.m, numDiff.m
% Subfunctions: none
% MAT-files required: none
%
% See also: myFunc.m, dmyFunc.m, myNewton.m
%
% $Revision: R2022a
% $Author: Philip Pruessner
% $Date: April 03, 2022

%------------- BEGIN CODE --------------
%% Mit gegebener Ableitung
root1 = myNewton(@myPoly, @dmyPoly);

%% Mit numerischem Differenzieren
root2 = myNewton(@myPoly);
%------------- END OF CODE -------------