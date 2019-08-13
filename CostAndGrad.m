function [J,dJdtheta] = CostAndGrad(X,y,theta)
    
    m = length(y);
    
    pos = y == 1;
    
    J_pos = Sigmoid ( X(pos,:)*theta );
    J_neg = Sigmoid ( X(~pos,:)*theta );
    J = -( sum( log(J_pos) ) + sum( log (1-J_neg) ) ) / m;
    
%     Using the combined formula for calculation J, elapsed time is longer.    
%     tic
%     h = mySigmoid (X*theta);
%     J = y' * log ( h ) + (1- y') * log( 1- h);
%     J = -J/m;
%     toc


    dJdtheta = (Sigmoid(X*theta) - y )' * X / m;
     
    
    
end

