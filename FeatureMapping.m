function [new_features,s] = FeatureMapping(X,degree)

    m = size(X,1);
    
    s=0;
    for i = 0:degree
        for j = 0:i
            s=s+1;
        end
    end
    
    new_features = zeros(m,s);
    k=0;
    for i = 0:degree
        for j = 0:i
            k=k+1;
            new_features(:,k) = X(:,1).^(i-j) .* X(:,2).^(j);
        end
    end
    
    

end

