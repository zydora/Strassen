function [xx,error_max] = Decom(A,r,BT,RD)
% This algorithm aims at finding the most accurate decomposition in a greedy way

% A is the given tensor (3-way), r is the given rank
% x: factor matrices of A
% BT: Binary or Ternary
% RD: Random or Determine

% X: all binary matrices
% x_index: choose r components from 1-2^d, to recursively decompose
% X_index: 1-2^d
% d: dimension of A
dim = size(A);
if r < 0
    fprintf('r should be larger than 0');
elseif r > max(prod(dim))
    fprintf('r should be smaller than prod(size(A))');
end
% Binary/Ternary Decom.
if BT == 2
    for i = 1:length(dim)
        x{i} = zeros(dim(i),r);X{i} = zeros(dim(i),2^dim(i));
        %     for j = 1:2^size_A(i)
        %         X{i}(:,j) = dec2base(j-1,2,size_A(i))-'0';
        %     end
        X{i} = Gen_ind([1,2],dim(i))'-1;%[1,2] deci, r rank
        X_index{i} = 1:2^dim(i); x_index{i} = Gen_ind(X_index{i},r);
    end
elseif BT == 3
    if RD == 1
        for i = 1:length(dim)
            x{i} = zeros(dim(i),r);X{i} = zeros(dim(i),3^dim(i))';
            X{i} = Gen_ind([1,2,3],dim(i))'-2;
            X_index{i} = 1:3^dim(i); x_index{i} = Gen_ind(X_index{i},r);
        end
    elseif RD == 2
        for i = 1:length(dim)
            x{i} = zeros(dim(i),r);
            X{i} = Gen_ind([1,2,3],dim(i))'-2;
            X_index{i} = 3^dim(i); 
        end
    end
end




error_max = prod(dim);
%for i = 1:length(size_A)% r=2
if RD == 1
    for j = 1:length(x_index{1})
        for m = 1:length(x_index{2})
            for q = 1:length(x_index{3})
                x{1} = X{1}(:,x_index{1}(j,:));
                x{2} = X{2}(:,x_index{2}(m,:));
                x{3} = X{3}(:,x_index{3}(q,:));
                error = sum(abs(reshape(A-Pro(x{1},x{2},x{3}),[1,prod(size(A))])))
                if error < error_max
                    xx = x;error_max = error;
                end
                if error_max == 0
                    break
                end
            end
        end
    end
elseif RD == 2
    while(1)
        for i = 1:length(dim)
            %aa = randn(max(X_index{i}),1); aa = floor(mod((aa+1)*80,80))+1;
            x_index{i} = randperm(X_index{i});
            a = x_index{i}(1:r);x_index{i} = randperm(X_index{i});
            b = x_index{i}(1:r);x_index{i} = randperm(X_index{i});
            c = x_index{i}(1:r);
            x{1} = X{1}(:,a);
            x{2} = X{2}(:,b);
            x{3} = X{3}(:,c);
            error = sum(abs(reshape(A-Pro(x{1},x{2},x{3}),[1,prod(size(A))])))
            if error < error_max
                xx = x;error_max = error;
            end
            if error_max == 0
                break
            end
        end
    end
end
