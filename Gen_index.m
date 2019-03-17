function x_index = Gen_index(X,r)
% This function generates x_index from r components
% X should be a vector consisting of elements needed to rank, r should be
% the number of elements needed to rank
% Deprecated version

x_min = min(X);
x_max = max(X);
x_min = repmat(x_min,[1,r]);
x_max = repmat(x_max,[1,r]); xx_min = 0;xx_max = 0;index = 1:r;
for i = 1:r
    xx_min = xx_min+x_min(i)*10^(i-1);
    xx_max = xx_max+x_max(i)*10^(i-1);
end
x_index = xx_min:1:xx_max;
x_index = x_index';
for i = 1:length(x_index)
%     for j = r:-1:1
%         xx_index(i,r+1-j) = floor(mod(x_index(i),(10^(j)))/10^(j-1));
%     end
    xx_index(i,:) = str2num(num2str(x_index(i))')';
end

clear x_index
x_index = xx_index;
clear xx_index
xx_index = [0];
for i = 9:-1:x_max+1
    xx_index = [xx_index;mod(find(x_index==i),size(x_index,1))];
end 
xx_index = [xx_index;mod(find(x_index==0),size(x_index,1))];
xx_index(find(xx_index == 0))=size(x_index,1);
xx_index = xx_index(2:end,:);
xx_index = unique(xx_index);
%for i = 1:length(xx_index)
x_index(xx_index,:) = [];
%end
%X = x_index;
end

