function P = BProduct(a,M)
for i = 1:size(a,1)
    for j = 1:size(M,2)
        P(i,j) = 0;
        for k = 1:size(a,2)
            if (a(i,k)==1)&&(M(k,j)==1)
                P(i,j) = 1;
            end
        end
    end
end
end