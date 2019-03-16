function A = UpdateFactor(X,A,M)
% X is the unfolded tensor
% A is the factor matrix
[d1,d2] = size(X);
for i = 1:d1
    x = X(i,:);
    a = A(i,:);
    c = 1-a;
    %z = BProduct(a,M);
    z = a*M;
    bA = Gen_ind([1,2],size(A,2))-1; 
    tcover = cover(x,z,c);
    for j = 1:size(bA,1)
        tempa = bA(j,:);
        if tcover< cover(x,(tempa*M),c)
            a = tempa;
            tcover = cover(x,(tempa*M),c);
        end
        if tcover == 0
            break
        end
    end
    A(i,:) = a;
end
end