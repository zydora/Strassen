% TCP_ALS
function [A, B, C] = TTCP_ALS(X,r)
X1 = Unfold(X,1);
X2 = Unfold(X,2);
X3 = Unfold(X,3);
[A,a,~,R] = TerDecom(X1,r)
[B,b,~,R] = TerDecom(X2,r)
[C,~,~,R] = TerDecom(X3,r)

iter = 0;
while (1)&& iter < 50
    
    A = X1/kr(B,C)';
    
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