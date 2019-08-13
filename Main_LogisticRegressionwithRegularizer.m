%This program implements Logistic Regression. The 2_D feature vector of the 
%data points is first mapped into a polynomial of degree 6, which is 
%equivalent to a 28-D feature vector. Enhancing the dimension of feature 
%helps finding more sophisticated decision boundary however is vulnerable
%to overfitting. To combat this problem, we include a regularizer term in
%the cost function. Lambda is the coefficient of regularizer. Small lambda
%proseeds to create more complex decision boundary where the more number of
%training data points classified correct, while larger lambda leads to
%smoother and simpler decision boundry.
%In the output you can see the data points and the decision boundary to
%classify the data.
%Figure(2) shows the calculated value of X' * theta in the new 28-D feature
%space, ploted in the old 2-D feature space. above the surface are placed 
%the first class data points, and below that the second one. Obviously, 
%X' * theta = 0 specifies the decision boundary, which is depicted in 
%Figure(3).

clear all; close all; clc

data = load ('dataB.txt');
data = data(1:40,:);
[m,n] = size(data);

X = data(:,1:n-1);
y = data(:,n);

%Visualaizing data
PlotData([ones(m,1), X],y);

%Mapping features to a polynomial of spesific order 
degree =6;
[new_features,s] = FeatureMapping(X,degree);

%Computing cost function and dJ/dtheta
theta0 = zeros(s,1);
lambda = .5;

[J,dJdtheta] = CostAndGradRegularizer(new_features,y,theta0,lambda);

%Optimizing cost function using fminunc 
options = optimset('gradobj', 'on', 'maxiter', 400);

[theta,cost] = ...
    fminunc(@(theta) CostAndGradRegularizer(new_features,y,theta,lambda),theta0,options);

%Plotting decision boundary
PlotDecisionBoundary(theta,new_features,y,degree)


