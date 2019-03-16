while(iter < 1000)
    iter =  iter + 1;limit = limit - 1;
    for j = 1:7
    Ascore = 0;
    %% A
    AM{j} = unique(AM{j},'rows');BM{j} = unique(BM{j},'rows');CM{j} = unique(CM{j},'rows');
    for i = 1:size(AM{j},1)
        Ai(:,j) = AM{j}(i,:)';
        for k = 1:size(BM{j},1)
            Bi(:,j) = BM{j}(k,:)';
            for m = 1:size(CM{j},1)
                Ci(:,j) = CM{j}(m,:)';
        [Fa,score] = Probability(X,Ai,Bi,Ci);

        if abs(score-87) < abs(Ascore-87)
            ABCscore = score
            ai = i;
            bi = k;
            ci = m;
        end
        
        
            end
        end
    end
    Ai(:,j) = AM{j}(ai,:)';
    Bi(:,j) = BM{j}(bi,:)';
    Ci(:,j) = CM{j}(ci,:)';
    if round(Ascore) == 88
        fprintf('Finished');
        break
    end
    
    
   
   
    end
    fprintf('iter %d and limit %d',iter,limit);
   
end
while(1)
    for j = 1:7
        for i1 = 1:4
            Ai(i1,j) = mod(Ai(i1,j)+1,3)-1;
            for i2 = 1:4
                Bi(i2,j) = mod(Bi(i2,j)+1,3)-1;
                for i3 = 1:4
                    Ci(i3,j) = mod(Ci(i3,j)+1,3)-1;
                    [f,score] = Probability(Pro(A,B,C),Ai,Bi,Ci);
                    if tscore>score
                        tscore = score
                        ai = i1;
                        bi = i2;
                        ci = i3;
                    end
                end
            end
        end
    end
end

                    
