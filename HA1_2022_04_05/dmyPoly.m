function dy = dmyPoly(x)
%% FUNCTION_NAME - dmyPoly
%
% Description: This is a simple MATLAB function that manually defines the 
% derivative of the mathematical Function myFunc
%
% Assumptions: The function is correctly derived from myFunc
%
% Syntax:  y = dmyPoly(x)
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
% See also: myFunc.m, runMyNewton.m
%
% $Revision: R2022a
% $Author: Philip Pruessner
% $Date: April 03, 2022

%------------- BEGIN CODE --------------
    dy = 2*(x-3);
%------------- END OF CODE -------------
end