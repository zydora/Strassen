function C = cover(x,z,c)
C = 0;
for i = 1:size(c,2)
    if x(i) == 1
        m = 1; n = 0;
    elseif x(i) == 0
        m = 0; n = 1;
    end
    if z(i) == 1
        q = 1;
    else
        q = 0;
    end
    C = C+(c(i)*m - c(i)*n)*q;
end
% for i = 1:size(x,2)
%     if x(i)~=z(i)
%         C = C+1;
%     end
% end
end