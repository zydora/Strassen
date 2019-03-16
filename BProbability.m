% calculate all the filters first
S = Gen_ind([1,2,3],4)-2;
x_index = Gen_ind(1:size(S,1),3);X = cell(1,size(x_index,1));
X{1} = Pro(S(x_index(1,1),:)',S(x_index(1,2),:)',S(x_index(1,3),:)');% Wrong
for i = 2:size(x_index,1)
    X{i} = Pro(S(x_index(i,1),:)',S(x_index(i,2),:)',S(x_index(i,3),:)');
end
% Then add C(27,7)
C= zeros(4,4,4);

C(1,1,1) = 1;
C(1,2,3) = 1;
C(2,3,1) = 1;
C(2,4,3) = 1;
C(3,1,2) = 1;
C(3,2,4) = 1;
C(4,3,2) = 1;
C(4,4,4) = 1;
iter = 0;
for i = 1:27
    for j = 1:27
        for k = 1:27
            for l = 1:27
                for m = 1:27
                    for n = 1:27
                        for q = 1:27
                            tX = X{i} + X{j} +X{k} +X{l}+X{m}+X{n}+X{q};
                            iter = iter + 1;
                            if mod(iter,10)==0
                                fprintf('iter %d\n',iter);
                            end
                            if tX == C
                                Index = [i,j,k,l,m,n,q];
                                break
                            end
                        end
                    end
                end
            end
        end
    end
end