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
%    none
%
% Other m-files required: myPoly.m, dmyPoly.m, myNewton.m, numDiff.m
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
[root1, abortFlag1, i1] = myNewton('function', @myPoly, 'derivative', @dmyPoly, 'startValue', 5, 'livePlot', 'on');

%% Mit numerischem Differenzieren
[root2, abortFlag2, i2] = myNewton('function', @myPoly, 'startValue', 5, 'livePlot', 'on');
%------------- END OF CODE -------------