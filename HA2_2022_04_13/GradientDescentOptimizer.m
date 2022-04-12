classdef GradientDescentOptimizer < matlab.mixin.SetGet
%% CLASS_NAME - GradientDescentOptimizer
%
% Description: Class that bundles multiple functions to train the linear
% regression model
%
% Assumptions: None
%
% Syntax:  Object = GradientDescentOptimizer('LearningRate', learningRate, 'MaxIterations', maxIterations)
%
% Inputs:
%    learningRate - (double) the learningRate (alpha) to use when training the model
%    maxIterations - (double) the maximum number of times to iterate over the training model
%
% Outputs:
%    Object - a GradientDescentOptimizer Object
%
% Public properties: none
%
% Private properties: costHistory, learningRate, maxIterations
%
% Other m-files required: LinearRegressionModel.m
% Public methods: runTraining(linearRegressionModel), showTrainingResult(),
% setLearningRate(learningRate), setMaxNumberOfIterations(maxIterations)
% Private methods: getLocalsForTraining(linearRegressionModel)
% MAT-files required: none
%
% See also: LinearRegressionDataFormatter.m,
% LinearRegressionModel.m, runScript.m
%
% $Revision: R2022a
% $Author: Philip Pruessner
% $Date: April 12, 2022
%------------- BEGIN CODE --------------
      
    properties (Access = private)
        costHistory
        learningRate
        maxIterations
    end
    
    methods (Access = public)
        function obj = GradientDescentOptimizer(varargin)
            %GRADIENTDESCENTOPTIMIZER Construct an instance of this class            
          
            % ========= YOUR CODE HERE =========
            % perform the varargin
            for i=1:nargin
                if strcmp(varargin{i}, 'LearningRate')
                    obj.learningRate = varargin{i+1};
                elseif strcmp(varargin{i}, 'MaxIterations')
                    obj.maxIterations = varargin{i+1};
                end
            end
            
        end

        function h = runTraining(obj, linearRegressionModel)
            [alpha,maxIters,theta,X,y,m,costOverIters] = obj.getLocalsForTraining(linearRegressionModel);
                      
            % ========= YOUR CODE HERE =========
            % perform the optimization (by debugging please check the purpose of local variable X)
            % loop over theta-update-rule (maxIters):
            %   vectorized updaterule can be implemented in one line of code
            %   update theta property of linearRegressionModel (we want to call the cost function in the next step)
            %   compute current costs and save them to costOverIters
            % end
            for i=1:maxIters
                theta = theta - (alpha/m) * (X' * (linearRegressionModel.hypothesis() - y));
                linearRegressionModel.setTheta(theta(1), theta(2));
                costOverIters(i) = linearRegressionModel.costFunction();
            end

            
            obj.costHistory = costOverIters;
            linearRegressionModel.setThetaOptimum(theta(1),theta(2));
            h = obj.showTrainingResult();
            disp("final costs for theta = [" + linearRegressionModel.thetaOptimum(1) + ";" ...
                + linearRegressionModel.thetaOptimum(2) + "]: " + linearRegressionModel.costFunction());
        end
        
        function h = showTrainingResult(obj)
           h = figure('Name','Costs over Iterations during training');
           plot(obj.costHistory,'x-');
           xlabel('Iterations'); ylabel('costs');
           grid on;
           xlim([2500 obj.maxIterations]);
        end
        
        function setLearningRate(obj, alpha)
           obj.learningRate = alpha;
        end
        
        function setMaxNumOfIterations(obj, maxIters)
            obj.maxIterations = maxIters;
        end
    
    end
    
    methods (Access = private) 
       function [alpha,maxIters,theta,X,y,m,costOverIters] = getLocalsForTraining(obj,linearRegressionModel)
            m = linearRegressionModel.trainingData.numOfSamples;
            theta = linearRegressionModel.theta;
            X = [ones(m,1) linearRegressionModel.trainingData.feature];
            alpha = obj.learningRate;
            y = linearRegressionModel.trainingData.commandVar;
            costOverIters = zeros(obj.maxIterations, 1);
            maxIters = obj.maxIterations;
        end 
    end
%------------- END CODE --------------
end

