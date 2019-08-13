function [J,dJdtheta] = CostAndGradRegularizer(x,y,theta,lambda)
    
    m = length(y);
    
    pos = y == 1;
    
    %calculation cost function J having theta & lambda
    J_pos = Sigmoid ( x(pos,:)*theta );
    J_neg = Sigmoid ( x(~pos,:)*theta );
    J = -( sum( log(J_pos) ) + sum( log (1-J_neg) ) )+ ...
        norm( theta(2:end) )^2 * lambda/2 ;
    J = J/m;
    
    %Calculation gradient of J with respect to theta
    dJdtheta_0 = (Sigmoid(x*theta) - y )' * x(:,1) / m;
    dJdtheta_rest = x(:,2:end)' * (Sigmoid(x*theta) - y ) / m ...
        + lambda/m * theta(2:end);
    
    dJdtheta = [dJdtheta_0 ; dJdtheta_rest];
    
end

