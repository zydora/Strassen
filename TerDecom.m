% reproduce ternary network: "TERNARY WEIGHT DECOMPOSITION AND BINARY
% ACTIVATION ENCODING FOR FAST AND COMPACT NEURAL NETWORK" Algo.1
function [M,C,R] = TerDecom(W,r)
R = W;MM = Gen_ind([1,2,3],size(W,1))-2;
for i = 1:r
    Index =  randperm(size(MM,1));
    Index = Index(1);
    M(:,i) = MM(Index,:)';
    iter = 0;
    while(1)&&(iter < 50)
        C(i,:) = (M(:,i)'*R/(M(:,i)'*M(:,i))); index  = [1,0,-1];tempsum = [0,0,0];
        for j = 1:size(W,1)
            for q = 1:3
                tempsum(q) = (R(j,:)-index(q)*C(i,:))*(R(j,:)-index(q)*C(i,:))'
                M(j,i) = index(find(tempsum == min(tempsum),1));
            end
        end
        iter = iter + 1;
    end
    R = R - M(:,i)*C(i,:);
end
end
       