function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
[m n] = size(X); % number of training examples
n = size(X(2));
% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%
%h = X*theta;
%%Squared mean error 
%J_unreg = sum((h-y).^2)/ (2*m);
%
%%REguralize
%J = J_unreg + lambda * sum(theta(2:n).^2) / (2*m);
%
%
%grad = X' * (h-y) / m;
%%reguralize
%grad(2:n) += lambda*theta(2:n)/m;
%

diff_h_theta = X*theta - y;
Cost = sum(diff_h_theta.^2);
penalty = lambda*sum((theta(2:end)).^2);

J = (Cost+penalty)/ (2*m); 

grad = (X')*diff_h_theta/m; 


grad_reg = (lambda/m)*(theta(2:end));

grad(2:end) = grad(2:end) + grad_reg;


grad = grad(:);
end
