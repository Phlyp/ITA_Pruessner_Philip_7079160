function dy = numDiff(func, x, Method)
%% FUNCTION_NAME - numDiff
%
% Description: Function to calculate the derivative of a function using 
% the process of numerical differentiation. 
%
% Assumptions: 
%
% Syntax:  dy = numDiff(@poly, x, Method)
%
% Inputs:
%    @poly - function to calculate the derivative of
%    x - value to calculate the derivative at
%    Method - Method used in the numerical differentiation calculation. Must
%    be either "Forwards", "Backwards" or "Central"
%
% Outputs:
%    dy - derivative of poly at the location x
%
% Other m-files required: myPoly.m
% Subfunctions: none
% MAT-files required: none
%
% See also: myPoly.m, myNewton.m
%
% $Revision: R2022a
% $Author: Philip Pruessner
% $Date: April 03, 2022

%------------- BEGIN CODE --------------
    
    hVor = 10.^(-8);
    hZen = 10.^(-6);
    
    switch Method
        case "Forwards"
            dy = (func(x+hVor) - func(x))/hVor;
        case "Backwards"
            dy = (func(x)-func(x-hVor))/hVor;
        case "Central"
            dy = (func(x+hZen)-func(x-hZen))/(2*hZen);
        otherwise
            error('invalid Method input %s', Method);
    end
%------------- END OF CODE -------------
end