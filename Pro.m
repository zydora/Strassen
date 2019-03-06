function A = Pro(x,y,z)
% Tensor Product
% 3-way
r = size(x,2);
size_x = size(x,1);
size_y = size(y,1);
size_z = size(z,1); sum = zeros(size_x,size_y,size_z);
for i = 1:r
    A = kron(x(:,i),y(:,i)');A = kron(A,z(:,i)');A = reshape(A,[size_x,size_y,size_z]);
    temp = A;
    sum = sum + temp;
end
A = sum;
end
