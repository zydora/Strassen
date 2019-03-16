clear all
clc

C = demoC;
%% Test 1 Gene

% xi_tensor = C;
% xi = ones(8,1);
% id = cell(3,1);
% id{1} = [3 4 1 2 3 4 1 2]';
% id{2} = [2 4 2 4 1 3 1 3]';
% id{3} = [1 1 2 2 3 3 4 4]';
%%
% R=30;%rank
% trainfrac=0.9;%90 percent as training data
% batchsize=floor(length(xi)*trainfrac/10);%10 percent of training data as a batch
% numiters=300;
% isbatch=0;
% burnin=floor(numiters*2/3);

%% choose online or batch gibbs for small data 
% [U lambda pr eva time_trace] = BTF_OnlineGibbsSmall(xi,id,xi_tensor,R,batchsize,numiters,isbatch,trainfrac); %online gibbs
% [U lambda pr eva time_trace] = BTF_GibbsSmall(xi,id,xi_tensor,R,numiters,burnin,trainfrac);% batch gibbs

%% Test 2 My codes
[A,B,X]  =BCP_ALS(C,7);
Xr = Pro(A,B,X);
error = Xr-C;
error = norm(reshape(error,[1,prod(size(error))]))
Xr
C
%% Test 3 
% X = randn(2,2,2);
% X = sign(X);X = round((X+1)/2);
% X(find(X==-1)) = 0;
% [A, B, C] = BCP_ALS(X,2)
% Xr = Pro(A,B,C);
% error = Xr-X;
% error = norm(reshape(error,[1,prod(size(error))]))
% Xr
X
%% Test 4
% Test1: binary matrix decomposition
x1 = sign(randn(10));
 x1(find(x1==-1))=0
[A,B] = Asso(x1,size(x1,1),0.9)
A*B-x1

% Test2: ternary matrix decomposition
x1 = sign(randn(5,5));
 x1(find(x1==-1))=0
[A,B] = AssoTer(x1,8,0.999,0.2)
A*B-x1

%% Test 5
C = demoC;
[A,B,M] = TCP_ALS(C,7)