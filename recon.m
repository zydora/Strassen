function X = recon(A,B,C)
r1 = size(A,1);
r2 = size(B,1);
r3 = size(C,1);
X = zeros(r1,r2,r3);
for i = 1:size(A,2)
    X = X | reshape(kron(C(:,i),kron(B(:,i),A(:,i))),[r1,r2,r3]);
end
end