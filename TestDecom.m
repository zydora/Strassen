% test Decom
% dim = [4,2,2];
% r = 2;
% num = 42;%710;% A is the binary form of num
% % Given tensor or not
% 
% Pro_dim = prod(dim);
% x = dec2base(num,2,Pro_dim)-'0';
% A = reshape(x,dim);

% tic
% [xx,error] = Decom(A,r,3)
% toc

% strassen
C = zeros(4,4,4);
C(3,2,1) = 1;
C(4,4,1) = 1;
C(1,2,2) = 1;
C(2,4,2) = 1;
C(3,1,3) = 1;
C(4,3,3) = 1;
C(1,1,4) = 1;
C(2,3,4) = 1;
tic;[xx,error] = Decom(C,7,3);toc