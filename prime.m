function M = prime(num)
%% generize prime
list = 0;
for i = 2:num
    sum = 0;
    for j = 2:floor(sqrt(i))
        if mod(i,j)==0
            sum = sum+1;
        end
    end
    if sum == 0
        list = [list i];
    end
end
M = list(2:end);
%% write prime
% for i = 1:floor((size(M,2)-1)/200) 
%     filename = sprintf('%s%d','list',i);
%     if i ~= floor((size(M,2)-1)/200)
%     xlswrite(filename,M((i-1)*200+1:i*200));
%     end
% end
%% prime out
numm = floor(sqrt(size(M,2)))*ceil(size(M,2)/floor(sqrt(size(M,2))));
numM = numm-size(M,2);
for i = 1:numM
    M = [M 0];
end
M = reshape(M,[floor(sqrt(size(M,2))),numm/floor(sqrt(size(M,2)))]);
xlswrite('list',M);
end