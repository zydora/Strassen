%% Update core tensor
% Input: 3-way nml binary tensor X, (r1,r2,r3)
% Input: BTucker_ALS(X,r1,r2,r3)
% Output: G
function G = UpdateG(X,G,A,B,C)
% step
for alpha = 1: r1
    for beta = 1:r2
        for gama = 1:r3
            gain = 0;
            for i = 1:n
                for j = 1:m
                    for k = 1:l
                        if A(i,alpha)*B(j,beta)*C(k,gama) ==1
                            if G(alpha,beta,gama)==0 && X_keep(i,j,k) ==0
                                gain = gain+X(i,j,k);
                            elseif G(alpha, beta, gama) == 1 && X_keep(i,j,k) == 1
                                    m = 0;
                                    for aa = 1:r1
                                        for bb = 1:r2
                                            for cc = 1:r3
                                                if G(aa,bb,cc)*A(i,aa)*B(j,bb)*C(k,cc) == 1
                                                    m = 1;
                                                end
                                            end
                                        end
                                    end
                                    if m == 0
                                        gain = gain + (1-X(i,j,k));
                                    end
                            end
                        end
                    end
                end
            end
            if gain > 0
                G(alpha,beta,gama) = 1-G(alpha,beta,gama);
            end
        end
    end
end
end