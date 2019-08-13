function y_predict = Predict(X,theta)
    
    s = Sigmoid(X*theta);
    y_predict = s>=.5;
    
end

