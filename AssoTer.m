function [S, B] = AssoTer(x1,r,threshold1,threshold2)
% threshold value equals to 0.5
% real-value weights equals to 2/1
[d1,d2] = size(x1);
t = zeros(size(x1));
for i = 1:size(x1,2)
    for j = 1:size(x1,2)
        if (x1(:,i)'*x1(:,j))/(x1(:,i)'*x1(:,i)) > threshold1
            t(i,j) = 1;
        %elseif (x1(:,i)'*x1(:,j))/(x1(:,i)'*x1(:,i)) < threshold2
        %    t(i,j) = -1;
        end
    end
end
t = 2*t-1;
B = zeros(r,d2);
S = zeros(d1,r);
IndexS = Gen_ind([1,2,3],d1)-2;
iter = 0;
while (1)
    for l = 1:r
        B_index = 1;
        temp_cover = 0;
        tempS = S;
        S_index = 1;
        for i = 1:d1
            B(l,:) = t(i,:);
            for j = 1:size(IndexS,1)
                
                tempS(:,l) = IndexS(j,:)';
                %             for k = 1:d1
                %                 tempS(k,l) = 1;
                if temp_cover<coverM(x1,tempS,B)
                    S_index = j;
                    B_index = i;
                    temp_cover = coverM(x1,tempS,B);
                end
                %             end
            end
        end
        B(l,:) = t(B_index,:);
        S(:,l) = IndexS(S_index,:)';
    end
    iter = iter + 1;
    if iter > 5
        break
    end
end