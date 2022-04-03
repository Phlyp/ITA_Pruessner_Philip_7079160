function xZero = myNewton(varargin)
%% FUNCTION_NAME - myNewton
%
% Description: This function uses the Newton-Rhapson method to calculate
% the root of a function. It requires a function to be passed as an
% argument and optionally accepts the manual derivative of that function. If
% no derivative is given, it asks for a method using a dialogue box to 
% calculate the numerical differentiation and then uses that process instead
%
% Assumptions: None
%
% Syntax:  xZero = myNewton(@poly, optional: @dPoly)
%
% Inputs:
%    @poly - function to calculate the root of
%    optional: @dPoly - optional parameter to manually define the derivative
%    of poly
%
% Outputs:
%    xZero - root of the function poly
%
% Other m-files required: numDiff.m, myPoly.m, dmyPoly.m
% Subfunctions: numDiff.m
% MAT-files required: none
%
% See also: myPoly.m, dmyPoly.m, numDiff.m
%
% $Revision: R2022a
% $Author: Philip Pruessner
% $Date: April 03, 2022

%------------- BEGIN CODE --------------
    
    xStart = 5;
    maxIter = 50;
    xOld = xStart;

    func = varargin{1};
    if nargin > 1
        dfunc = varargin{2};
        for i = 1:maxIter
            f = func(xOld);
            df = dfunc(xOld);
            xNew = xOld - (f/df);
            xOld = xNew;
        end
    else 
        method = questdlg("Choose a method to differentiate", "Diff. Method", ...
            "Forwards", "Backwards", "Central", "Forwards");
        for i = 1:maxIter
            f = func(xOld);
            df = numDiff(func, xOld, method);
            xNew = xOld - (f/df);
            xOld = xNew;
        end
    end

    xZero = xOld;
%------------- END OF CODE -------------
end 