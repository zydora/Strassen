demo Probability
% [X,A,B,C] = demoC;
% dim = size(X,1);r = 8;
% M = Gen_ind([1,2,3],dim)-2;
% 
% MM = abs(M);Index = 0;
% for i = 1:size(MM,1)
%     if sum(MM(i,:)) >2
%         Index = [Index, i];
%     end
%     if sum(abs(MM(i,:))) == 0
%         Index = [Index, i];
%     end
% end
% Index = Index(2:end);
% M(Index,:)=[];
% M(floor(size(M,1)/2)+1,:) = [];
% 
% index = randperm(size(M,1));
% Ai = M(index(1:r),:)';
% Bi = M(index(r+1:2*r),:)';
% Ci = M(index(2*r+1:3*r),:)';
% %% 
% X1 = Unfold(X,1);
% X2 = Unfold(X,2);
% X3 = Unfold(X,3);
% iter =  0;
% X = Pro(A,B,C);
% 
% A_index = cell(1,7);
% for i = 1:7
%     A_index{i} = 1:31;
% end
% B_index = cell(1,7);
% for i = 1:7
%     B_index{i} = 1:31;
% end
% C_index = cell(1,7);
% for i = 1:7
%     C_index{i} = 1:31;
% end
% 
% AM = cell(1,7);
% for i = 1:7
%     AM{i} = M;
% end
% BM = cell(1,7);
% for i = 1:7
%     BM{i} = M;
% end
% CM = cell(1,7);
% for i = 1:7
%     CM{i} = M;
% end
%% 
iter = 0;
while(iter < 4)
    iter =  iter + 1;
    for j = 1:7
    Ascore = 0;
    %% A
    for i = 1:size(M,1)
        Ai(:,j) = AM{j}(i,:)';
        [Fa,score] = Probability(X,Ai,Bi,Ci);
        if abs(score-dim^3*1.3679) < abs(Ascore-dim^3*1.3679)
            Ascore = score
            ai = i;
        end
    end
    if round(Ascore) == round(dim^3*1.3679)
        fprintf('Finished');
        break
    end
    Ai(:,j) = AM{j}(ai,:)';
    %Ai = A;
    Bscore = 0;
    %% B
    for i = 1:size(M,1)
        Bi(:,j) = BM{j}(i,:)';
        [Fb,score] = Probability(X,Ai,Bi,Ci);
        if abs(score-dim^3*1.3679) < abs(Bscore-dim^3*1.3679)
            Bscore = score
            bi = i;
        end
    end
    if round(Bscore) == round(dim^3*1.3679)
        fprintf('Finished');
        break
    end
    Bi(:,j) = BM{j}(bi,:)';
    %Bi = B;
    Cscore = 0;
    %% C
    for i = 1:size(M,1)
        Ci(:,j) = CM{j}(i,:)';
        [Fc,score] = Probability(X,Ai,Bi,Ci);
        if abs(score-dim^3*1.3679) < abs(Cscore-dim^3*1.3679)
            Cscore = score
            ci = i;
        end
        
    end
    if round(Cscore) == round(dim^3*1.3679)
        fprintf('Finished');
        break
    end
    Ci(:,j) = CM{j}(ci,:)';
    %Ci = C;
    end
end
iter = 0;limit = 35;
while(iter < 1000)
    iter =  iter + 1;limit = limit - 1;
    for j = 1:7
    Ascore = 0;
    %% A
    for i = 1:size(M,1)
        Ai(:,j) = AM{j}(i,:)';
        
        [Fa,score] = Probability(X,Ai,Bi,Ci);
        if abs(score-87)>limit
            A_index{j}(i) = 0;
            AM{j}(i,:) = AM{j}(find(A_index{j}~=0,1),:);
        end
        if abs(score-dim^3*1.3679) < abs(Ascore-dim^3*1.3679)
            Ascore = score
            ai = i;
        end
    end
    if round(Ascore) == round(dim^3*1.3679)
        fprintf('Finished');
        break
    end
    Ai(:,j) = AM{j}(ai,:)';
    A_index{j}
    %Ai = A;
    Bscore = 0;
    %% B
    for i = 1:size(M,1)
        Bi(:,j) = BM{j}(i,:)';
        [Fb,score] = Probability(X,Ai,Bi,Ci);
        if abs(score-87)>limit
            B_index{j}(i) = 0;
            BM{j}(i,:) = BM{j}(find(B_index{j}~=0,1),:);
        end
        if abs(score-dim^3*1.3679) < abs(Bscore-dim^3*1.3679)
            Bscore = score
            bi = i;
        end
    end
    if round(Bscore) == round(dim^3*1.3679)
        fprintf('Finished');
        break
    end
    Bi(:,j) = BM{j}(bi,:)';
    B_index{j}
    %Bi = B;
    Cscore = 0;
    %% C
    for i = 1:size(M,1)
        Ci(:,j) = CM{j}(i,:)';
        [Fc,score] = Probability(X,Ai,Bi,Ci);
        if abs(score-87)>limit
            C_index{j}(i) = 0;
            CM{j}(i,:) = CM{j}(find(C_index{j}~=0,1),:);
        end
        if abs(score-dim^3*1.3679) < abs(Cscore-dim^3*1.3679)
            Cscore = score
            ci = i;
        end
    end
    if round(Cscore) == round(dim^3*1.3679)
        fprintf('Finished');
        break
    end
    Ci(:,j) = CM{j}(ci,:)';
    C_index{j}
    end
    fprintf('iter %d and limit %d',iter,limit);
end
%%
