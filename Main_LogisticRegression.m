
%This program implements Logistic Regression to classify two class of data
%in data space. It uses fminunc() function to find the optimal coefficients
%of the model. In the output graphs, two classes of data points as well as
%decision boundary is represented. Also the accuracy of the model on
%dataset in addition to theta, the coefficients of the model, are reported. 

clear all; close all; clc

%data = csvread('ex2data1.txt');
data = csvread('dataA.txt');


[m,n] = size(data);

X = [ones(m,1) , data(:,1:n-1)];
y = data(:,n);

%visualizing data
PlotData(X,y)

theta0 = zeros(n,1);

%Optimizing cost function using fminunc()
options = optimset ('gradobj', 'on', 'maxiter', 400);

[theta,cost] = fminunc (@(theta) CostAndGrad(X,y,theta), theta0, options);

%ploting decision boundary
degree = 1; % degree is used for feature mapping and is the degree of polinomial 
PlotDecisionBoundary(theta,X,y,degree)

%evaluating the accuraccy of model
y_predict = Predict(X,theta);

accuracy = mean(y_predict==y);

%reporting theta and accuracy 
fprintf('Accuracy of the model on training set is: \n %f, \n \nTheta calculated by fminunc is: \n', accuracy)
fprintf('%f \n', theta);
