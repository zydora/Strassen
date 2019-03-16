%% Input of images





%% Encoding of BLK
y = sign(alpha*(A*x+b-m)/theta+gama);
xb = (x+1)/2;
%l = xb;
for i = 1:size(A,1)
    index = find(A(i,:)==1);
    index2 = find(A(i,:)==-1);
    l(i) = sum(x(index))+length(index2)-sum(x(index2));
    C(i) = ceil(theta(i)/alpha(i)*gama(i)*(-1)+m(i)-b(i));
    r(i) = ceil(C(i)/2+sum(A(i,:))/2)+max(size(find(A(i,:)==-1)));
end



%% Encoding of ARGMAX
xd = x+1;
xd = xd/2;
%l = xd;


for i = 1:size(A,1)
    for j = 1:size(A,2)
        index_l1 = find(A(i,:)==1);index_l3 = find(A(i,:)==-1);
        index_l2 = find(A(j,:)==-1);index_l4 = find(A(j,:)==1);
        index = intersect(index_l1,index_l2);
        index2 = intersect(index_l3,index_l4);
        l(i) = sum(xd(index))-sum(xd(index2));
        E(i,j) = ceil((b(j)-b(i)+sum(A(i,:))-sum(A(j,:)))/2);
    end
end








%% MILP Encoding







%% SAT CNF