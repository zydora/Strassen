[X1] = Unfold(X,1);
[X2] = Unfold(X,2);
[X3] = Unfold(X,3);
threshold1 = 0.8;threshold2 = 0.2;

Index_A = Gen_ind([1,2,3],size(A,1))-2;
Index_B = Gen_ind([1,2,3],size(B,1))-2;
Index_C = Gen_ind([1,2,3],size(C,1))-2;
index_A = randperm(size(Index_A,1));
index_B = randperm(size(Index_B,1));
index_C = randperm(size(Index_C,1));
% A = Index_A(index_A(1:r),:)';
% B = Index_B(index_B(r+1:2*r),:)';
% C = Index_C(index_C(2*r+1:3*r),:)';

iter = 0;
while (1)
    A = X1/(kr(C,B)');limit = 0.03;
    %A = sign(A);
    B = X1/(kr(C,A)');
    %B = sign(B);
    
    C = X1/(kr(B,A)');
    %C = sign(C);
   
    x = Pro(A,B,C);
    error = sum(abs(reshape((X-x),[1,prod(size(X))])))
    
    iter = iter + 1;
    fprintf("iter %d ,error %f\n",iter, error);
    if iter > 10500^2 || error < 4
        break
    end
end
