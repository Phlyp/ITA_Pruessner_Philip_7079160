classdef LinearRegressionModel < matlab.mixin.SetGet
%% CLASS_NAME - LinearRegressionModel
%
% Description: Class that bundles multiple functions to visualize the
% linear Regression Process 
%
% Assumptions: None
%
% Syntax:  Object = LinearRegressionModel('Data', dataForLinearRegression,'Optimizer', gradientDescentOptimizer)
%
% Inputs:
%    dataForLinearRegression -  a LinearRegressionDataFormatter Object
%    containing the data to perform the linear regression
%    gradientDescentOptimizer - a GradientDescentOptimizer Object
%    containing the parameters and functions to perform the linear
%    regression
%
% Outputs:
%    Object - a LinearRegressionModel Object
%
% Public properties: optimizer, trainingData, theta, thetaOptimum
%
% Private properties: none
%
% Other m-files required: LinearRegressionDataFormatter.m,
% GradientDescentOptimizer.m
% Public methods: costFunction(), hypothesis(), showOptimumInContour(),
% showCostFunctionArea(), showTrainingData(), showModel(), setTheta(theta0,
% theta1), setThetaOptimum(theta0, theta1)
% Private methods: initializeTheta()
% MAT-files required: none
%
% See also: LinearRegressionDataFormatter.m,
% GradientDescentOptimizer.m, runScript.m
%
% $Revision: R2022a
% $Author: Philip Pruessner
% $Date: April 12, 2022
%------------- BEGIN CODE --------------
    
    properties (Access = public)
        optimizer
        trainingData
        theta
        thetaOptimum
    end
    
    methods (Access = public)
        function obj = LinearRegressionModel(varargin)
            %LINEARREGRESSIONMODEL Construct an instance of this class
            
            % ========= YOUR CODE HERE =========
            % perform the varargin
             for i=1:nargin
                if strcmp(varargin{i}, 'Data')
                    obj.trainingData = varargin{i+1};
                elseif strcmp(varargin{i}, 'Optimizer')
                    obj.optimizer = varargin{i+1};
                end
            end
            
            obj.initializeTheta();
        end
        
        function J = costFunction(obj)
            m = obj.trainingData.numOfSamples; 
            
            % ========= YOUR CODE HERE =========
            % compute the costs
            % therefore use the hypothesis function as well
            % this calculation can be done by one line of code
            % returns the cost value J
            k = 1:m;
            h = obj.hypothesis();
            J = 1/(2*m) * sum((h-obj.trainingData.commandVar(k)).^2);
            
        end
        
        function hValue = hypothesis(obj)
            X = [ones(obj.trainingData.numOfSamples,1) obj.trainingData.feature];
            
            % ========= YOUR CODE HERE =========
            % compute the hypothesis values for each sample
            % therefore compute the matrix multiplication with X
            % this calculation can be done by one line of code
            hValue = X*obj.theta;
        end
        
        function h = showOptimumInContour(obj)
            h = figure('Name','Optimum');
            theta0_vals = linspace(50, 150, 100);
            theta1_vals = linspace(0, 2, 100);
            
            % ========= YOUR CODE HERE =========
            % compute the costs for each theta_vals tuple
            % plot the costs with the contour command
            % add x and y label
            % add the optimum theta value to the plot (red X, MarkerSize: 10, LineWidth: 2)
            obj.setTheta(theta0_vals, theta1_vals);
            [X,Y] = meshgrid(theta0_vals, theta1_vals);
            Z = zeros(length(theta0_vals), length(theta1_vals));
            for i=1:length(theta1_vals)
                for j=1:length(theta0_vals)
                    obj.setTheta(theta0_vals(j), theta1_vals(i));
                    Z(i,j) = obj.costFunction();
                end
            end
            contour(X,Y,Z);
            xlabel('\theta_{0}');
            ylabel('\theta_{1}');
            hold on;
            plot(obj.thetaOptimum(1), obj.thetaOptimum(2), "rx", "MarkerSize", 10, "LineWidth", 2);
            hold off;

            
        end
        
        function h = showCostFunctionArea(obj)
            h = figure('Name','Cost Function Area');
            theta0_vals = linspace(50, 150, 100);
            theta1_vals = linspace(0, 2, 100);
            
            % ========= YOUR CODE HERE =========
            % compute the costs for each theta_vals tuple
            % plot the costs with the surf command
            % add x and y label
            obj.setTheta(theta0_vals, theta1_vals);
            [X,Y] = meshgrid(theta0_vals, theta1_vals);
            Z = zeros(length(theta0_vals), length(theta1_vals));
            for i=1:length(theta1_vals)
                for j=1:length(theta0_vals)
                    obj.setTheta(theta0_vals(j), theta1_vals(i));
                    Z(i,j) = obj.costFunction();
                end
            end
            surf(X,Y,Z);
            xlabel('\theta_{0}');
            ylabel('\theta_{1}');
            
        end
        
        function h = showTrainingData(obj)
           h = figure('Name','Linear Regression Model');
           plot(obj.trainingData.feature,obj.trainingData.commandVar,'rx')
           grid on;
           xlabel(obj.trainingData.featureName + " in Kelvin");
           ylabel(obj.trainingData.commandVarName + " in Kelvin");
           legend('Training Data')
        end
        
        function h = showModel(obj)
           h = obj.showTrainingData();
           
           % ========= YOUR CODE HERE =========
           % add the final trained model plot to the figure ('b-')
           % update the legend
           hold on;
           plot(obj.trainingData.feature, obj.thetaOptimum(1) + obj.thetaOptimum(2)*obj.trainingData.feature, "b-", "DisplayName", "Linear Regression Model");
           hold off;
           
        end
        
        function setTheta(obj,theta0,theta1)
            obj.theta = [theta0;theta1];
        end
        
        function setThetaOptimum(obj,theta0,theta1)
            obj.thetaOptimum = [theta0;theta1];
        end
    end
    
    methods (Access = private)
        
        function initializeTheta(obj)
            obj.setTheta(0,0);
        end
   
    end
%------------- END CODE --------------
end


