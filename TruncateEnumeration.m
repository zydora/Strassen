%function [A,B,C] = XiaCai(X,r)
clear
[X,A,B,C] = demoC;
% Calculate how many 0's
M = Unfold(X,1);
index = sum(sum(M));
clear M
M = Gen_ind([1,2,3],4)-2;
MM = abs(M);Index = 0;
for i = 1:size(MM,1)
    if sum(MM(i,:)) >2
        Index = [Index, i];
    end
end
Index = Index(2:end);
M(Index,:)=[];

clear Index

Index = Gen_ind(1:size(M,1),3);
M(floor(size(M,1)/2)+1,:)=[];Index = Gen_ind(1:size(M,1),3);
for i = 1:size(Index,1)
    Q{i} = Pro(M(Index(i,1),:)',M(Index(i,2),:)',M(Index(i,3),:)');
    sumQ(i) = sum(sum(sum(Q{i})));
end
% rank
sumQ = [sumQ' (1:size(sumQ,2))'];
sumQ = sortrows(sumQ,1);

sumQQ = [0,1,2,4,8];
for i = 1:max(size(sumQQ))
    t{i} = find(sumQ==sumQQ(i));
    t{i}(find(t{i}>size(sumQ,1)))=[];
    Index_Q(i) = max(size(t{i}));
end

%% Case 1 : 8+0
for i = 1:Index_Q(5)
    ZZ{1} = Q{t{5}(i)};
    %C_Index = Gen_ind(1:Index_Q(1),6);
    C_sum = zeros(4,4,4);
    for j1 = 1:Index_Q(1)
        for j2 = 2:Index_Q(1)
            for j3 = 3:Index_Q(1)
                for j4 = 4:Index_Q(1)
                    for j5 = 5:Index_Q(1)
                        for j6 = 6:Index_Q(1)
                            C_sum = Q{t{1}(j1)} + Q{t{1}(j2)}+ Q{t{1}(j3)} + Q{t{1}(j4)} + Q{t{1}(j5)} + Q{t{1}(j6)};
                            if max(max(max(C_sum)))>2
                                continue;
                            end
                            if C_sum + ZZ{1} == Pro(A,B,C)
                                fprintf('Find');
                                break
                            end
                        end
                    end
                end
            end
        end
    end
end

%% Case 2: 4+4+0+0+0+0+0
