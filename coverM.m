function c = coverM(C,S,B)
% C matrix object
% B S factor matrix
c = 0; %M = BProduct(S,B);
M = S*B;
for i = 1:size(C,1)
    for j = 1:size(C,2)
        if C(i,j)==1 && M(i,j) == 1
            c = c+1;
        elseif C(i,j)==0 && M(i,j) == 1
            c = c-1;
%         elseif C(i,j)==1 && M(i,j) == 0
%             c = c-1;
%         elseif C(i,j)==0 && M(i,j) == 0
%             c = c+1;
        end
    end
end
end