function X = strassen
% X is the decomposed tensor
A = [1 0 0 1; 0 1 0 -1; 0 0 1 1; 1 1 0 0; -1 0 1 0; 0 0 0 1; 1 0 0 0];
A = A';
B = [1 0 0 1; 0 1 0 1; 1 0 0 0 ;0 0 0 1; 1 0 1 0; -1 1 0 0; 0 0 1 -1];
B = B';
C = [1 0 0 1; 1 0 0 0; 0 0 1 -1; -1 1 0 0; 0 0 0 1; 1 0 1 0; 0 1 0 1];
C = C';
X = Pro(A,B,C);
% permute(X,[2,3,1]) = strassen;
end
