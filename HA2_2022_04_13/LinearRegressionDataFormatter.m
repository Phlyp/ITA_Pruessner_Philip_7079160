classdef LinearRegressionDataFormatter < matlab.mixin.SetGet
%% CLASS_NAME - LinearRegressionDataFormatter
%
% Description: Class that bundles multiple functions to model and prepare the
% training data for the LinearRegressionModel object
%
% Assumptions: None
%
% Syntax:  Object = dataForLinearRegression = LinearRegressionDataFormatter('Data', data.mat,...
%    'Feature', featureName, 'CommandVar', commandVarName)
%
% Inputs:
%    data.mat - (.mat file) File containing the data to perform the linear
%    Regression on
%    featureName - (string) name of the input data in data.mat to be displayed on the
%    x-axis
%    commandVarName - (string) name of the result data in data.mat to be
%    displayed on the y-axis
%
% Outputs:
%    Object - a LinearRegressionDataFormatter Object
%
% Public properties: feature, featureName, commandVar, commandVarName, numOfSamples
%
% Private properties: data
%
% Other m-files required: none
% Public methods: none
% Private methods: mapFeature(), mapCommandVar(), mapNumOfSamples()
% MAT-files required: none
%
% See also: LinearRegressionModel.m,
% GradientDescentOptimizer.m, runScript.m, TemperatureMeasurement.mat
%
% $Revision: R2022a
% $Author: Philip Pruessner
% $Date: April 12, 2022
%------------- BEGIN CODE --------------
    properties (Access = public)
        feature
        featureName
        commandVar
        commandVarName
        numOfSamples
    end
    
    properties (Access = private)
        data
    end
    
    methods (Access = public)
        function obj = LinearRegressionDataFormatter(varargin)
            %DATAPRERPERATOR Construct an instance of this class
            
            % ========= YOUR CODE HERE =========
            % perform the varargin
            for i=1:nargin 
                if strcmp(varargin{i}, 'Data')
                    obj.data = load(varargin{i+1}).measurement;
                elseif strcmp(varargin{i}, 'Feature')
                    obj.featureName = varargin{i+1};
                elseif strcmp(varargin{i}, 'CommandVar')
                    obj.commandVarName = varargin{i+1};
                end
            end

            

            obj.mapFeature();
            obj.mapCommandVar();
            obj.mapNumOfSamples();
        end
    end
    
    methods (Access = private)
        function mapFeature(obj)
            obj.feature = obj.data.(obj.featureName);
        end
        
        function mapCommandVar(obj)
            obj.commandVar = obj.data.(obj.commandVarName);
        end
        
        function mapNumOfSamples(obj)
           obj.numOfSamples = length(obj.feature); 
        end
    end
%------------- END CODE --------------
end

