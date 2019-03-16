% TensOrMachine reproduce
function [P_X,P_F] = Probability(X,A,B,C)
% module = 1: calculate Probability of two tensor
% module = 2: calculate Probability of factor matrices
dim = size(X);
%X = Pro(A,B,C);
% 3 way
X_count = 2*X-1;
P_X = zeros(size(X_count));
for i = 1:dim(1)
    for j = 1:dim(2)
        for k = 1:dim(3) 
            P = 2*Pro(A,B,C)-1;
            P_X(i,j,k) = sigmoid(X_count(i,j,k)*P(i,j,k));
            if P(i,j,k)~=1 && P(i,j,k) ~=-1
                P_X(i,j,k) = P(i,j,k)-0;
            end
        end
    end
end
P_F = sum(sum(sum(abs(P_X))));
%P_X = -(P_X - sigmoid(1));