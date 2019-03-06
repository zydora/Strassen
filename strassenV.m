X = strassen;
a = randn(2,2);
b = randn(2,2);
c = a*b;
a = reshape(a,[4,1]);
b = reshape(b,[4,1]);

% c-1, a-3. b-2
AX = permute(X,[3,2,1]);
AX = reshape(AX,[4,16]);
AX = a'*AX; %3
AX = reshape(AX,[4,4]);
AX = permute(AX,[2,1]);

BX = AX*b;%1
