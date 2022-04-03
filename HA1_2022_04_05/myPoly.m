function y = myPoly(x)
%% FUNCTION_NAME - myPoly
%
% Description: This is a simple MATLAB function that defines a mathematical
% function
%
% Assumptions: None
%
% Syntax:  y = myPoly(x)
%
% Inputs:
%    x - double value to calculate function value at
%
% Outputs:
%    y - result of function call at the location x (as double value)
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: runMyNewton.m
%
% $Revision: R2022a
% $Author: Philip Pruessner
% $Date: April 03, 2022

%------------- BEGIN CODE --------------
    y = (x-3).^2;
%------------- END OF CODE -------------
end