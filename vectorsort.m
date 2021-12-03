function [DB] = vectorsort(X1,ind)

s=size(ind);
DB=[];

for k=1:s(2)
    DB=[DB X1(:,ind(k))];
    
end
end

