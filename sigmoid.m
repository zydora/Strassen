function x = sigmoid(x)
dim = size(x);
x = exp(-x);
x = x+1;
x = 1./x;%
end