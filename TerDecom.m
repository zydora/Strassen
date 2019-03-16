% reproduce ternary network: "TERNARY WEIGHT DECOMPOSITION AND BINARY
% ACTIVATION ENCODING FOR FAST AND COMPACT NEURAL NETWORK" Algo.1
function [M,a,b,R] = TerDecom(W,r)
R = W;MM = Gen_ind([1,2,3],size(W,1))-2;
for i = 1:r
    Index =  randperm(size(MM,1));
    %Index = Index(1);
    M(:,i) = MM(Index(1),:)';
    b(:,i) = MM(Index(2),:)';
    iter = 0;
    while(1)&&(iter < 50)
        a(i,:) = (M(:,i)'*R/(M(:,i)'*M(:,i))); index  = [1,0,-1];tempsum = [0,0,0];
        for j = 1:size(W,1)
            for q = 1:3
                tempsum(q) = (R(j,:)-index(q)*a(i,:))*(R(j,:)-index(q)*a(i,:))'
                M(j,i) = index(find(tempsum == min(tempsum),1));
            end
        end
        iter = iter + 1;
    end
    R = R - M(:,i)*a(i,:);
end
end
       