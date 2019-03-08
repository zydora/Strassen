%% Boolean CP decomposition
% Input: 3-way binary tensor X, rank r
% Output: A, B, C
function [A, B, C] = BCP_ALS(X,r)
[X1, X2, X3] = unfold3(X);
threshold = 0.8;
A = Asso(X1,r,threshold);
B = Asso(X2,r,threshold);
C = Asso(X3,r,threshold);

iter = 0;
while (1)
    A = UpdateFactor(X1, A, kr(C,B)');
    B = UpdateFactor(X2, B, kr(C,A)');
    C = UpdateFactor(X3, C, kr(B,A)');
    x = Pro(A,B,C);
    error = sum(abs(reshape((X-x),[1,prod(size(X))])))
    % converge
    % if error < threshold
    % break
    iter = iter + 1;
    fprintf("iter %d ,error %f\n",iter, error);
    if iter > 500 || error < 1
        break
    end
end
end