function PlotDecisionBoundary(theta,X,y,degree)
    
    n = size(X,2);
    figure
    PlotData(X,y)
    hold on
    
    if  n<= 3
        
        x_points = [min(X(:,2))  , max(X(:,2)) ];
        y_points = theta(1:2)' * [[1,1];x_points] / (-theta(3));

        plot(x_points,y_points, 'black', 'linewidth', 2)

        legend('Class 1', 'Class 2','decision boundary')
    end
    
    if n>3
        
        x_points = linspace (min(X(:,2))  , max(X(:,2)) , 50);
        y_points = linspace (min(X(:,3))  , max(X(:,3)) , 50);
        %xy_points = cat (3,x_points,y_points);
        z = zeros(50,50);
        for i = 1:length(x_points) 
            for j=1:length(y_points)
                new_features = FeatureMapping([x_points(i),y_points(j)],degree);
                z(i,j) = new_features * theta;
            end
        end
        
        z = z';
        
         surf(x_points,y_points,z);
         
         figure
         PlotData(X,y)
         contour(x_points,y_points,z,[0,0]);
    end
        
        
   




    
end

