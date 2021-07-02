function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);
% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

fprintf('inside predict\n')
%appends to the first column ones
disp('X= '), disp(size(X))
X = [ones(m, 1) X];
disp('X after = '), disp(size(X))


%first activation functions through theta1
z2 = X*Theta1';
disp('z2 = X*theta1"'), disp(size(z2))

%logistic function of the first layer

x2 = sigmoid(z2);
disp('x2 = sigmoid(z2)'), disp(size(x2));
%Again, appends to the first column ones 
x2 = [ones(size(z2),1), x2];
disp(size(x2))
%Second activation functions through theta2
disp("z3= x2*theta2'")
z3 = x2*Theta2';
disp(size(z3))
%logistic function of the second layer
x3 = sigmoid(z3);
disp(size(x3))
first_row = (x3(1:1,2:end))
%size of x3 = [5000 x 10]
%the second dimension describes which classification the predicitons are closest to.
disp("highest val"), max(first_row)

[pred_max, idx_max] = max(x3, [], 2);
p = idx_max;
% =========================================================================
size(idx_max)
idx_max(1:1,1) 
end
