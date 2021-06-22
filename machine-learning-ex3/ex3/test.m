clear ; close all; clc



input_layer_size = 400;
num_labels = 10;

load('ex3data1.mat');
m = size(X, 1);



theta_t = [-2; -1; 1; 2]
X_t = [ones(5,1) reshape(1:15,5,3)/10]
y_t = ([1;0;1;0;1] >= 0.5)
lambda = 0.1;

[all_theta] = oneVsAll2(X, y, num_labels, lambda);

