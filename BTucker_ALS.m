%% Boolean Tucker decomposition
% Input: 3-way binary tensor X, ranks(r1,r2,r3)
% Output: Boolean Tucker decomposition (G, A,B,C)
function BTucker_ALS(X,r1,r2,r3)
A = Asso(X1,r)
B = Asso(X2,r);
C =Asso(X3,r);
G = UpdateG(X,0,A,B,C);
while(1)
    A = UpdateFactor(X1,A,G1*kron(C,B)');
    B = UpdateFactor(X2,B,G1*kron(C,A)');
    C = UpdateFactor(X3,C,G1*kron(B,A)');
    G = UpdateG(X,G,A,B,C);
    % if error < threshold
    % break
end
end