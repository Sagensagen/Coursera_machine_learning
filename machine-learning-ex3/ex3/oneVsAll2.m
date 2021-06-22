function [all_theta] = oneVsAll2(X, y, num_labels, lambda)
   
    m = size(X, 1);
    n = size(X, 2);
    fprintf('total number of pixels per pic=n %d \n', n)
    fprintf('total number of pictures /examples=m %d \n', m)

    
    % You need to return the following variables correctly 
    all_theta = zeros(num_labels, n + 1);

    % Add ones to the X data matrix
    X = [ones(m, 1) X];


    
    
    options = optimset('GradObj', 'on', 'MaxIter', 50);
    pause
    for k = 1:num_labels
            
            initial_theta = zeros(n + 1, 1);
            theta = ...
                     fmincg (@(t)(lrCostFunction(t, X, (y == k), lambda)), ...
                             initial_theta, options);
            
            all_theta(k, :) = theta';
      
    end
    
    
    end
    