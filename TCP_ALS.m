%% Boolean CP decomposition
% Input: 3-way binary tensor X, rank r
% Output: A, B, C
function [A, B, C] = TCP_ALS(X,r)
[X1] = Unfold(X,1);
[X2] = Unfold(X,2);
[X3] = Unfold(X,3);
threshold1 = 0.8;threshold2 = 0.2;
A = AssoTer(X1,r,threshold1,threshold2);
B = AssoTer(X2,r,threshold1,threshold2);
C = AssoTer(X3,r,threshold1,threshold2);
Index_A = Gen_ind([1,2,3],size(A,1))-2;
Index_B = Gen_ind([1,2,3],size(B,1))-2;
Index_C = Gen_ind([1,2,3],size(C,1))-2;
index_A = randperm(size(Index_A,1));
index_B = randperm(size(Index_B,1));
index_C = randperm(size(Index_C,1));
A = Index_A(index_A(1:r),:)';
B = Index_B(index_B(r+1:2*r),:)';
C = Index_C(index_C(2*r+1:3*r),:)';

iter = 0;
while (1)
    A = X1/(kr(C,B)');limit = 0.03;
    %A(find(abs(A)<limit))=0;A = sign(A);
    %A(find(A==max(A)))=1;A(find(A==min(A)))=-1;A(find(-1<A<1))=0;
    [max_A, index]  =max(A);[min_A,index2] = min(A);
    for i = 1:size(A,2)
        A(index(i),i)=1;
        A(index2(i),i)=-1;
    end
    A(find(abs(A)~=1))=0;
    B = X1/(kr(C,A)');
    [max_B, index]  =max(B);[min_B,index2] = min(B);
    for i = 1:size(B,2)
        B(index(i),i)=1;
        B(index2(i),i)=-1;
    end
    B(find(abs(A)~=1))=0;
    %B(find(abs(B)<limit))=0;B = sign(B);
    C = X1/(kr(B,A)');
    [max_C, index]  =max(C);[min_C,index2] = min(C);
    for i = 1:size(C,2)
        C(index(i),i)=1;
        C(index2(i),i)=-1;
    end
    C(find(abs(C)~=1))=0;
    %C(find(abs(C)<limit))=0;C = sign(C);
    x = Pro(A,B,C);
    error = sum(abs(reshape((X-x),[1,prod(size(X))])))
    % converge
    % if error < threshold
    % break
    iter = iter + 1;
    fprintf("iter %d ,error %f\n",iter, error);
    if iter > 10500^2 || error < 4
        break
    end
end
end